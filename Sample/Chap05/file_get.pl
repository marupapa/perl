use strict;
use warnings;

# ①モジュールの読み込み
use Net::FTP;
use File::Spec;
use File::Copy 'move';

# ②ダウンロードしたファイルを保存するディレクトリ
my $download_dir = 'c:/tmp';

# ③ファイルのダウンロード
download_files($download_dir);

# ④ファイルを拡張子ごとに分類したディレクトリに移動
categorize_files($download_dir);

# ⑤ファイルをダウンロードするサブルーチン
sub download_files {

    # ⑤-1 ローカルディレクトリ
    my $ldir = shift;

    # ⑤-2 ホスト名
    my $host = 'ftp.riken.jp';

    # ⑤-3 FTPサーバに接続
    my $ftp = Net::FTP->new($host)
      or die qq{Can't connect to "$host": $@};

    # ⑤-4 FTPサーバへログイン
    $ftp->login('anonymous')
      or die qq{Can't login "$host" } . $ftp->message;

    # ⑤-5 ダウンロードしたファイルを保存するディレクトリの作成
    mkdir $ldir unless -d $ldir;

    # ⑤-6 リモートディレクトリ
    my $rdir = '/lang/CPAN/';

    # ⑤-7 リモートディレクトリの移動
    $ftp->cwd($rdir)
      or die qq{Can't change directory "$rdir" } . $ftp->message;

    # ⑤-8 ファイルの取得
    foreach my $file ($ftp->ls) {
        
        # ⑤-9 指定した拡張子にマッチしない場合は飛ばす
        next unless $file =~ /(\.html|\.gz)$/;
        
        # ⑤-10 ファイルを名前をつけて保存
        $ftp->get($file, File::Spec->catfile($ldir, $file))
          or die qq{Can't get file "$file" } . $ftp->message;
    }
}

# ⑥ファイルを拡張子ごとに分類したディレクトリに移動するサブルーチン
sub categorize_files {

    # ⑥-1 ディレクトリ
    my $dir = shift;
    
    # ⑥-2 すべてのファイルを取得
    my @files = glob(File::Spec->catfile($dir, '*'));
    @files = grep { -f $_ } @files;
    
    # ⑥-3 ファイルを拡張子に応じて分類
    my %exts;
    foreach my $file (@files) {
    
        # ⑥-4 拡張子を取得
        my $ext;
        if ($file =~ /\.([^\.]+)$/) {
            $ext = $1;
        }
        
        # ⑥-5 拡張子名を使ってディレクトリを作成
        my $ext_dir = File::Spec->catfile($dir, $ext);
        mkdir $ext_dir unless -d $ext_dir;
        
        # ⑥-6 ファイルを移動
        move $file, $ext_dir
          or die qq{Can't move file "$file" to "$ext_dir": $!};
    }
}