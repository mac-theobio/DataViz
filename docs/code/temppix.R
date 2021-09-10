library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes); loadEnvironments(); startGraphics()

timeRange <- c(1950, 2000)

print(base <- ggplot(gis, aes(Year, Temp))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
)
saveGG(base, ext="png", desc="base")

print(stretch <- base + ylim(c(0, 20)))
saveGG(stretch, ext="png", desc="stretch")

print(plain <- (stretch + theme(panel.grid = element_blank())))
saveGG(plain, ext="png", desc="plain")

print(secret <- plain + xlab("Time") + ylab("")
	+ theme(axis.text.y = element_blank())
)
saveGG(secret, ext="png", desc="secret")

print(anomaly <- ggplot(gis, aes(Year, Mean))
	+ geom_point()
	+ geom_line()
	+ xlim(timeRange)
	+ ylab("Temperature anomaly")
	+ geom_hline(yintercept=0, linetype="dashed")
	+ ylim(c(-0.3, 0.5))
)
saveGG(anomaly, ext="png", desc="anomaly")
