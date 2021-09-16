# DataViz21

Publicly available material for STAT 744, Topics in Statistics / Data visualization

- [GitHub pages front-end](https://mac-theobio.github.io/DataViz)

## Automatic files

### Main directory

* index.rmd is made into index.html

* data.md looks at data/ to try to make sure it matches the files listed there, and then makes data_index.md and eventually data/index.html

### Content directories

```contentdirs += topics lectures admin```

* .md files are made into plain .html

* .rmd files are made into _both_ .notes.html and .slides.html

Styled html files (currently, plain and .notes) are made using an intermediate .rmk file, which is simply an .md file but the YAML is combined with knitr output in a hacky way.

* .dmd files are probably deprecated; they are like .rmd files but make knows to look for and make dependencies

## subdirs

- `docs`: GitHub pages stuff, mostly auto-copied/moved/linked from the main level
- `admin`: administrative, including assignments
- `lectures`: lecture material source
- `topics`: tips and resources
- `styles`: css files

### Development rules

Please edit `sched.txt` instead of `sched.tsv`; it's meant to be self-explanatory in structure
* Bells and whistles; what about comments and lecture expansion?

`make` rules:

- `syncup`: merge work, including rendered products, without doing unnecessary rendering
- `update_all`: remake the whole site
- `pushup`: remake the site; push main dir and all active subdirs (possibly with multiple commits)
- `local_site`: remake the site; open a local-file-based version in the browser

To add new subdirs to the machinery:

- add to `subdirs` variable and then `make <dirname>` (maybe?)
