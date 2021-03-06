use strict;
use warnings;

use Mojolicious::Lite;

# �@トップページ
get '/' => 'index';

# �A「Hello World!」というデータを取得するためのURL
get '/api/hello' => sub {
    my $self = shift;
    
    # �A-1 JSONとしてデータを描画
    $self->render_json({message => 'Hello World'});
} => 'apihello';

# �Bアプリケーションの開始
app->start;

__DATA__

# �CトップページのHTML
@@ index.html.ep
<html>
  <head>
    <title>ajax application</title>
    
    <!-- �C-1 jQueryの読み込み -->
    <script type="text/javascript" 
            src="http://code.jquery.com/jquery-1.4.4.min.js">
    </script>
  </head>
  <body>

    <script type="text/javascript">
      // �C-2 ページを読み込んだときに実行する関数の登録
      $(document).ready(function () {
      
        // �C-3 ボタンをクリックしたときに実行する関数の登録
        $('input[name="get"]').click(function () {
          
          // �C-4 Webサーバにリクエストを送信
          $.ajax({
            type : "get",
            url : "<%= url_for 'apihello' %>",
            success : function (result) {
            
              // �C-5 Ajax通信が成功した場合に画面にデータを描画
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
    
    <!-- �C-6 ボタン -->
    <input type="button" name="get" value="Get Data">
    
    <!-- �C-7 文字が描画される場所-->
    <div id="display"><div>
  </body>
</html>