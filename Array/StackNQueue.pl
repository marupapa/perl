# stack
print "stack start \n";
my @valuesStack = ();

push @valuesStack, 1;
push @valuesStack, 2;
push @valuesStack, 3;

#stackがなくなるまで繰り返し。
while (scalar(@valuesStack) > 0) {
    my $value = pop(@valuesStack);
    print "$value \n";
}

#queue
print "queue start \n";
my @valuesQ = ();

push @valuesQ, 1;
push @valuesQ, 2;
push @valuesQ, 3;

while (scalar(@valuesQ) > 0) {
    my $value = shift(@valuesQ);
    print "$value \n"
}



