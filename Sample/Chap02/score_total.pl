# �@�厖�Ȗ񑩁F���@�̃`�F�b�N�i�K���L�q����j
use strict;
use warnings;

# �A�ϐ��̐錾�Ƒ���F�p��Ɛ��w�̓_��
my $score_math = 77;
my $score_english = 80;

# �B�l�����Z�F�p��Ɛ��w�̓_���̑����Z
my $score_total = $score_math + $score_english;

# �C������F�v�Z���ʂ����₷���`���ɕҏW
my $score_list = "Math : $score_math\n" .
                 "English : $score_english\n" .
                 "Total : $score_total\n";

# �Dprint�֐��F�v�Z���ʂ̏o��
print $score_list