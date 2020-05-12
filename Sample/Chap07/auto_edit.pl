use strict;
use warnings;
use FindBin;
use File::Spec;
use XML::Simple;
use File::Basename 'fileparse';

# ���t
my $date = shift || '';
die "Usage: $0 yyyymmdd\n" unless $date =~ /^\d{8}$/;

# �ݒ�t�@�C���̓ǂݍ���
my $conf_file = "$FindBin::Bin/auto_edit.xml";
my $xml = XML::Simple->new;
my $conf = $xml->XMLin($conf_file);

# �e�f�B���N�g��
my $home_dir = $conf->{'home-dir'};
my $log_dir = File::Spec->catfile($home_dir, $conf->{'log-dir'});
my $script_dir = File::Spec->catfile($home_dir, $conf->{'script-dir'});

# ���O
my $edit_logs = $conf->{'edit-logs'};
# �e��ނ̃��O�̕ҏW
foreach my $type (keys %$edit_logs) {

    # �Ώۂ̃��O�̎擾
    my $target = File::Spec->catfile($log_dir, $date,
                                     $edit_logs->{$type}->{target});
    my @logs = glob($target);

    # �T�[�o���Ƃ̃��O�̕ҏW
    foreach my $log (@logs) {

        # �X�N���v�g
        my $script = File::Spec->catfile($script_dir,
                                         $edit_logs->{$type}->{script});

        # �o�̓t�@�C��
        my $outdir = File::Spec->catfile($log_dir, $date,
                                         $edit_logs->{$type}->{to});
        my ($outfile_base, $outfile_ext) = (fileparse($log, qr/\..+$/))[0, 2];
        my $outfile = File::Spec->catfile($outdir,
                                          "${outfile_base}_edit$outfile_ext");

        # �R�}���h�̎��s
        my $command = "perl $script $log > $outfile";
        system($command) == 0
            or die qq{system "$command" failed: $?};
    }
}
