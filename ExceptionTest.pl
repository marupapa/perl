use strict;
use warnings;

# 例外をキャッチ
eval { is_int('a') };

# 例外が発生した場合の処理
if ($@) {
  print "Exception occur: $@";
}

sub is_int {
  my $num = shift;
  
  # 値が正の整数でない場合に例外を発生させる
  die "\"$num\" >>>>>> must be number." unless $num =~ /^\d+$/;
}