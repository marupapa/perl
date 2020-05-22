use strict;
use warnings;

sub Soultion {
    my $answer = "";
    my @param = @_;

    my @answerArr = ();

    print "start >> @param \n";

    for (my $i=0; $i<@param-1; $i++)
    {
        for (my $j=1; $j<@param; $j++)
        {
            #print " >>>> $i <> $j\n";
            print " #### $param[$i] <> $param[$j] \n";



            # if (int($param[$i]) < int($param[$j]))
            # {
            #     print " >>>> @param \n";
            #     my $temp = $param[$i];
            #     $param[$i] = $param[$j];
            #     $param[$j] = $temp;

            #     print " <<<< @param \n";
            #     print " <<<< \n";
            # }



            # my $temp1 = substr $param[$i], 0, 1;
            # my $temp2 = substr $param[$j], 0, 1;

            # if (int($temp1) < int($temp2))
            # {
            #     # print " >>>>  $param[$i], $param[$j] \n";
            #     # print " >>>>  $temp1, $temp2 \n";

            #     print " >>>> @param \n";
            #     my $temp = $param[$i];
            #     $param[$i] = $param[$j];
            #     $param[$j] = $temp;

            #     print " <<<< @param \n";
            # }
            #print " >>>> @param \n";
        }


        # if ($temp1 < $temp2)
        # {
        #     my $temp = $param[$i-1];
        #     $param[$i-1] = $param[$i];
        #     $param[$i] = $temp;
        # }

    }

    $answer = join '', @param;

    return $answer;
}


#my @testParam = (3, 30, 34, 5, 9);
my @testParam = (1,2,3,4,5,6);
Soultion(@testParam);