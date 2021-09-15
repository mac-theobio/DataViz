library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes); loadEnvironments(); startGraphics()

height=5

timeRange <- c(1950, 2000)

base <- (ggplot(gis, aes(Year, Temp))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature")
)
teeGG(base, ext="png", desc="base", height=height)

stretch <- base + ylim(c(0, 20)) + ylab("Problematicity")
teeGG(stretch, ext="png", desc="stretch", height=height)

dark <- stretch + theme(panel.grid.major = element_line(colour = "grey70"))
teeGG(dark, ext="png", desc="dark", height=height)

plain <- (stretch + theme(panel.grid = element_blank())) 
teeGG(plain, ext="png", desc="plain", height=height)

secret <- (plain + xlab("Time") + ylab("")
	+ theme(axis.text.y = element_blank())
)
teeGG(secret, ext="png", desc="secret", height=height)

anomaly <- (ggplot(gis, aes(Year, Mean))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature anomaly")
	+ geom_hline(yintercept=0, linetype="dashed")
	+ ylim(c(-0.3, 0.5))
)
teeGG(anomaly, ext="png", desc="anomaly", height=height)
