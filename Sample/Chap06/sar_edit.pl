use strict;
use warnings;

# �t�@�C����
my $file = shift;

# �������Ȃ��ꍇ�i$0�̓X�N���v�g���j
die "Usage: $0 FILE" unless $file;

# �t�@�C���̃I�[�v��
open my $fh, '<', $file
    or die qq{Can't open file "$file": $!};

# ������CPU�̏����i�[����z��̃��t�@�����X
my $cpu_infos = [];

# 1�s���ǂݍ���
while (my $line = <$fh>) {
    # 1�s�ڂ͔�΂��i$.�͌��݂̍s�ԍ��j
    next if $. == 1;

    # ���s�̍폜
    chomp $line;

    # �s�̏���z��ɕϊ�
    my @rec = split /\s+/, $line;

    # CPU�̏����i�[����n�b�V��
    my $cpu_info = {};
    $cpu_info->{time} = $rec[0];
    $cpu_info->{user} = $rec[3];
    $cpu_info->{system} = $rec[5];

    # CPU�̏���ǉ�
    push @$cpu_infos, $cpu_info;
}

# �t�@�C���̃N���[�Y
close $fh;

# �w�b�_�iqw//�͕����񃊃X�g���Z�q�j
my @headers = qw/time %user %system/;

# �w�b�_�̏o��
print join(',', @headers) . "\n";

# CPU�̏��̏o��
foreach my $cpu_info (@$cpu_infos) {

    # ���R�[�h�̏����쐬
    my @rec = (
        $cpu_info->{time},
        $cpu_info->{user},
        $cpu_info->{system}
    );
    # �J���}�ŘA�����ďo��
    print join(',', @rec) . "\n";
}