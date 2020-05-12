use strict;
use warnings;

use Scalar::Util 'looks_like_number';

# �@�R�}���h���C�������̎󂯎��
my @nums = @ARGV;

# �A���������l���ǂ����̃`�F�b�N
foreach my $num (@nums) {
    die "Arguments must be numbers"
      unless looks_like_number($num);
}

# �B�ő�l�����߂�
my $max = max(@nums);

# �C�ŏ��l�����߂�
my $min = min(@nums);

# �D���ʂ̏o��
print "max: $max\n" . 
      "min:$min\n";

# �E�ő�l�����߂�T�u���[�`��
sub max {
    my @nums = @_;

    # �E-1 �ő�l�����߂�
    my $max;
    foreach my $num (@nums) {
        $max = $num  if !defined $max || $num > $max;
    }
    return $max;
}

# �F�ŏ��l�����߂�T�u���[�`��
sub min {
    my @nums = @_;

    # �F-1 �ŏ��l�����߂�
    my $min;
    foreach my $num (@nums) {
        $min = $num  if !defined $min || $num < $min;
    }
    return $min;
}