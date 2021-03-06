use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;

    # �@テンプレートの描画
    $self->render;
} => 'index'; # �Aルート名

app->start;

# �Bテンプレート
__DATA__

@@ index.html.ep
<html>
    <body>
        Hello!
    </body>
</html>

=pod

@@ index.html.ep
<html>
    <body>
% foreach my $num (0 .. 4) {
    Hello<br>
% }
    </body>
</html>

@@ index.html.ep
<html>
    <body>
<% foreach my $num (0 .. 4) { %>
   Hello<br>
<% } %>
    </body>
</html>

@@ index.html.ep
<html>
    <body>
        Total: <%= 1 + 2 %>
    </body>
</html>

@@ index.html.ep
<html>
    <body>
% my @fruits = ('apple', 'orange', 'grape');
% foreach my $fruit (@fruits) {
    <%= $fruit %><br>
% }
    </body>
</html>

@@ index.html.ep
<html>
    <body>
        <%= b('<h1>Hello</h1>') %>
    </body>
</html>
=cut

