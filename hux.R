library(huxtable)
library(dplyr)
library(readr)
library(shellpipes)

mk_url <- function(x) {
  ifelse(nchar(trimws(x))==0,x,
         sprintf("[%s](https://mac-theobio.github.io/DataViz/%s.html)",
                 x,x))
}

t <- read_tsv("hux.tsv")
h <- hux(t)
print_html(h, max_width=1000)
