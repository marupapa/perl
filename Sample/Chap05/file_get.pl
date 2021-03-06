use strict;
use warnings;

# �@モジュールの読み込み
use Net::FTP;
use File::Spec;
use File::Copy 'move';

# �Aダウンロードしたファイルを保存するディレクトリ
my $download_dir = 'c:/tmp';

# �Bファイルのダウンロード
download_files($download_dir);

# �Cファイルを拡張子ごとに分類したディレクトリに移動
categorize_files($download_dir);

# �Dファイルをダウンロードするサブルーチン
sub download_files {

    # �D-1 ローカルディレクトリ
    my $ldir = shift;

    # �D-2 ホスト名
    my $host = 'ftp.riken.jp';

    # �D-3 FTPサーバに接続
    my $ftp = Net::FTP->new($host)
      or die qq{Can't connect to "$host": $@};

    # �D-4 FTPサーバへログイン
    $ftp->login('anonymous')
      or die qq{Can't login "$host" } . $ftp->message;

    # �D-5 ダウンロードしたファイルを保存するディレクトリの作成
    mkdir $ldir unless -d $ldir;

    # �D-6 リモートディレクトリ
    my $rdir = '/lang/CPAN/';

    # �D-7 リモートディレクトリの移動
    $ftp->cwd($rdir)
      or die qq{Can't change directory "$rdir" } . $ftp->message;

    # �D-8 ファイルの取得
    foreach my $file ($ftp->ls) {
        
        # �D-9 指定した拡張子にマッチしない場合は飛ばす
        next unless $file =~ /(\.html|\.gz)$/;
        
        # �D-10 ファイルを名前をつけて保存
        $ftp->get($file, File::Spec->catfile($ldir, $file))
          or die qq{Can't get file "$file" } . $ftp->message;
    }
}

# �Eファイルを拡張子ごとに分類したディレクトリに移動するサブルーチン
sub categorize_files {

    # �E-1 ディレクトリ
    my $dir = shift;
    
    # �E-2 すべてのファイルを取得
    my @files = glob(File::Spec->catfile($dir, '*'));
    @files = grep { -f $_ } @files;
    
    # �E-3 ファイルを拡張子に応じて分類
    my %exts;
    foreach my $file (@files) {
    
        # �E-4 拡張子を取得
        my $ext;
        if ($file =~ /\.([^\.]+)$/) {
            $ext = $1;
        }
        
        # �E-5 拡張子名を使ってディレクトリを作成
        my $ext_dir = File::Spec->catfile($dir, $ext);
        mkdir $ext_dir unless -d $ext_dir;
        
        # �E-6 ファイルを移動
        move $file, $ext_dir
          or die qq{Can't move file "$file" to "$ext_dir": $!};
    }
}