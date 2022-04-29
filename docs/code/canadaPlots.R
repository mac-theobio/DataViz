library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes)
rpcall("canadaPlots.Rout canadaPlots.R canada.rds")
library(dplyr)

height <- 5
startGraphics(height=height)
canada <- (rdsRead())

first <- (ggplot(canada)
	+ aes(Province, Mp)
	+ ylab("Population (Mp)")
)

base <- first + xlab("Province (sorted by area)")
lbase <- base + scale_y_log10()

(first + geom_point()) %>% teeGG(desc="lin", ext="png", height=height)
(lbase + geom_point()) %>% teeGG(desc="log", ext="png", height=height)

(base + geom_col()) %>% teeGG(desc="linbar", ext="png", height=height)
(lbase + geom_col()) %>% teeGG(desc="logbar", ext="png", height=height)

((lbase + geom_col())
	%+% (canada %>% mutate(Mp = Mp*1e6))
	+ ylab("Population (p)")
) %>% teeGG(desc="log1bar", ext="png", height=height)
