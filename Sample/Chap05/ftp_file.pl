use Net::FTP;

my $host = 'somehost';

# �@FTP�T�[�o�ւ̐ڑ�
my $ftp = Net::FTP->new($host)
    or die qq{Can't connect to "$host": $!};
# �A���[�U���ƃp�X���[�h���w�肵�ă��O�C��
$ftp->login('user', 'password')
    or die qq{Can't login "$host": } . $ftp->message;

# �B�t�@�C���̃_�E�����[�h
$ftp->get('/dir/somefile')
    or die "FTP command fail: " . $ftp->message;

# �C�ڑ��̏I��
$ftp->quit;