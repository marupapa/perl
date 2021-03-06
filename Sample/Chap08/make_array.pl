use strict;
use warnings;
# use Data::Dumper 'Dumper';

# �@2次元配列
my $records = [];

# �A各行の処理
while (my $line = <>) {
    
    # �A-1 改行を削除
    chomp $line;
    
    # �A-2 先頭の空白を削除
    $line =~ s/^\s+//;
    
    # �A-3 レコードを作成
    my @record = split(/\s+/, $line);
    
    # �A-4 2次元配列に追加
    push @$records, \@record;
}

# print Dumper $records;