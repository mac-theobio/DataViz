library(dplyr)
library(ggplot2)
theme_set(theme_bw())
library(GGally)

library(shellpipes)
height <- 5
startGraphics(height=height)

iris_measures <- (iris 
	%>% select(-Species)
)

print(ggpairs(iris_measures))
