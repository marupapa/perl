use strict;
use warnings;

# �@�t�@�C����
my $file = shift;

# �A�g�p���@
die "Usage: $0 FILE"  unless defined $file;

# �B�t�@�C���̃I�[�v��
open my $fh, '<', $file
  or die qq{Can't open file: "$file": $!};

# �C�����̃p�P�b�g�����i�[���邽�߂̔z��̃��t�@�����X
my $packet_infos = [];

# �D�p�P�b�g�����i�[���邽�߂̃n�b�V���̃��t�@�����X
my $packet_info;

# �E�e�s�̏���
while (my $line = <$fh>) {
    
    # �E-1 ���s�̍폜
    chomp $line;
    
    # �E-2 �s���Ƃɏꍇ����
    if ($line =~ /^(\d{2}:\d{2}:\d{2})/) {
        
        # �E-3 �p�P�b�g���̏�����
        $packet_info = {};
        
        # �E-4 ����
        $packet_info->{time} = $1;
    }
    elsif ($line =~ /^packet: (\d+)/) {
        
        # �E-5 �p�P�b�g��
        $packet_info->{packet} = $1;
    }
    elsif ($line =~ /^loss: (\d+)/) {
        
        # �E-6 ���X��
        $packet_info->{loss} = $1;
        
        # �E-7 �p�P�b�g����ǉ�
        push @$packet_infos, $packet_info;
    }
}

# �F�t�@�C���̃N���[�Y
close $fh;

# �G�w�b�_�̏o��
my @headers = qw/time packet loss/;
print join("\t", @headers) . "\n";

# �H�o�͏���
foreach my $packet_info (@$packet_infos) {
    
    # �H-1 ���R�[�h�̍쐬
    my @rec = (
        $packet_info->{time},
        $packet_info->{packet},
        $packet_info->{loss}
    );
    
    # �H-2 �^�u��؂�ŏo��
    print join("\t", @rec) . "\n";
}