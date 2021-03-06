use Net::FTP;

my $host = 'somehost';

# �@FTPサーバへの接続
my $ftp = Net::FTP->new($host)
    or die qq{Can't connect to "$host": $!};
# �Aユーザ名とパスワードを指定してログイン
$ftp->login('user', 'password')
    or die qq{Can't login "$host": } . $ftp->message;

# �Bファイルのダウンロード
$ftp->get('/dir/somefile')
    or die "FTP command fail: " . $ftp->message;

# �C接続の終了
$ftp->quit;