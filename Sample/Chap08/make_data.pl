use strict;
use warnings;
use Data::Dumper 'Dumper';

# �@�n�b�V���̔z��
my $records = [];

# �A�s�Ƀ}�b�`���鐳�K�\��
my $pattern_re = qr/
    ^                      # �擪
    (\d{4}\/\d{2}\/\d{2})  # ���t
    \s+                    # ��؂�
    (\d{1,2}:\d{2}:\d{2})  # ����
    \s+                    # ��؂�
    "\w+\s+(.+)?"          # URL
    \s+                    # ��؂�
    (\d+\.\d+)             # ��������
    $                      # ����
/x;

# �B�e�s�̏���
while (my $line = <>) {
    
    # �B-1 ���s���폜
    chomp $line;
    
    # �B-2 �n�b�V���̃��t�@�����X���쐬
    my $record = {};
    
    # �B-3 ���K�\�����g���ď����擾
    if ($line =~ /$pattern_re/) {
        $record->{date}     = $1;
        $record->{time}     = $2;
        $record->{url}      = $3;
        $record->{res_time} = $4;
    }
    
    # �B-4 �n�b�V���̔z��ɒǉ�
    push @$records, \$record;
}

print Dumper $records;