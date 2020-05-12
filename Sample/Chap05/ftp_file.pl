use Net::FTP;

my $host = 'somehost';

# ①FTPサーバへの接続
my $ftp = Net::FTP->new($host)
    or die qq{Can't connect to "$host": $!};
# ②ユーザ名とパスワードを指定してログイン
$ftp->login('user', 'password')
    or die qq{Can't login "$host": } . $ftp->message;

# ③ファイルのダウンロード
$ftp->get('/dir/somefile')
    or die "FTP command fail: " . $ftp->message;

# ④接続の終了
$ftp->quit;