## https://rstudio.github.io/crosstalk/using.html

library(crosstalk)
library(magrittr)
library(htmltools)
library(d3scatter)
library(shellpipes)
rpcall("cars.Rout cars.R")

shared_mtcars <- SharedData$new(mtcars)

obj <- bscols(widths = c(3,NA,NA),
  list(
    filter_checkbox("cyl", "Cylinders", shared_mtcars, ~cyl, inline = TRUE),
    filter_slider("hp", "Horsepower", shared_mtcars, ~hp, width = "100%"),
    filter_select("auto", "Automatic", shared_mtcars, ~ifelse(am == 0, "Yes", "No"))
  ),
  d3scatter(shared_mtcars, ~wt, ~mpg, ~factor(cyl), width="100%", height=250),
  d3scatter(shared_mtcars, ~hp, ~qsec, ~factor(cyl), width="100%", height=250)
)

obj %>% save_html(targetname(ext=".link.html"))
