use strict;
use warnings;
use utf8;

use Encode 'decode';

# �R�}���h���C�������iUTF-8�o�C�g������j
my $byte_str = shift;

# UTF-8�o�C�g����������������Ƀf�R�[�h
my $internal_str = decode('UTF-8', $byte_str);

# ������̒���
my $length = length $internal_str;
print "length: $length\n";

# �����񃊃e����
my $internal_str2 = '����';

# ���K�\��
if ($internal_str =~ /$internal_str2/) {
    print "Match!\n";
}