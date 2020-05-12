# stack

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

