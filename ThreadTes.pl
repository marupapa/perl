#!/opt/local/bin/perl
 
use strict;
use warnings;
use utf8;
use threads;
use Time::HiRes;
 
print "Content-type: text/html; charset=utf-8\n\n";
 
my $threads = sub
{
    my $name = shift;
    for ('A' .. 'E')
    {
        print +("${name} - ${_}"), "\n";
        Time::HiRes::sleep(0.1);
        threads->yield();
    }
};
 
my $first  = threads->new(\&$threads, "1");
my $second = threads->new(\&$threads, "2");
my $third  = threads->new(\&$threads, "3");
my $fourth = threads->new(\&$threads, "4");
my $fifth  = threads->new(\&$threads, "5");
 
$first->join;
$second->join;
$third->join;
$fourth->join;
$fifth->join;
 
exit;