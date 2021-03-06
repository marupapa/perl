use strict;
use warnings;

# �@ライブラリのパスの追加
use FindBin;
use lib "$FindBin::Bin/lib";

# �Aモジュールの読み込み
use MemoryLog::Parser;
use Data::Dumper 'Dumper';

# �Bファイル
my $file = shift;

# �CMemoryLog::Parserオブジェクトの生成
my $parser = MemoryLog::Parser->new(total_memory => 60000);

# �Dファイルの解析
my $mem_infos = $parser->parse($file);

# �Eデータの出力
print Dumper $mem_infos;