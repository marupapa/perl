use JSON 'decode_json';

my $data = decode_json(get_content('conf.json'));

# �t�@�C���̓��e���擾����֐�
sub get_content {
    my $file = shift;

    open my $fh, '<', $file
        or die qq{Can't open file "$file": $!};

    return join '', <$fh>;
}