use strict;
use warnings;

my $message = 'Hello';
my @nums = (1, 2, 3);
my %scores = (math => 80, english => 77);

my $twice = twice(5);

# �u���[�N�|�C���g
$DB::single = 1;

foreach my $num (@nums) {
    
    # �����t���u���[�N�|�C���g
    if ($num == 2) { $DB::single = 1 }
    print "$num\n";
}

sub twice {
    my $num = shift;
    
    return $num * 2;
}
