# DataViz CURRENT course and web, started Sep 2021
# https://mac-theobio.github.io/DataViz/?version=123

### Hooks for the editor to set the default target
current: local_site
-include target.mk

vim_session:
	bash -cl "vmt index.rmd rweb.mk sched.txt"

Sources = Makefile README.md notes.md

##################################################################

Sources += $(wildcard docs/*.html) $(wildcard docs/*/*.html)
Sources += $(wildcard html/*.*)

######################################################################

Ignore += old_repo

## Root content

## docs/index.html: index.rmd

Sources += index.rmd vis.bib refs.csl sched.txt TODO.md

Ignore += sched.tsv cleansched.tsv
sched.tsv: sched.txt sched.pl
	$(PUSHRO)

cleansched.tsv: sched.tsv cleansched.pl
	$(PUSHRO)

mainhtml = pandoc $< -o $@ --mathjax -s -B html/mainheader.html -A html/mainfooter.html --css html/qmee.css --self-contained

## docs/index.html: index.rmd sched.txt
docs/index.html: index.rmk
	$(mainhtml)
Ignore += index.rmk
index.rmk: index.rmd cleansched.tsv
	$(rmk_r)

## docs/shadow.html: index.rmd sched.txt
docs/shadow.html: shadow.rmk
	$(mainhtml)
Ignore += shadow.rmk
shadow.rmk: index.rmd sched.tsv
	$(rmk_r)

## rweb should be included in subdirectories, but not in main 2021 Sep 04 (Sat)
Sources += rweb.mk

######################################################################

## Stored images
## Things mysteriously stopped working with the static link thing whatever

Sources += cache/*

cache/Minard.png:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Minard.png/640px-Minard.png"

######################################################################

## Weird dev (old ⇒ new lecture style, but I don't really like it)

######################################################################

## How to do the schedule? 2021 Sep 04 (Sat)

## How crazy is superPipe?

%.Rout: ; $(pipeR)
%.Rout.html: %.Rout ;

######################################################################

## Test outputs

## lectures/scales.dmdmk: lectures/scales.dmd makestuff/dmdmk.pl

lect_r = cd lectures && $(MAKE) docs/$(notdir $@)
lectures/docs/scales.slides.html: lectures/scales.dmd
	$(lect_r)
lectures/docs/diagnostics.notes.html: lectures/diagnostics.rmd
	$(lect_r)

lectures/docs/dim.slides.html: lectures/dim.rmd
	$(lect_r)
lectures/docs/dim.notes.html: lectures/dim.rmd
	$(lect_r)

lectures/explore.lmd: lectures/explore.txt
	cd lectures && $(MAKE) $(notdir $@)

admin/docs/assignments.html: admin/assignments.md
	cd admin && $(MAKE) docs/$(notdir $@)

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

update_all: makestuff $(contentdirs) $(contentdirs:%=%.update) update

## View site
local_site: update_all
	$(MAKE) docs/shadow.html.go

pushup: update_all

dateup:
	touch docs/*.html docs/*/*.html data/index.html

syncup: update_all pull dateup all.time

pullup: pull dateup

######################################################################

## Data index
## data/ lives in docs/ so that it's part of the web ecosystem

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

## Don't edit
data_index.md: data.md dataindex.pl data
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
## Sourced via docs (also from here)
Ignore += live
Sources += $(wildcard docs/live/*.*)
live: dir=docs
live:
	$(linkdir)

######################################################################

Ignore += old_repo

subdirs += code
subdirs += $(contentdirs)
alldirs += $(subdirs)
Ignore += $(subdirs)

######################################################################

### Makestuff

Makefile: makestuff/05.stamp

msrepo = https://github.com/dushoff

-include makestuff/perl.def

Ignore += makestuff
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/dmdeps.mk
-include makestuff/mdyam.mk
-include makestuff/hotcold.mk
-include makestuff/compare.mk

-include makestuff/git.mk
-include makestuff/visual.mk

private_repo:
	git clone git@github.com:mac-theobio/DataViz_private.git private

