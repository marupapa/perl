use strict;
use warnings;

# selection sort algorithm
# 재일 작은 숫자를 선택해여 순차적으로 맨 앞으로 보내는 정렬.
# 간복잡도 O(n2)

# sub main {
#     my ($i, $j, $min, $index, $temp) = 0;
    
#     my @array = @_;  #(1, 5, 4, 6, 8, 3, 2, 7, 9, 10);
#     my $length = scalar @array;

#     for ($i=0; $i<$length; $i++) {
#         $min = 999;
#         # 변수 min보다 작은 값이 있다면 
#         # 값을 스와핑 하기 위해 인덱스값을 저장.
#         for ($j=$i; $j<$length; $j++) {
#             if ($min > $array[$j]) {
#                 $min = $array[$j];
#                 $index = $j;
#             }
#         }
#         $temp = $array[$i];
#         $array[$i] = $array[$index];
#         $array[$index] = $temp;
#     }

#     print @array;
# }


my $len = 0;
my @array = ();

$len = <STDIN>;
for (my $i = 0; $i < $len; $i++) {
    $array[$i] = <STDIN>;
}

#main(@arr);


my ($i, $j, $min, $index, $temp) = 0;
my $length = scalar @array;

for ($i=0; $i<$length; $i++) {
    $min = 1001;
    # 변수 min보다 작은 값이 있다면 
    # 값을 스와핑 하기 위해 인덱스값을 저장.
    for ($j=$i; $j<$length; $j++) {
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