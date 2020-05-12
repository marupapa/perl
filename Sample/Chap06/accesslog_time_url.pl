use strict;
use warnings;

# �@�t�@�C��
my $file = shift;

# �A�g�p���@
die "Usage: $0 FILE" unless defined $file;

# �B�t�@�C���̃I�[�v��
open my $fh, '<', $file
    or die qq{Can't open file "$file": $!};

# �C�������Ƃ�URL�̃J�E���g�����i�[
my $url_infos = {};

# �DURL�̈ꗗ���i�[
my $urls = {};

# �E�s�̓ǂݍ���
while (my $line = <$fh>) {
    
    # �E-1 ���s�̍폜
    chomp $line;
    
    # �E-2 ������URL�̎擾
    my ($time, $url) = split /\s+/, $line;
    
    # �E-3 ��������u��:���v�̕������擾
    my $mtime;
    if ($time =~ /^(\d{2}:\d{2})/) {
        $mtime = $1;
    }
    
    # �E-4 �A�N�Z�X�����J�E���g�A�b�v
    $url_infos->{$mtime}{$url}++;
    
    # �E-5 ���݂���URL��ǉ�
    $urls->{$url} = 1;
}

# �F�t�@�C���̃N���[�Y
close $fh;

# �GURL�������ŕ��בւ�
my @urls = sort keys %$urls;

# �HURL�i�w�b�_�j�̏o��
print join("\t", 'time', @urls) . "\n";

# �I�����i���P�ʁj���Ƃ̏o��
foreach my $hour (0 .. 23) {
    foreach my $minute (0 .. 59) {
        
        # �I-1 �o�̓��R�[�h
        my @rec;
        
        # �I-2 �������uyy:mm�v�`���Ƀt�H�[�}�b�g
        my $mtime = sprintf("%02d:%02d", $hour, $minute);
        
        # �I-3 ���������R�[�h�ɒǉ�
        push @rec, $mtime;
        
        # �I-4 �������Ƃ�URL�̃J�E���g�������R�[�h�ɒǉ�
        foreach my $url (@urls) {
            my $count = $url_infos->{$mtime}{$url} || 0;
            push @rec, $count;
        }
        
        # �I-5 ���R�[�h���o��
        print join("\t", @rec) . "\n";;
    }
}