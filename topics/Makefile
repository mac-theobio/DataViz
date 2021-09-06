## This is 708/topics

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.md)

## docs/ subdirectory here maps to a corresponding subdirectory in docs

Ignore += docs
include ../rweb.mk

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/Makefile
makestuff/Makefile:
	cd .. && $(MAKE) makestuff
	ln -s ../makestuff .
	ls $@

-include makestuff/os.mk

-include makestuff/git.mk
-include makestuff/visual.mk

