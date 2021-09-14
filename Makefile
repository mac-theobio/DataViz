# DataViz CURRENT course and web, started Sep 2021
# https://mac-theobio.github.io/DataViz/?version=123

### Hooks for the editor to set the default target
current: target
-include target.mk

vim_session:
	bash -cl "vmt index.rmd rweb.mk sched.txt"

Sources = Makefile README.md notes.md

##################################################################

Sources += $(wildcard docs/*.html) $(wildcard docs/*/*.html)
Sources += $(wildcard html/*.*)

######################################################################

## Root content

## docs/index.html: index.rmd

Sources += index.rmd vis.bib refs.csl sched.txt

Ignore += sched.tsv
sched.tsv: sched.txt sched.pl
	$(PUSHRO)

Ignore += index.rmk
index.rmk: sched.tsv
## docs/index.html: index.rmd
docs/index.html: index.rmk
	pandoc $< -o $@ --mathjax -s -B html/mainheader.html -A html/mainfooter.html --css html/qmee.css --self-contained

## rweb should be included in subdirectories, but not in main 2021 Sep 04 (Sat)
Sources += rweb.mk

######################################################################

## Stored images
## Things mysteriously stopped working with the static link thing whatever

Sources += cache/*

cache/Minard.png:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Minard.png/640px-Minard.png"

######################################################################

## How to do the schedule? 2021 Sep 04 (Sat)

## How crazy is superPipe?

Sources += $(wildcard *.tsv)

%.Rout: ; $(pipeR)
%.Rout.html: %.Rout ;

######################################################################

## Test outputs

lectures/scales.dmdmk: lectures/scales.dmd makestuff/dmdmk.pl

lect_r = cd lectures && $(MAKE) docs/$(notdir $@)
lectures/docs/scales.slides.html: lectures/scales.dmd
	$(lect_r)
lectures/docs/scales.notes.html: lectures/scales.dmd
	$(lect_r)

######################################################################

## Main update

update: docs/index.html data/index.html

## Subdirectories

%.update:
	cd $* && $(MAKE) update

## No real topics pages (using table);
## topics can be used for the stuff in QMEE "tips"
contentdirs += topics lectures admin

## Add a contentdir by adding it to the list and then saying `make <dirname>`

Sources += subdir.mk ## For copying to default subdirs
$(contentdirs):
	- $(RMR) $@_tmp
	mkdir $@_tmp
	cp subdir.mk $@_tmp/Makefile
	$(MAKE) $@_tmp.makestuff
	$(MV) $@_tmp $@

######################################################################

subdirs += code

subdirs += $(contentdirs)
Ignore += $(subdirs)
alldirs += $(subdirs)

######################################################################

update_all: makestuff $(contentdirs) $(contentdirs:%=%.update) update

## View site
local_site: update_all
	$(MAKE) docs/index.html.go

pushup: update_all

dateup:
	touch docs/*.html docs/*/*.html

syncup: update_all pull dateup all.time

######################################################################

## Link to the old repo; done until we sort out "pix" questions; don't know if it should be permanent

Ignore += old_repo
old_repo/1.stamp:
	git clone https://github.com/mac-theobio/DataViz19.git $(dir $@)
	touch $@
	chmod -R a-w $(dir $@)

######################################################################

## Data index
## data/ lives in docs/ so that it's part of the pages

Ignore += data
data: dir=docs
data:
	$(linkdir)

Sources += $(wildcard docs/data/*.*)

Sources += $(wildcard *.pl)
Sources += data.md
Ignore += data_index.md

## Edit data.md page; it's also supposed to edit itself
## To mark MISSING files and append UNTRACKED ones
data.md: $(wildcard data/*.*sv data/*.rd* data/*.RData)
	$(touch)
## Don't edit (might be read-only to remind you)
data_index.md: data.md dataindex.pl
	- $(MAKE) data data.filemerge
	$(PUSHRO)

## data/index.html: data.md
## data_index.md: data.md
data/index.html: data_index.md
	pandoc $< -o $@ --mathjax -s -f gfm -B html/mainheader.html -A html/mainfooter.html --css html/qmee.css --self-contained

######################################################################

## code should be viewable through web side (live code, too, in live)
## code is an active subdirectory now

code: dir=docs
code:
	$(linkdir)

hotdirs += code

## Live is for live-lecture code; it is controlled from here (no Makefile)
Ignore += live
Sources += $(wildcard docs/live/*.*)
live: dir=docs
live:
	$(linkdir)

### Makestuff

Makefile: makestuff/01.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	cd makestuff && $(MAKE) pull
	touch $@

msrepo = https://github.com/dushoff
ms = makestuff

-include makestuff/perl.def

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/dmdeps.mk
-include makestuff/mdyam.mk
-include makestuff/hotcold.mk
-include makestuff/compare.mk

-include makestuff/git.mk
-include makestuff/visual.mk

