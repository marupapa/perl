# 構文の間違いを自動的にチェック
use strict;
use warnings;

my @nums = (5, 11, 3, 2);
@nums = sort {$b <=> $a} @nums;
print @nums