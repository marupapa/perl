use strict;
use warnings;

# �@���W���[���̓ǂݍ���
use Time::Local 'timelocal';
use Getopt::Long 'GetOptions';

# �A�g�p���@
my $usage = "Usage: $0 --start=yyyymmdd:hhmmss --end=yyyymmdd:hhmmss FILE";

# �B�R�}���h���C���I�v�V����
my $start = '';
my $end   = '';
GetOptions(
    'start=s' => \$start,
    'end=s'   => \$end
) or die $usage;


# �C�����̃t�H�[�}�b�g
my $format = qr/^(\d{4})(\d{2})(\d{2}):(\d{2})(\d{2})(\d{2})$/;

# �D�J�n�����i�G�|�b�N�b�j
my $start_epoch;
if ($start =~ /$format/) {
    my $year = $1;
    my $mon  = $2;
    my $mday = $3;
    
    my $hour = $4;
    my $min  = $5;
    my $sec  = $6;
    
    $start_epoch = timelocal($sec, $min, $hour, 
                             $mday, $mon - 1, $year - 1900);
}

# �E�I�������i�G�|�b�N�b�j
my $end_epoch;
if ($end =~ /$format/) {
    my $year = $1;
    my $mon  = $2;
    my $mday = $3;
    
    my $hour = $4;
    my $min  = $5;
    my $sec  = $6;
    
    $end_epoch = timelocal($sec, $min, $hour, 
                           $mday, $mon - 1, $year - 1900);
}

# �F�t�@�C��
my $file = shift;

# �G�g�p���@�̕\��
die $usage
  unless $start && $end && $file;

# �H�t�@�C���I�[�v��
open my $fh, '<', $file
  or die qq{Can't open file "$file": $!};

# �I�s�̓ǂݍ���
while (my $line = <$fh>) {

    # �I-1 ���s�̍폜
    chomp $line;
    
    # �I-2 �G�|�b�N�b�ɕϊ�
    my $epoch;
    if ($line =~ m#^(\d{4})/(\d{2})/(\d{2}),(\d{2}):(\d{2}):(\d{2})$#) {
        my $year = $1;
        my $mon  = $2;
        my $mday = $3;
        
        my $hour = $4;
        my $min  = $5;
        my $sec  = $6;
        
        $epoch = timelocal($sec, $min, $hour, 
                           $mday, $mon - 1, $year - 1900);
    }
    
    # �I-3 �s���ȃt�H�[�}�b�g
    die qq{Unexpected format: "$line"}
      unless defined $epoch;
    
    # �I-4 �}�b�`���鎞���̍s�݂̂��o��
    print "$line\n"
      if $epoch >= $start_epoch && $epoch < $end_epoch;
}

# �J�t�@�C���N���[�Y
close $fh;