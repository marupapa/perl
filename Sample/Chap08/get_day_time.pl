use strict;
use warnings;

# ���t�Ǝ���
my $datetime = '2010/12/01 10:54:33';

my $year;
my $month;
my $mday;

my $hour;
my $minute;
my $second;

# �N�����A�����b���擾

my $regex = '(��d{4})��/(��d{2})��/(��d{2})��s+(��d{2}):(��d{2}):(��d{2})';

if ($datetime =~ /$regex/) {
    $year = $1;
    $month = $2;
    $mday = $3;

    $hour = $4;
    $minute = $5;
    $second = $6;
}

# ���K�\�����}�b�`���Ȃ������ꍇ�͌x����\��
else {
    warn "\"$datetime\" is invalid format";
}