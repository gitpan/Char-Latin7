# This file is encoded in Latin-7.
die "This file is not encoded in Latin-7.\n" if q{��} ne "\x82\xa0";

use Char::Latin7;

print "1..12\n";

# eval "..." has eval "..."
if (eval Char::Latin7::escape " eval Char::Latin7::escape \" if ('��' =~ /[��]/i) { return 1 } else { return 0 } \" ") {
    print qq{ok - 1 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 1 $^X @{[__FILE__]}\n};
}

# eval "..." has eval qq{...}
if (eval Char::Latin7::escape " eval Char::Latin7::escape qq{ if ('��' =~ /[��]/i) { return 1 } else { return 0 } } ") {
    print qq{ok - 2 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 2 $^X @{[__FILE__]}\n};
}

# eval "..." has eval '...'
if (eval Char::Latin7::escape " eval Char::Latin7::escape ' if (qq{��} =~ /[��]/i) { return 1 } else { return 0 } ' ") {
    print qq{ok - 3 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 3 $^X @{[__FILE__]}\n};
}

# eval "..." has eval q{...}
if (eval Char::Latin7::escape " eval Char::Latin7::escape q{ if ('��' =~ /[��]/i) { return 1 } else { return 0 } } ") {
    print qq{ok - 4 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 4 $^X @{[__FILE__]}\n};
}

# eval "..." has eval $var
my $var = q{q{ if ('��' =~ /[��]/i) { return 1 } else { return 0 } }};
if (eval Char::Latin7::escape " eval Char::Latin7::escape $var ") {
    print qq{ok - 5 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 5 $^X @{[__FILE__]}\n};
}

# eval "..." has eval (omit)
$_ = "if ('��' =~ /[��]/i) { return 1 } else { return 0 }";
if (eval Char::Latin7::escape " eval Char::Latin7::escape ") {
    print qq{ok - 6 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 6 $^X @{[__FILE__]}\n};
}

# eval "..." has eval {...}
if (eval Char::Latin7::escape " eval { if ('��' =~ /[��]/i) { return 1 } else { return 0 } } ") {
    print qq{ok - 7 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 7 $^X @{[__FILE__]}\n};
}

# eval "..." has "..."
if (eval Char::Latin7::escape " if ('��' =~ /[��]/i) { return \"1\" } else { return \"0\" } ") {
    print qq{ok - 8 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 8 $^X @{[__FILE__]}\n};
}

# eval "..." has qq{...}
if (eval Char::Latin7::escape " if ('��' =~ /[��]/i) { return qq{1} } else { return qq{0} } ") {
    print qq{ok - 9 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 9 $^X @{[__FILE__]}\n};
}

# eval "..." has '...'
if (eval Char::Latin7::escape " if ('��' =~ /[��]/i) { return '1' } else { return '0' } ") {
    print qq{ok - 10 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 10 $^X @{[__FILE__]}\n};
}

# eval "..." has q{...}
if (eval Char::Latin7::escape " if ('��' =~ /[��]/i) { return q{1} } else { return q{0} } ") {
    print qq{ok - 11 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 11 $^X @{[__FILE__]}\n};
}

# eval "..." has $var
my $var1 = 1;
my $var0 = 0;
if (eval Char::Latin7::escape " if ('��' =~ /[��]/i) { return $var1 } else { return $var0 } ") {
    print qq{ok - 12 $^X @{[__FILE__]}\n};
}
else {
    print qq{not ok - 12 $^X @{[__FILE__]}\n};
}

__END__
