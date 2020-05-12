use warnings;

# Mojolicious::Lite�̓ǂݍ���
use Mojolicious::Lite;

get '/entry/:date' => sub {
    my $self = shift;

    my $stash = $self->stash;
    my $date = $stash->{date};

    $self->render_text($date);
};

# Web�A�v���P�[�V�����̊J�n
app->start;
