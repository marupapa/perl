use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;

    # �@�e���v���[�g�Ƀp�����[�^��n��
    $self->render(country => 'Japan', age => 19);
} => 'entry';

app->start;

__DATA__

@@ entry.html.ep
<html>
    <body>
        <!-- �A�p�����[�^�̗��p -->
        Country: <%= $country %><br>
        Age: <%= $age %>
    </body>
</html>
