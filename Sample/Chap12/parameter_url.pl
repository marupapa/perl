use Mojolicious::Lite;

get '/entry/:date' => sub {
    my $self = shift;

    $self->render;
} => 'entry';

app->start;

__DATA__

@@ entry.html.ep
<html>
    <body>
        <!-- url_for���\�b�h -->
        <%= url_for('entry', date => '20120120') %>
    </body>
</html>
