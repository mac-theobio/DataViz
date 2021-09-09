## This is the code subdirectory of dataviz

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.R)

autopipeR = defined

######################################################################

## Temperature and anchors

Ignore += temps.csv
temps.csv:
	wget -O $@ https://datahub.io/core/global-temp/r/annual.csv

temps.Rout: temps.R temps.csv

pngDesc += temppix
## temppix.secret.png: temppix.R
temppix.Rout: temppix.R temps.rda

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff

## Want to chain and make makestuff if it doesn't exist
## Compress this ¶ to choose default makestuff route
Makefile: makestuff/Makefile
makestuff/Makefile:
	cd ../.. && $(MAKE) makestuff
	ln -s ../../makestuff .

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
