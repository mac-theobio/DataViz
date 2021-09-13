library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes)
library(dplyr)

height <- 5
startGraphics(height=height)
canada <- (rdsRead())

base <- (ggplot(canada)
	+ aes(Province, Mp)
	+ ylab("Population (Mp)")
)
lbase <- base + scale_y_log10()

(base + geom_point()) %>% teeGG(desc="lin", ext="png", height=height)
(lbase + geom_point()) %>% teeGG(desc="log", ext="png", height=height)

(base + geom_col()) %>% teeGG(desc="linbar", ext="png", height=height)
(lbase + geom_col()) %>% teeGG(desc="logbar", ext="png", height=height)

((lbase + geom_col())
	%+% (canada
		%>% mutate(Mp = Mp*1e6)
	)
) %>% teeGG(desc="log1bar", ext="png", height=height)
