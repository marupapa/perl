use strict;
use warnings;

my $dir = '/var/xxx';

# �t�@�C���ꗗ�i�f�B���N�g�����܂ށj���擾
my @files = glob("$dir/*");

# CPU�g�p���̃��O������I��
@files = grep { -f $_ && $_ =~ /cpu_\d{8}.log$/ } @files;
