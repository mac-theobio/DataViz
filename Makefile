# DataViz
# https://mac-theobio.github.io/DataViz21/?version=123

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

## Root content

## docs/index.html: index.md

Sources += index.rmd vis.bib
Ignore += index.html

index.rmk: sched.tsv
docs/index.html: index.rmk
	pandoc $< -o $@ --mathjax -s -B html/mainheader.html -A html/mainfooter.html --css html/qmee.css --self-contained

## rweb should be included in subdirectories, but not in main 2021 Sep 04 (Sat)
Sources += rweb.mk

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

## Manual lectures

lectures/docs/%.html: $(wildcard lectures/*.rmd)
	cd lectures && $(MAKE) docs/$*.html
tips/docs/%.html: $(wildcard tips/*.rmd)
	cd tips && $(MAKE) docs/$*.html
assignments/docs/%.html: $(wildcard assignments/*.md)
	cd assignments && $(MAKE) docs/$*.html

## lectures/docs/Visualization.notes.html: lectures/Visualization.rmd
## lectures/docs/Visualization.slides.html: lectures/Visualization.rmd
## lectures/docs/Permutations_overview.notes.html: lectures/Permutations_overview.rmd ##

## tips/docs/R_style.notes.html: tips/R_style.rmd

######################################################################

## Main update

update: docs/index.html data/index.html

## Subdirectories

%.update:
	cd $* && $(MAKE) update

subdirs += admin topics
## subdirs += lectures tips assignments

######################################################################

Ignore += $(subdirs)
alldirs += $(subdirs)

update_all: makestuff $(subdirs) $(subdirs:%=%.update) update

Sources += subdir.mk
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
	pandoc $< -o $@ --mathjax -s -f gfm -B html/header.html -A html/footer.html --css html/qmee.css --self-contained

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

