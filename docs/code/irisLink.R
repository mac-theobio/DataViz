
# Modified from https://stackoverflow.com/questions/62451003/plotly-linked-brushing-highlighting-across-plots-built-from-different-data-fram, which credits
# https://plotly-r.com/arranging-views.html

library(dplyr)
library(plotly)
library(htmlwidgets)
library(shellpipes)
rpcall("irisLink.Rout irisLink.R")

data(iris)
summary(iris)

p1 <- (plot_ly(data = iris %>% highlight_key(~Species)
	, x = ~Petal.Length
	, y = ~Petal.Width
	, type  = "scatter"
	, color = ~Species
))

p2 <- (plot_ly(data = iris
	, x = ~Sepal.Length
	, y = ~Sepal.Width
	, type  = "scatter"
	, color = ~Species
) %>% add_markers(color = ~Species))

p <- subplot(p1, p2)

p %>% as_widget %>% saveWidget(targetname(ext=".ps.html"))

