library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(pheatmap)

library(shellpipes)
rpcall("decHeat.Rout decHeat.R dec.rda")
loadEnvironments()

height <- 5
startGraphics(height=height)

heatmap(raw_mat)

heatmap(ath_mat)
heatmap(event_mat)

pheatmap(cor(ath_mat), cell.width = 10, cell.height = 10)
pheatmap(cor(event_mat), cell.width = 4, cell.height = 4)
