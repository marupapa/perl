use strict;
use warnings;

# �@�z��̐錾�ƃR�}���h���C�������̎󂯎��
my @nums = @ARGV;

# �Aforeach���F�a�̌v�Z
my $total;
foreach my $num (@nums) {
    $total += $num;
}

# �a�̏o��
print "Total:$total\n";