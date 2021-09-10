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

## Use the main course cache

## Ignore += cache
cache: dir = ../..
cache: 
	$(linkdir)

Ignore += cache
data: dir = ..
data: 
	$(linkdir)

######################################################################

## Temperature and anchors

cache/temps.csv:
	$(MAKE) cache
	wget -O $@ https://datahub.io/core/global-temp/r/annual.csv

temps.Rout: temps.R cache/temps.csv

pngDesc += temppix
## temppix.secret.png: temppix.R
## temppix.anomaly.png: temppix.R
temppix.Rout: temppix.R temps.rda

## Magazine circulation and anchors

circulation.Rout: circulation.R data/circulation.csv

orchard.Rout: orchard.R

######################################################################

## Cribbing

data/%:
	$(MAKE) data
	$(CP) ../../old_repo/$* $@

%.R:
	$(CP) ../../old_repo/$@ .

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff

Makefile: makestuff/Makefile
makestuff/Makefile:
	cd ../.. && $(MAKE) makestuff
	ln -s ../../makestuff .

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/pdfpages.mk

-include makestuff/git.mk
-include makestuff/visual.mk
