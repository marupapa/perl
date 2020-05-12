use Mojolicious::Lite;

# �@�t�H�[����HTML�̕`��
get '/' => 'index';

post '/create' => sub {
    my $self = shift;

    # �APOST���\�b�h�ő��M���ꂽ�p�����[�^�̎擾
    my $params = $self->req->body_params->to_hash;
    my $name   = $params->{country};
    my $age    = $params->{age};

    $self->render_text("name:$name; " . "age:$age;");
} => 'create';

app->start;

__DATA__

# �B�t�H�[�����M�̂��߂�HTML
@@ index.html.ep
<html>
    <body>
        <form method="post"
              action="<%= url_for('create') %>">
            Country:<input type="text" name="country" ><br>
            Age:<input type="text" name="age" ><br>
            <input type="submit" value="Send" >
        </form>
    </body>
</html>