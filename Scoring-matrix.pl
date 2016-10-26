#!/usr/local/bin/perl
# Mike McQuade
# Scoring-matrix.pl
# Reads in a scoring matrix from a text file,
# then stores it in a hashing function for fast lookup.
# The program then prints out the formatted
# matrix using the values in the hash map.

# Define the packages to use
use strict;
use warnings;

# Initialize variables
my (@letters,%matrix);

# Open the file to read
open(my $fh,"<pam250.txt") or die $!;

# Read in the first line from the file
@letters = split(/\s+/,<$fh>);

# Read in the matrix from the file
while (my $line = <$fh>) {
	my @temp = split (/\s+/,$line);
	for (my $i = 1; $i < scalar(@temp); $i++) {
		$matrix{$letters[$i]}{$temp[0]} = $temp[$i];
	}
}

# Print out the grid for each letter pair
print " ";
# Print out the first line
for (my $i = 1; $i < scalar(@letters); $i++) {
	printf "%3s",$letters[$i];
}
print "\n";
# Print out each line in the matrix
foreach my $firstLetter (sort keys %matrix) {
	print $firstLetter;
    foreach my $secondLetter (sort keys %{$matrix{$firstLetter}}) {
        printf "%3d",$matrix{$firstLetter}{$secondLetter};
    }
	print "\n";
}

# Close the file
close($fh) || die "Couldn't close file properly";