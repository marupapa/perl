
use warnings;


sub printRefArrays
{
	my($aRefArray1,$aRefArray2)=@_;

	for(my($tCount1)=0;$tCount1<=($#$aRefArray1);$tCount1++)
	{
		print $$aRefArray1[$tCount1];
	}

	print "\n";

	for(my($tCount1)=0;$tCount1<=($#$aRefArray2);$tCount1++)
	{
		print $$aRefArray2[$tCount1];
	}

	print "\n";
}

@tTestArray1=('1','2','3','4','5');
@tTestArray2=('a','b','c','d','e');

&printRefArrays(\@tTestArray1,\@tTestArray2);