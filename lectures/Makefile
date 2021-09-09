## This is 708/lectures

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## specific to lectures

Makefile: pix slideous

pix:
	cd .. && $(MAKE) old_repo/1.stamp
	$(LN) ../old_repo/pix

pardirs += code

slideous: dir=docs
slideous:
	$(linkdir)

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

-include makestuff/mdyam.mk

-include makestuff/git.mk
-include makestuff/visual.mk

