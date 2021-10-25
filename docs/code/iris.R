library(dplyr)
library(ggplot2)
theme_set(theme_bw())
library(GGally)

library(shellpipes)
rpcall("iris.Rout iris.R")
height <- 5
startGraphics(height=height)

iris_measures <- (iris 
	%>% select(-Species)
)

(ggpairs(iris_measures)) %>% teeGG(ext="png")
