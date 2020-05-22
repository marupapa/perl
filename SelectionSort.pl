use strict;
use warnings;


# selection sort algorithm
# 재일 작은 숫자를 선택해여 순차적으로 맨 앞으로 보내는 정렬.
# 간복잡도 O(n2)

sub main {
    my ($i, $j, $min, $index, $temp) = 0;
    my @array = (1, 5, 4, 6, 8, 3, 2, 7, 9, 10);

    for ($i=0; $i<10; $i++) {
        $min = 999;
        # 변수 min보다 작은 값이 있다면 
        # 값을 스와핑 하기 위해 인덱스값을 저장.
        for ($j=$i; $j<10; $j++) {
            if ($min > $array[$j]) {
                $min = $array[$j];
                $index = $j;
            }
        }
        $temp = $array[$i];
        $array[$i] = $array[$index];
        $array[$index] = $temp;
    }

    print @array;
}

main();