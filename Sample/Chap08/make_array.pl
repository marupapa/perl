use strict;
use warnings;
# use Data::Dumper 'Dumper';

# �@2�����z��
my $records = [];

# �A�e�s�̏���
while (my $line = <>) {
    
    # �A-1 ���s���폜
    chomp $line;
    
    # �A-2 �擪�̋󔒂��폜
    $line =~ s/^\s+//;
    
    # �A-3 ���R�[�h���쐬
    my @record = split(/\s+/, $line);
    
    # �A-4 2�����z��ɒǉ�
    push @$records, \@record;
}

# print Dumper $records;