# �@大事な約束：文法のチェック（必ず記述する）
use strict;
use warnings;

# �A変数の宣言と代入：英語と数学の点数
my $score_math = 77;
my $score_english = 80;

# �B四則演算：英語と数学の点数の足し算
my $score_total = $score_math + $score_english;

# �C文字列：計算結果を見やすい形式に編集
my $score_list = "Math : $score_math\n" .
                 "English : $score_english\n" .
                 "Total : $score_total\n";

# �Dprint関数：計算結果の出力
print $score_list