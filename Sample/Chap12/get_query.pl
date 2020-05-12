use strict;
use warnings;

# Mojolicious::Lite�̓ǂݍ���
use Mojolicious::Lite;

get '/search' => sub {
    my $self = shift;

    # �N�G��������Ɋ܂܂��p�����[�^���n�b�V���̃��t�@�����X�Ƃ��Ď擾
    my $params = $self->req->params->to_hash;
    my $language = $params->{lang};
    my $text = $params->{text};

    $self->render_text("language:$language; " . "text:$text;");
};

# Web�A�v���P�[�V�����̊J�n
app->start;

