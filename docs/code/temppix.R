library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes); loadEnvironments(); startGraphics()
rpcall("temppix.Rout temppix.R temps.rda")

height=5

timeRange <- c(1950, 2000)

base <- (ggplot(gis, aes(Year, Temp))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature")
)
teeGG(base, ext="png", desc="base", height=height)

## Make it worse by stretching
stretch <- base + ylim(c(0, 20))
teeGG(stretch, ext="png", desc="stretch", height=height)

## Hide the default grid
plain <- (stretch + theme(panel.grid = element_blank())) 
teeGG(plain, ext="png", desc="plain", height=height)

## Humorously change the y axis
teeGG(plain + ylab("Problematicity"), ext="png", desc="algae", height=height)
stretch <- base + ylim(c(0, 20))

## Dark grid lines
dark <- stretch + theme(panel.grid.major = element_line(colour = "grey70"))
teeGG(dark, ext="png", desc="dark", height=height)

anomaly <- (ggplot(gis, aes(Year, Mean))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature anomaly")
	+ geom_hline(yintercept=0, linetype="dashed")
	+ ylim(c(-0.3, 0.5))
)
teeGG(anomaly, ext="png", desc="anomaly", height=height)
