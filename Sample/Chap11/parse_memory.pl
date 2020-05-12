use strict;
use warnings;

# �@���C�u�����̃p�X�̒ǉ�
use FindBin;
use lib "$FindBin::Bin/lib";

# �A���W���[���̓ǂݍ���
use MemoryLog::Parser;
use Data::Dumper 'Dumper';

# �B�t�@�C��
my $file = shift;

# �CMemoryLog::Parser�I�u�W�F�N�g�̐���
my $parser = MemoryLog::Parser->new(total_memory => 60000);

# �D�t�@�C���̉��
my $mem_infos = $parser->parse($file);

# �E�f�[�^�̏o��
print Dumper $mem_infos;