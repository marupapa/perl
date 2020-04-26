use strict;
use warnings;

use Time::Piece;
use Time::Seconds;

my $t = Time::Piece->strptime('2018-01-01', '%Y-%m-%d');

my $t1 = $t + ONE_DAY;
my $t2 = $t + ONE_MONTH;
my $t3 = $t + ONE_YEAR;

print $t . "\n";
print $t1 . "\n";
print $t2 . "\n";
print $t3 . "\n";