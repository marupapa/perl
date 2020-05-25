use strict;
use warnings;
use utf8;

print "入力してください。";

my $line = <STDIN>;
print "入力された値 : $line";

# binmode STDIN, ':encoding(cp932)';
# binmode STDOUT, ':encoding(cp932)';
# binmode STDERR, ':encoding(cp932)';


# print "while文による繰り返し¥n";

# while (my $line = <STDIN>){
#   chomp($line);
#   print "$line¥n";
# }

# print "for文による繰り返し¥n";

# for (;<STDIN>;){
#   chomp($_);
#   print "$_¥n";
# }

# print "終了しました¥n";