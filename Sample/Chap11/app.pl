use strict;
use warnings;

# �@Mojolicious::Lite�̓ǂݍ���
use Mojolicious::Lite;

# �AURL�Ƃ���ɑΉ����鏈��
get '/' => sub {
    # �B�R���g���[���I�u�W�F�N�g�̎擾
    my $self = shift;

    # �C�e�L�X�g�̕`��
    $self->render_text('Hello!');
};

# �DWeb�A�v���P�[�V�����̊J�n
app->start;
