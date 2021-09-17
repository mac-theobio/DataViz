use strict;
use 5.10.0;

## notdir data/ filenames
## If the data/ filename starts the line, also make it a tag
while (<>){
	next if /index.html/;
	s|^data/([^\s:]*)|[$1]($1)|;
	s|data/||g;
	print;
}
