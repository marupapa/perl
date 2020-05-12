use strict;
use warnings;
my $info = {};

# �t�@�C����
my $file = shift;

# �t�@�C���̃I�[�v��
open my $fh, '<', $file
    or die qq{Can't open file "$file": $!};

# �s�̓ǂݍ���
while (my $line = <$fh>) {

    # �w�b�_���΂�
    next if $. == 1;
    
    # ���s�̍폜
    chomp $line;
    
    # �e��̎擾
    my ($time, $url, $response_time, $size) = split /\s+/, $line;

    # ��
    $info->{$time}{count}++;

    # ���ω������Ԃ̍��v
    $info->{$time}{response_time_total}  += $response_time;

    # �T�C�Y�̍��v
    $info->{$time}{size_total} += $size;
}

# �t�@�C���̃N���[�Y
close $fh;

# �w�b�_�̏o��
my @headers = qw/time count response_time_average size_total/;

print join(',', @headers) . "\n";

# �������ŏo��
foreach my $time (sort keys %$info) {
    # �e���
    my $count = $info->{$time}{count};
    my $response_time_total = $info->{$time}{response_time_total};
    my $size_total = $info->{$time}{size_total};

    # ���ω������Ԃ����߂�
    my $response_time_average = $response_time_total / $count;
    $response_time_average = sprintf("%.1f", $response_time_average);

    # �o�̓��R�[�h
    my @rec = ($time, $count, $response_time_average, $size_total);

    # �o��
    print join(',', @rec) . "\n";
}