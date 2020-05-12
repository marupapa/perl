use strict;
use warnings;

# �@�n�b�V���̐錾�Ƒ���F�e���Ȃ̓_��
my %scores = (math => 55, english => 70, japanese => 100);

# �������ʂ̕\��
foreach my $subject (keys %scores) {
    # �e�Ȗڂ̓_��
    my $score = $scores{$subject};

    # �A����\���F80�_�ȏ�̏ꍇ�́ugood�v
    if ($score >= 80) {
        print "$subject : good\n";
    }
    # �A����\��60�_�ȏ�̏ꍇ�́upass�v
    elsif ($score >= 60) {
        print "$subject : pass\n";
    }
    # �A����\������ȊO�̏ꍇ�́ufailed�v
    else {
        print "$subject : failed\n";
    }
}