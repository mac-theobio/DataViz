use strict;
use 5.10.0;

$/ = "";
my $sep = "\t";

my @fields;
my @records;
my %table;
while (my $par = <>){
	push @records, $.;
	foreach my $ln (split /\n/, $par){
		my ($tag, $text) = $ln =~ /([^:]*):\s*(.*)/;
		push @fields, $tag unless defined $table{$tag};
		$table{$tag}->{$.} = $text;
	}
}

foreach my $record (@records){
	my @row; 
	foreach my $field (@fields){
		my $val = "";
		$val = $table{$field}->{$record}
			if defined $table{$field}->{$record};
		push @row, $val;
	}
	say join $sep, @row;
}
