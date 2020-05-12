=head1 NAME

get_match_line.pl

=head1 SYNOPSIS

perl get_match_line.pl FILE STRING

=head1 DESCRIPTION

���̃X�N���v�g�͓���̕�������܂ލs�����o���܂��B

=cut

use strict;
use warnings;

my ($file, $match) = @ARGV;

# �g�p���@
die "Usage: $0 FILE STRING" unless $file && $match;

# �}�b�`�����s���o��
print_match_line($file, $match);

sub print_match_line {
    my ($file, $match) = @_;

    # �t�@�C���̃I�[�v��
    open my $fh, '<', $file
      or die qq{Can't open file: "$file": $!};

    # �t�@�C���̓ǂݍ���
    while (my $line = <$fh>) {
        
        # �}�b�`�����s���o��
        print $line if index($line, $match) > -1;
    }

    # �t�@�C���̃N���[�Y
    close $fh;
}
