use strict;
use warnings;

# �t�@�C������1�s���ǂݍ���
while (my $line = <>) {

    # �s�̐擪�����s�ł���ꍇ�͓ǂݔ�΂�
    next if $line =~ /^\n/;

    # �o��
    print $line;
}