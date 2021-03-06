use strict;
use warnings;

use Scalar::Util 'looks_like_number';

# �@コマンドライン引数の受け取り
my @nums = @ARGV;

# �A引数が数値がどうかのチェック
foreach my $num (@nums) {
    die "Arguments must be numbers"
      unless looks_like_number($num);
}

# �B最大値を求める
my $max = max(@nums);

# �C最小値を求める
my $min = min(@nums);

# �D結果の出力
print "max: $max\n" . 
      "min:$min\n";

# �E最大値を求めるサブルーチン
sub max {
    my @nums = @_;

    # �E-1 最大値を求める
    my $max;
    foreach my $num (@nums) {
        $max = $num  if !defined $max || $num > $max;
    }
    return $max;
}

# �F最小値を求めるサブルーチン
sub min {
    my @nums = @_;

    # �F-1 最小値を求める
    my $min;
    foreach my $num (@nums) {
        $min = $num  if !defined $min || $num < $min;
    }
    return $min;
}