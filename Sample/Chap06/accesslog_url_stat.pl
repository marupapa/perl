use strict;
use warnings;

my $info = {};

# �s�̓ǂݍ���
while (my $line = <>) {

    # �w�b�_���΂�
    next if $. == 1;

    # ���s�̍폜
    chomp $line;

    # �e��̎擾
    my ($time, $url, $response_time, $size) = split /\s+/, $line;

    # ��
    $info->{$url}{count}++;

    # ���ω������Ԃ̍��v
    $info->{$url}{response_time_total} += $response_time;

    # �T�C�Y�̍��v
    $info->{$url}{size_total} += $size;
}

# ���ω������Ԃƕ��σT�C�Y�����߂�
foreach my $url (keys %$info) {

    # �e���
    my $count = $info->{$url}{count};
    my $response_time_total = $info->{$url}{response_time_total};
    my $size_total = $info->{$url}{size_total};

    # ���ω������Ԃ����߂�
    my $response_time_average = $response_time_total / $count;
    $response_time_average = sprintf("%.1f",$response_time_average);
    $info->{$url}{response_time_average} = $response_time_average;

    # ���σT�C�Y�����߂�
    my $size_average = $size_total / $count;
    $size_average = sprintf("%.1f", $size_average);
    $info->{$url}{size_average} = $size_average;
}

# �w�b�_�̏o��
my @headers = qw/url count response_time_average size_average/;
print join("\t", @headers) . "\n";

# ���ω������Ԃ̍~����URL����ёւ�
my @urls = sort { $info->{$b}{response_time_average} <=>
        $info->{$a}{response_time_average} } keys %$info;

# �o��
foreach my $url (@urls) {

    # �o�̓��R�[�h
    my @rec = (
        $url,
        $info->{$url}{count},
        $info->{$url}{response_time_average},
        $info->{$url}{size_average}
    );

    # �o��
    print join("\t", @rec) . "\n";
}
