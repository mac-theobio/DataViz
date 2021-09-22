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

## Global temperature; anchors and scales
## temppix.secret.png: temppix.R
## temppix.anomaly.png: temppix.R
temppix.Rout: temppix.R temps.rda

## Magazine circulation and anchors
circulation.Rout: circulation.R data/circulation.csv

## Orchard sprays; this is a weird data set and I may not use it much more
## 2021 Sep 12 (Sun) (halfway desc-ed)
orchard.Rout: orchard.R

## Canadian provinces 

canada.Rout: canada.R data/canada.tsv
canadaPlots.Rout: canadaPlots.R canada.rds
pngDesc += canadaPlots

## Coronavirus time series

corona.Rout: corona.R data/coronaCA.csv
coronaPlots.Rout: coronaPlots.R corona.rda

## Coronavirus vaccination
coronaVacc.Rout: coronaVacc.R data/canada_vaccines.tsv

Ignore += bikes.zip
bikes.zip:
	wget -O $@ https://archive.ics.uci.edu/ml/machine-learning-databases/00275/Bike-Sharing-Dataset.zip

Ignore += day.csv hour.csv 
hour.csv: bikes.zip
	unzip $< $@
	touch $@

bikes.Rout: hour.csv data/bike_weather.csv bikes.R

bike_plots.Rout: bike_plots.R bikes.rds

smoke.Rout: smoke.R data/fev.csv

## Show the confounding
smoke_ques.Rout: smoke_ques.R smoke.rds

## fev vs. age fits
smoke_plots.Rout: smoke_plots.R smoke.rds

## Level plots (a mess)
smoke_levels.Rout: smoke_levels.R smoke.rds

## pages/interactive_smoke.html: interactive_smoke.rmd


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
-include makestuff/pdfsplit.mk
-include makestuff/pdfpng.mk

-include makestuff/git.mk
-include makestuff/visual.mk
