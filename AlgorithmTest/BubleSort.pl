use strict;
use warnings;

# buble sort
# 배열의 바로 옆 요소와 비교하여 가장 큰 숫자를 맨 뒤로 보내는 정렬.
# 가장 비효율적인 알고리즘.

sub main {
    my ($i, $j, $temp) = 0;
    my @array = (1, 5, 4, 6, 8, 3, 2, 7, 9, 10);

    for ($i=0; $i<10-$i; $i++) {
        for ($j=0; $j<9; $j++) {
            if ($array[$j] > $array[$j+1]) {
                $temp = $array[$j+1];
                $array[$j+1] = $array[$j];
                $array[$j] = $temp;
            }
        }
    }
    print @array
}

main();
