# DataViz CURRENT course and web, started Sep 2021
# https://mac-theobio.github.io/DataViz/?version=123

### Hooks for the editor to set the default target
current: target
-include target.mk

vim_session:
	bash -cl "vmt index.rmd rweb.mk"

Sources = Makefile README.md notes.md

##################################################################

Sources += $(wildcard docs/*.html) $(wildcard docs/*/*.html)
Sources += $(wildcard html/*.*)

######################################################################

## Insane hanging problem
## Looks like a problem with read_tsv and inconsistent commenting?
## Not reproduced now; maybe a problem with a particular machine at a particular time??
## REPORT!

Sources += hux.tsv hux.R
hux.Rout: hux.R hux.tsv

######################################################################

## Root content

## docs/index.html: index.rmd

Sources += index.rmd vis.bib refs.csl

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

## Failed here; could not @@include the md file; got confused about html
sched.Rout: sched.R sched.tsv
## sched.Rout.html: sched.R

######################################################################

## Test outputs

lectures/docs/scales.notes.html: lectures/scales.dmd
	cd lectures && $(MAKE) docs/$(notdir $@)

######################################################################

## Main update

update: docs/index.html data/index.html

## Subdirectories

%.update:
	cd $* && $(MAKE) update

## No real topics pages (using table);
## topics can be used for the stuff in QMEE "tips"
subdirs += topics lectures admin

## non-parallel subdirs should be fine as long as you mkdir before make does

######################################################################

Ignore += $(subdirs)
alldirs += $(subdirs)

update_all: makestuff $(subdirs) $(subdirs:%=%.update) update

Sources += subdir.mk ## For copying to default subdirs
$(subdirs):
	- $(RMR) $@_tmp
	mkdir $@_tmp
	cp subdir.mk $@_tmp/Makefile
	$(MAKE) $@_tmp.makestuff
	$(MV) $@_tmp $@

local_site: update_all
	$(MAKE) docs/index.html.go

old_site: gh-pages
	$(MAKE) gh-pages/index.html.go

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

## code is on the front side now (like data) 2021 Mar 19 (Fri)

Ignore += code
code: dir=docs
code:
	$(linkdir)
Sources += $(wildcard docs/code/*.*)

######################################################################

## Dushoff lectures that live elsewhere

Ignore += docs/legacy

######################################################################

## Old content

## git mv source stuff from oldSource to where it's wanted
## arcScript: ; git mv $(oldscripts) oldSource ##

## Look around, or emergency rescue
Ignore += gh-pages
gh-pages:
	$(MAKE) $@.branchdir

##################################################################

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
-include makestuff/mdyam.mk

-include makestuff/git.mk
-include makestuff/visual.mk

