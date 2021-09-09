
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
Sources += $(md) $(rmd)

mdhdocs = $(md:%.md=docs/%.html)
rmdnotes = $(rmd:%.rmd=docs/%.notes.html)
rmdslides = $(rmd:%.rmd=docs/%.slides.html)

update: $(mdhdocs) $(rmdnotes) $(rmdslides)

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
mds = pandoc $< -o $@ --mathjax -s -B $(site_header) -A $(site_footer) --css $(site_css) $(site_args)

## Make simple html from .md 
docs/%.html: %.md
	$(MAKE) html docs
	$(mds)

######################################################################

## Make products from .rmd

hpan = c("-B", "$(site_header)", "-A", "$(site_footer)")
noteargs = output_format=rmarkdown::html_document(pandoc_args=$(hpan), css="$(site_css)")
slideargs = output_format=rmarkdown::ioslides_presentation()
notesrule = echo 'rmarkdown::render($(io))' | R --vanilla
slidesrule = echo 'rmarkdown::render($(io), $(slideargs))' | R --vanilla
io = input="$<", output_file="$(notdir $@)"
mvrule = $(MVF) $(notdir $@) $@

## Older simpler notes (straight from rmd)
.PRECIOUS: docs/%.notes.html
docs/%.notes.html: %.rmD
	$(MAKE) html docs
	$(notesrule)
	$(mvrule)

## This is the route for formatted notes; not activated
## Need to worry about header image (points at . and doesn't work)
.PRECIOUS: docs/%.notes.html
docs/%.notes.html: %.rmk
	$(MAKE) html docs
	$(mds)

.PRECIOUS: docs/%.slides.html
docs/%.slides.html: %.rmd
	$(MAKE) html docs
	$(slidesrule)
	$(mvrule)

######################################################################

