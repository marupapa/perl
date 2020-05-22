use strict;
use warnings;

# insertion sort
# 時間複雑度 O(n2)

# 적절한 위치에 삽입.
# 선택정렬, 버블정렬과 비교하여 가장 효율적인 알고리즘.

# sub main {
#     my ($i, $j, $temp) = 0;
#     my @array = (1, 5, 4, 6, 8, 3, 2, 7, 9, 10);

#     $temp = 0;
#     for ($i=0; $i<10; $i++) {
#         $j = $i;
#         while ($j > 0 && $array[$j] > $array[$j+1]) {
#             $temp = $array[$j+1];
#             $array[$j+1] = $array[$j];
#             $array[$j] = $temp;
#             $j--;
#         }
#     }
#     print @array;
# }

# main();


sub insertion_sort {
    my (@list) = @_;
    foreach my $i (1 .. $#list){
	    my $j = $i;
	    my $tmp = $list[$i];
    	while ($j >0 && $tmp < $list[$j-1]){
    		$list[$j] = $list[$j-1];
    		$j --;
		}
		$list[$j]=$tmp;

	}
	return @list;
}

my @test = &insertion_sort(1,2,-1,3,0);
print "@test\n";
