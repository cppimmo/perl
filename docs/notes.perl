#!/usr/bin/env perl

# This document is a compliation of notes take from following several tutorials
# and reading various bits of documentation. Sources are listed below:
#
# https://perldoc.perl.org/perlintro
# https://perldoc.perl.org/perlrun
# https://perldoc.perl.org/perltoc
#
use strict;
use warnings;

# Comments begin with a hash
print "Hello World!\n";

print
	"Whitespace isn't interpreted!\n"
	;

print "This, however,
	is a linebreak in a quoted string.\n";

print "\"Double quotes.\"\n";
print '\'Or single quotes.\'\n';
# \n escapes interpreted literally!

print 64; # Numbers need not quotes!

# Use parenthesis around function arguments interchangeably.
print("Parenthesis around function args.\n");
print "No parentheis around function args.\n";

# There are three kinds of variables in perl:
# scalars, arrays, and hashes
# More information in |perldata|

# A scalar is a loosely typed single value that can be:
# string, integer, floating point numbers.
my $name = "Brian";
my $num = 64;

# Variables must be declared with the 'my' keyword.
# After the declaration just use the dollar sign in expressions.
# This is a requirement of 'use strict;'.

# Expression examples of scalar variables:
print 'My name is ', $brian, "\n";
print "My name is once again, $brian\n";
print "Square of num is ", $num * $num, "\n";

# The variable $_, is use a default argument to some standard Perl functions.
# It's set implicity by certain looping constructs.

print; # Prints the value of $_;
print "\n"
	
# Arrays are value lists.
my @names = ("Bob", "James", "Linda");
my @numbers = (45, 32, 56);
my @mixed = ("Bob", 43, 10.54);

# @ used to prefix arrays
# $ used to prefix scalars and return scalar values

# Arrays in Perl are zero-indexed.
print $names[0]; print $names[1], "\n";

# Prefixing an existing array variable name with $# (dollar sign, hash) returns
# the length of the array.
print 'Last element of $mixed', $mixed[$#mixed], "\n";

# Using a @(at sign) prefixing an array will return the array length in certain
# contexts.
if (@names < 5) {
	print '$names's length is less than 5', "\n";
}

# Shell-like array indexing expansions.
@names[0,1]; # return first two values
@names[0..2]; # return all values
@names[1..$#names]; # return all except first value

# Array functions sort and reverse:
my @sorted_names = sort @names;
my @reversed_names = reverse @names;

# Unique, built-in arrays:
# @ARGV is, of course, the shell arguments
# @_ values are the the aguments passed to a subroutine
# More information in |perlvar|

# Hashes
# are associative, key-value pair arrays.
my %dog_toys = ("Buddy", "bone", "Clifford", "monkey");

# Use => for a nicer syntax
# my %dog_toys = (
#     Buddy => "bone",
#     Clifford => "monkey",
# );

# Indexing hash values:
$dog_toys{"Buddy"}; # returns "bone"

# Functions: keys() and values() return lists.
my @dogs = keys %dog_toys;
my @toys = values %dog_toys;
# Have a go at sorting the keys/values.

# Unique, built-in hashes:
# %ENV contains environment variables.
# More information in |perlvar|

# References are scalar values that can refer to other Perl data types.
# More information in |perlreftut,perllol,perlref,perdsc|.
# Two-level hash structure constructed of anonymous hash references:
my $hash = {
	scalar => {
		desc => 'Single entry',
		prefix => '$',
	},
	array => {
		desc => 'Ordered list of entries',
		prefix => '@',
	},
	hash => {
		desc => 'Key, value pairs',
		prefix => '%',
	},
};

print "Scalars are prefixed with $hash->{'scalar'}->{'prefix'}\n";

# Scope
# The absence of the my keyword when first declaring variables will cause that
# variable to enter global scope. The 'my' keyword creates lexically scoped
# variables much like that of 'local' in Lua.
# Local:
my $variable = "something";
# Global:
my $variable2 ="something else";

# Local variables retain block scope in parenthesis.
# Use of the 'my' keyword in combination with the 'use strict;' declaration will
# let the interperter spot common errors.

# Conditionals and Loops
# if
if (0) {

} elsif (1) {

} else {

}

# unless, a negated version of if
unless (0) {

} # More readable than if (!condition)

# Curly braces are required regardless of a single line.
if (0) {
	print "Hi!";
}
# Post conditional form
print "Hi!" if 0;
print "Hi!" unless 0;

# while
while (0) {

}
# print "Hi!" while 0;
# until, a negated version of while
until (1) {

}

# for
for ($i = 0; $i <= 5; $i++) {

}

# foreach
foreach (@array) {
	print "Element number: $_\n";
}

print $list[$_] foreach 0 .. $max;

# Default $_ is not required.
foreach my $key (keys %hash) {
	print "Value of $key is $hash{$key}\n";
}
# More information on loops in |perlsyn|.

# switch


# Operators and Built-in Functions
# A list of built-in functions can be found at |perlfunc|.
# Easily read with 'perldoc -f functionname'.

# Operators
# Arithmetic
# +, -, *, /
# Numeric Comparisons
# ==, !=
# <, >
# <=, >=
# String Comparisons
# eq equality
# ne inequality
# lt less than
# gt greater than
# le less than or equal
# ge greater than or equal

# Logical Operators
# &&, and
# ||, or
# !, not

# Other Operations
# = assignment
# . string concatenation
# x string multiplication (repeats strings)
# .. range operator (creater array of numbers/strings)

# Compound assignment available on most operators:
# += 1;
# -= 1;
# .= "1";

# Files and Input/Output
# open() function used for file input and output.
# More information in |perlfunc, perlopentut|.
open(my $in, '<', 'input.txt') or die "Can't open input.txt: $!";
open(my $out, '>', 'output.txt') or die "Can't open output.txt: $!";
open(my $log, '>>', 'my.log') or die "Can't open my.log: $!";

# Open filehandles can be read from with the <> operator:
my $line = <$in>; # scalar reads a single line
my @lines = <$in>; # array/list reads entire file; a memory hog!

# <> operator can be used in a while loop
while (<$in>) { # assign each line in the $_ variable
	print "Line read: $_";
}

# the print funciton can take an optional initial argument that is a filehandle
print STDERR "This is a message sent to standard error.\n";
print $out $record; # print to $out file handle
print $log $logmessage;

# Call close() on file handles that are no longer needed.
close $in or die "$in: $!";

# Regular Expressions
# More information in |perlrequick, perlretut|.

# Simple Matching
if (/foo/ { } # true if $_ contains "foo"
if ($a =~ /foo/) { } # true if $a contains "foo"
# The // matching operator is documented in |perlop|.
# The // operator compares to $_ by default or it can be bound to another variable
# using the =~ binding operator

# Simple Substitution
s/foo/bar; # replace foo with bar in $_
$a =~ s/foo/bar/; # replaces foo with bar in $a
$a =~ s/foo/bar/g; # replaces ALL INSTANCES of foo with bar
# in $a
# The s/// substitution operator is document in |perlop|.

# More Complex Regular Expressions
# More information in |perlre|.
# List of a few popular rules:
# .  a single character
# \s  a whitespace character (space, tab, newline,
#                    ...)
# \S  non-whitespace character
# \d  a digit (0-9)
# \D  a non-digit
# \w  a word character (a-z, A-Z, 0-9, _)
# \W  a non-word character
# [aeiou]  matches a single character in the given set
# [^aeiou] matches a single character outside the given
                    set
# (foo|bar|baz) matches any of the alternatives specified

# ^  start of string
# $  end of string	

# Quantifiers can be used to specify the amount of the previous rule you wish
# to match.
# *  zero or more of the previous thing
# +  one or more of the previous thing
# ?  zero or one of the previous thing
# {3}  matches exactly 3 of the previous thing 
# {3,6}  matches between 3 and 6 of the previous thing
# {3,}  matches 3 or more of the previous thing

# Examples:
# /^\d+/  string starts with one or more digits
# /^$/    nothing in the string (start and end are adjacent)
# /(\d\s){3}/  three digits, each followed by a whitespace character (eg "3 4 5 ")
# /(a.)+/  matches a string in which every odd-numbered letter is a (eg "abacadaf")

# This loop reads from STDIN, and prints non-blank lines:
# while (<>) {
#     next if /^$/;
#    print;
# }

# Paraentheses for Capturing
# Besides grouping, parentheses can be used to capture results of a regex match
# to use later. These results are stored in $1, $2, etc.

# Breaking a email address into two parts.
if ($email =~ /([^@]+)@(.+)/) {
    print "Username is $1\n";
    print "Hostname is $2\n";
}	

# Other features of Regular Expressions
# Backreferences, lookaheads, and more.
# More information in |perlrequick, perlretut, perlre|.


# Writing Subroutines
sub logger {
	my $logmessage = shift;
	open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";
	print $logfile $logmessage;
}

logger("Logger Subroutine");
# Shift is used to recieve arguments from @_ array that holds function arguments.
# Pops the first item of the list and returns it.
# More ways to manipulate @_
my ($logmessage, $priority) = @_;
my $logmessage = $_[0];

# Subroutines can return values:
sub square {
	my $num = shift;
	my $result = $num * $num;
	return $result
}

$sq = square(8);
# More information on Subroutines in |perlsub|.
	
# Object Oriented Programming in Perl
# OOP in Perl uses references combined with the package concept. Common in
# third party modules.
# More information in |perlootut, perlobj|.

# Using Perl Modules
# Can be downloaded from http://www.cpan.org/
# Read |perlmodinstall| to learn how to install modules.
# To learn how to use specific module, use 'perldoc Module::Name.
# use Module::Name inserts module members into the current scope.
	
# End of Document
# FAQ can be found in |perlfaq|.
# Modules explained in detail at |perlmod|
# Modules that shipped with current Perl installation listed at |perlmodlib|.
# Advice for creating new Perl modules can be found at |perlnewmod|.
	
