library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes); loadEnvironments(); startGraphics()

timeRange <- c(1950, 2000)

base <- (ggplot(gis, aes(Year, Temp))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
)
teeGG(base, ext="png", desc="base")

stretch <- (base + ylim(c(0, 20)))
teeGG(stretch, ext="png", desc="stretch")

plain <- (stretch + theme(panel.grid = element_blank()))
teeGG(plain, ext="png", desc="plain")

secret <- (plain + xlab("Time") + ylab("")
	+ theme(axis.text.y = element_blank())
)
teeGG(secret, ext="png", desc="secret")

anomaly <- (ggplot(gis, aes(Year, Mean))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature anomaly")
	+ geom_hline(yintercept=0, linetype="dashed")
	+ ylim(c(-0.3, 0.5))
)
teeGG(anomaly, ext="png", desc="anomaly")
