library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(GGally)

library(shellpipes)
rpcall("decPairs.Rout decPairs.R dec.rda")
loadEnvironments()

height <- 5
startGraphics(height=height)

## (ggpairs(ath_frame)) %>% teeGG(ext="png")
print(pairs(ath_frame, gap=0, pch="."))
