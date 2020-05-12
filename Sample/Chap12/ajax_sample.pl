use strict;
use warnings;

use Mojolicious::Lite;

# �@�g�b�v�y�[�W
get '/' => 'index';

# �A�uHello World!�v�Ƃ����f�[�^���擾���邽�߂�URL
get '/api/hello' => sub {
    my $self = shift;
    
    # �A-1 JSON�Ƃ��ăf�[�^��`��
    $self->render_json({message => 'Hello World'});
} => 'apihello';

# �B�A�v���P�[�V�����̊J�n
app->start;

__DATA__

# �C�g�b�v�y�[�W��HTML
@@ index.html.ep
<html>
  <head>
    <title>ajax application</title>
    
    <!-- �C-1 jQuery�̓ǂݍ��� -->
    <script type="text/javascript" 
            src="http://code.jquery.com/jquery-1.4.4.min.js">
    </script>
  </head>
  <body>

    <script type="text/javascript">
      // �C-2 �y�[�W��ǂݍ��񂾂Ƃ��Ɏ��s����֐��̓o�^
      $(document).ready(function () {
      
        // �C-3 �{�^�����N���b�N�����Ƃ��Ɏ��s����֐��̓o�^
        $('input[name="get"]').click(function () {
          
          // �C-4 Web�T�[�o�Ƀ��N�G�X�g�𑗐M
          $.ajax({
            type : "get",
            url : "<%= url_for 'apihello' %>",
            success : function (result) {
            
              // �C-5 Ajax�ʐM�����������ꍇ�ɉ�ʂɃf�[�^��`��
              $("#display").text(result.message);
            },
            dataType : "json"
          });
        });
      });
    </script>
    
    <style type="text/css">
      #display {
        font-size: 200%
      }
    </style>
    
    <h1>Ajax application</h1>
    
    <!-- �C-6 �{�^�� -->
    <input type="button" name="get" value="Get Data">
    
    <!-- �C-7 �������`�悳���ꏊ-->
    <div id="display"><div>
  </body>
</html>