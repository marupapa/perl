package MemoryLog::Parser;

use strict;
use warnings;

# �@���N���X�̌p��
use base 'Object::Simple';

# �A���W���[���̓ǂݍ���
use Carp 'croak';

# �B�A�N�Z�T�̒�`
__PACKAGE__->attr('total_memory');
__PACKAGE__->attr(header_exists => 1);

# �C�t�@�C������͂��郁�\�b�h
sub parse {
    my ($self, $file) = @_;
    
    # �C-1 �t�@�C���̃I�[�v��
    open my $fh, '<', $file
      or die qq{Can't open file "$file": $!};
    
    # �C-2 �������g�p���̏��
    my $infos = [];
    
    # �C-3 �e�s�̓ǂݍ���
    while (my $line = <$fh>) {
        
        # �C-4 �w�b�_�����݂���Ƃ���1�s�ڂ��΂�
        next if $. == 1 && $self->header_exists;
        
        # �C-5 ���s�̍폜
        chomp $line;
        
        # �C-6 �����ƃ������g�p�ʂ��擾
        my ($time, $avm) = split /\s+/, $line;
        
        # �C-7 �������̑���
        my $total_memory = $self->total_memory;
        
        # �C-8 �������̑��ʂ��擾�ł��Ȃ��Ƃ��͗�O�𓊂���
        croak "total_memory must be specify"
          unless defined $total_memory;
        
        # �C-9 �������g�p��
        my $mem = $avm / $total_memory;
        
        # �C-10 ����ǉ�
        push @$infos, {time => $time, mem => $mem};
    }
    
    # �D�t�@�C���̃N���[�Y
    close $fh;

    return $infos;
}

# �E�^�̒l��ԋp
1;