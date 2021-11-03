## This is the code subdirectory of dataviz

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.R)

autopipeRcall = defined

######################################################################

## Still cribbing 2021 Nov 02 (Tue)
%.R: ../../old_repo/%.R
	$(copy)

## Use the main course cache

## Ignore += cache
cache: dir = ../..
cache: 
	$(linkdir)

Ignore += cache
data/%: data ;
data: dir = ..
data: 
	$(linkdir)

######################################################################

## Figure sizing

size.Rout: size.R

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
pngDesc += orchard
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

pngDesc += bike_plots
bike_plots.Rout: bike_plots.R bikes.rds

## sunspots (banking)
pngDesc += sunspots
sunspots.Rout: sunspots.R
## sunspots.Rout-0.png: sunspots.R

######################################################################

## Explore plots (smoking and other)

## Is smoking good for you?
pngDesc += smoke_plots smoke_ques

smoke.Rout: smoke.R data/fev.csv

## Show the confounding
smoke_ques.Rout: smoke_ques.R smoke.rds

## fev vs. age fits
smoke_plots.Rout: smoke_plots.R smoke.rds

## Level plots (a mess)
smoke_levels.Rout: smoke_levels.R smoke.rds

pngDesc += iris
iris.Rout: iris.R

bananas.Rout: bananas.R
oldbananas.Rout: oldbananas.R

######################################################################

## Inferential lecture

smoke_inference.Rout: smoke_inference.R smoke.rds

smoke_inference.Rout-0.pdf:

uni.Rout: uni.R smoke.rds

fake.Rout: fake.R
fake_plots.Rout: fake_plots.R fake.rda

######################################################################

## Interactive lecture

gapminder.Rout: gapminder.R

## intSmoke.anim.html: intSmoke.R
## intSmoke.graph.html: intSmoke.R
Ignore += intSmoke.*.html
intSmoke.%.html: intSmoke.Rout ; 
intSmoke.Rout: intSmoke.R data/fev.csv

## taxHover.dyn.html: taxHover.R
Ignore += taxHover.*.html
taxHover.%.html: taxHover.Rout ; 
taxHover.Rout: taxHover.R data/tax.rda

## irisLink.link.html: irisLink.R
## irisLink.ps.html: irisLink.R
Ignore += irisLink.*.html
irisLink.%.html: irisLink.Rout ; 
irisLink.Rout: irisLink.R

crosstalk.html: crosstalk.rmd
	$(knithtml)

## cars.link.html: cars.R
cars.link.html: cars.Rout ;
cars.Rout: cars.R

######################################################################

## Decathlon dimension reduction

Ignore += dim.dump
dim.dump:

dec.Rout: dec.R

decPairs.Rout: decPairs.R dec.rda

decHeat.Rout: decHeat.R dec.rda

decPCA.Rout: decPCA.R dec.rda 

######################################################################

## Mental illness
kaiser.Rout: kaiser.R data/kaiser.csv

## F1 racing
## Data from https://www.kaggle.com/miguelluna93/formula-1-1950-2020
## These data are big and not on the repo

######################################################################

## Miriam's data for a small live discussion

Ignore += f1data
f1data:
	ln -s ~/Dropbox/$@ .

vlaps.R: f1data
vlaps.Rout: vlaps.R $(wildcard f1data/*.csv)

## vlaps.Rout.csv: vlaps.R

data/vlaps.rds: vlaps.rds
	$(copy)

## You should be able to run starting from here
vlap_plots.Rout: lap_plots.R data/vlaps.rds
	$(pipeR)

######################################################################

## color

ramps.Rout: ramps.R

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
## -include makestuff/pdfsplit.mk
-include makestuff/pdfpng.mk

-include makestuff/git.mk
-include makestuff/visual.mk
