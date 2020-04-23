use strict;
use warnings;

print "Hello world perl !!!! \n";



sub is_int {
  my $num = shift;
  
  # 値が正の整数でない場合に例外を発生させる
  die "\"$num\" must be number" unless $num =~ /^\d+$/;
}