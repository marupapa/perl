use strict;
use warnings;

# �@ファイル
my $file = shift;

# �A使用方法
die "Usage: $0 FILE" unless defined $file;

# �Bファイルのオープン
open my $fh, '<', $file
    or die qq{Can't open file "$file": $!};

# �C時刻ごとのURLのカウント数を格納
my $url_infos = {};

# �DURLの一覧を格納
my $urls = {};

# �E行の読み込み
while (my $line = <$fh>) {
    
    # �E-1 改行の削除
    chomp $line;
    
    # �E-2 時刻とURLの取得
    my ($time, $url) = split /\s+/, $line;
    
    # �E-3 時刻から「時:分」の部分を取得
    my $mtime;
    if ($time =~ /^(\d{2}:\d{2})/) {
        $mtime = $1;
    }
    
    # �E-4 アクセス数をカウントアップ
    $url_infos->{$mtime}{$url}++;
    
    # �E-5 存在するURLを追加
    $urls->{$url} = 1;
}

# �Fファイルのクローズ
close $fh;

# �GURLを昇順で並べ替え
my @urls = sort keys %$urls;

# �HURL（ヘッダ）の出力
print join("\t", 'time', @urls) . "\n";

# �I時刻（分単位）ごとの出力
foreach my $hour (0 .. 23) {
    foreach my $minute (0 .. 59) {
        
        # �I-1 出力レコード
        my @rec;
        
        # �I-2 時刻を「yy:mm」形式にフォーマット
        my $mtime = sprintf("%02d:%02d", $hour, $minute);
        
        # �I-3 時刻をレコードに追加
        push @rec, $mtime;
        
        # �I-4 時刻ごとのURLのカウント数をレコードに追加
        foreach my $url (@urls) {
            my $count = $url_infos->{$mtime}{$url} || 0;
            push @rec, $count;
        }
        
        # �I-5 レコードを出力
        print join("\t", @rec) . "\n";;
    }
}