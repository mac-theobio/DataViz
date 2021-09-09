# DataViz21

Publicly available material for STAT 744, Topics in Statistics / Data visualization

- [GitHub pages front-end](https://mac-theobio.github.io/DataViz)

## subdirs

- `docs`: GitHub pages stuff, mostly auto-copied/moved/linked from the main level
- `admin`: administrative, including assignments
- `lectures`: lecture material source
- `topics`: tips and resources
- `styles`: css files

### Development rules

`make` rules:

- `syncup`: merge work, including rendered products, without doing unnecessary rendering
- `update_all`: remake the whole site
- `pushup`: remake the site; push main dir and all active subdirs (possibly with multiple commits)
- `local_site`: remake the site; open a local-file-based version in the browser

To add new subdirs to the machinery:

- add to `subdirs` variable and then `make <dirname>` (maybe?)
