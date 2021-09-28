## This is 708/lectures

current: target
-include target.mk

-include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## specific to lectures

Sources += $(wildcard pix/*.*)

pix:
	$(mkdir)

pix/%:
	$(MAKE) pix
	$(CP) nopix/$* $@

pardirs += code
hotdirs += code

## Dormant
slideous: dir=docs
slideous:
	$(linkdir)

######################################################################

Sources += $(wildcard *.md)

## docs/ subdirectory here maps to a corresponding subdirectory in docs

Ignore += docs
include ../rweb.mk

######################################################################

Sources += $(wildcard *.txt *.tmp) md.fmt

Ignore += explore.lmd
explore.lmd: explore.txt explore.tmp md.fmt makestuff/newtalk/lect.pl
	$(PUSHRO)

docs/explore.notes.html: explore.txt

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

-include makestuff/dmdeps.mk
-include makestuff/hotcold.mk
-include makestuff/webpix.mk

-include makestuff/git.mk
-include makestuff/visual.mk

