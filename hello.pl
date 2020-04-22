use strict;
use warnings;

print "Hello hyuk lee \n";

my $cnt = 0;

while ($cnt <= 5) {
    #redo演算子が実行された場合,この位置に進む
    $cnt++;

    if ($cnt == 6) {
        redo;
    }

    print "$cnt\n";
}