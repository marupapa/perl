# �\���̊ԈႢ�������I�Ƀ`�F�b�N
use strict;
use warnings;

# �R�}���h���C�������̎擾
my @nums = @ARGV;

# �a�����߂�T�u���[�`���̌Ăяo��
my $total = sum(@nums);

# �a�̏o��
print "Total\n";
print "$total\n";

# ���v���v�Z����T�u���[�`��
sub sum {
    # �����̎󂯎��
    my @nums = @_;
    
    # �a�̌v�Z
    my $total = 0;
        foreach my $num (@nums) {
        $total += $num;
    }
    # �߂�l
    return $total;
}