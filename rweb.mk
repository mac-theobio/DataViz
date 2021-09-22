
## Better to make contentdirs a separate thing!
## Original docs directory made by hand in repo root directory and pushed

## This is for the sub-docs directories; fights with the git.mk rule
## Probably better to give it a different name, like subdocs, for future
dname = $(notdir $(CURDIR))
docs:
	$(MAKE) ../docs/$(dname)
	ls -d ../docs/$(dname)
	ln -s ../docs/$(dname) $@

../docs/$(dname):
	$(mkdir)

## html directory likewise
## (pushed in repo root, this rule only applies in subdirectories)
Ignore += html
html:
	(ls -d ../$@ && ln -s ../$@ .)

######################################################################

md = $(wildcard *.md)
rmd = $(wildcard *.rmd)
dmd = $(wildcard *.dmd)
Sources += $(md) $(rmd) $(dmd)

mdhdocs = $(md:%.md=docs/%.html)
rmdnotes = $(rmd:%.rmd=docs/%.notes.html)
rmdslides = $(rmd:%.rmd=docs/%.slides.html)
dmdnotes = $(dmd:%.dmd=docs/%.notes.html)
dmdslides = $(dmd:%.dmd=docs/%.slides.html)

update: $(mdhdocs) $(rmdnotes) $(rmdslides) $(dmdnotes) $(dmdslides)

## Make products from a particular lecture
## I've been turning on and off the automake for .rmd
## If it's on we don't need this rule much

%.lecture: docs/%.notes.html docs/%.slides.html ;

######################################################################

## Variables and recipes

site_header = html/header.html
site_footer = html/footer.html
site_css = html/qmee.css
site_bib = ../vis.bib
site_args = --self-contained

## Make simple html from .md 
docs/%.html: %.md
	$(MAKE) html docs
	$(mdrule)

######################################################################

## Make products from .rmd

hpan = c("-B", "$(site_header)", "-A", "$(site_footer)")
noteargs = output_format=rmarkdown::html_document(pandoc_args=$(hpan), css="$(site_css)")
io = input="$<", output_file="$(notdir $@)"
mvrule = $(MVF) $(notdir $@) $@
mdrule = pandoc $< -o $@ --mathjax -s -B $(site_header) -A $(site_footer) --css $(site_css) $(site_args)

## rmarkdown rules
# notesrule = echo 'rmarkdown::render($(io))' | R --vanilla; $(mvrule)
slideargs = output_format=rmarkdown::ioslides_presentation()
slidesrule = echo 'rmarkdown::render($(io), $(slideargs))' | R --vanilla; $(mvrule)

## pandoc rules ## GIVE UP on slides for now; the pandoc options all look old and clunky 2021 Sep 09 (Thu)
notesrule = $(mdrule)
## slideargs = -t slideous --slide-level=2
## slidesrule = pandoc $< $(slideargs) -o $@ $(site_args)

.PRECIOUS: docs/%.notes.html
docs/%.notes.html: %.rmk
	$(MAKE) html docs
	$(notesrule)

.PRECIOUS: docs/%.slides.html
docs/%.slides.html: %.rmd
	$(MAKE) html docs
	$(slidesrule)

docs/%.slides.html: %.RMD
	$(MAKE) html docs
	$(slidesrule)

######################################################################

-include makestuff/mdyam.mk
