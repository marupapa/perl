use strict;
use warnings;

# �t�@�C����
my $file_old = 'xxx.txt';

# �g���q�𕪗�
$file_old =~ /^(.+)(\.[^\.]+)$/;
my $basename = $1;  # xxx
my $ext      = $2;  # .txt

# �V�����t�@�C����
my $file_new = "${basename}_edit.txt";
