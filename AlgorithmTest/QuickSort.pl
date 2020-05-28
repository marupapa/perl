use strict;
use warnings;
use diagnostics;

sub main {
    my $number = int <STDIN>;
    my @arr = (); #(1, 10, 5, 8, 7, 6, 4, 3, 2, 9);
    

    for (my $i=0; $i<$number; $i++) {
        $arr[$i] = int <STDIN>;
    }

    my @result = sort {$a <=> $b} @arr;



    #QuickSort(\@arr, 0, $number - 1);

    # print "result @arr";

    #qs(\@arr, 0, $number);

    foreach my $item (@result) {
        print "$item \n";
    }

}

main();


sub QuickSort {
    my ($data, $start, $end) = @_;

    # print ">>>>>>>>>>>>>>> \n";
    #print "data @$data ";
    # print "start > $start  \n";
    # print "end > $end  \n";
    # print ">>>>>>>>>>>>>>> \n";


    print " start:$start ", "end:$end ", "\n";

    if ($start >= $end) {
        return;
    }


    my $key = $start;
    my $i = $start + 1;
    my $j = $end;
    my $temp = 0;

        print " key = $key ", "\n";


    while ($i <= $j) {

        print " data[$i]:@$data[$i]  ", "data[$j]:@$data[$j] ", "key:@$data[$key] ", "\n";



        while ($i <= $end && @$data[$i] <= @$data[$key]) { #키 값보다 큰 값을 만날 때
            $i++;
        }
        while ($j > $start && @$data[$j] >= @$data[$key]) { #키 값보다 작은 값을 만났을 때.
            $j--;
            print "j:$j ", "start:$start ", "@$data[$j] : @$data[$key] ", "\n";
        }

        print " i:$i  ", "j:$j ", "\n";
        if ($i > $j) {
            $temp = @$data[$j];
            @$data[$j] = @$data[$key];
            @$data[$key] = $temp;
        } else {
            $temp = @$data[$i];
            @$data[$i] = @$data[$j];
            @$data[$j] = $temp;
        }
    }

    QuickSort(@$data, $start, $j - 1);
    QuickSort(@$data, $j + 1, $end);

}

sub qs {
    my ($a, $left, $right) = @_;
    my ($i, $j) = ($left, $right);
    my $pivot = $a->[$i];
    while (1) {
        while($a->[$i] < $pivot){ $i++ }
        while($a->[$j] > $pivot){ $j-- }
        last if $i >= $j;
        ($a->[$i], $a->[$j]) = ($a->[$j], $a->[$i]);
        $i++; $j--;
    }

    return if $left >= $right;

    qs($a, $left, $i - 1);
    qs($a, $j + 1, $right);
}

