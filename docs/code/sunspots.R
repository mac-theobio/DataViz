library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(shellpipes)

height <- 5
startGraphics(height=height, paper="special")

sun <- (sunspots
	%>% as.data.frame
	%>% rename(activity=x)
	%>% mutate(year = seq(
		from=attr(sunspots, "tsp")[[1]], by=1/12, length.out=length(activity)
	))
)

(base <- ggplot(sun)
	+ aes(year, activity)
	+ geom_line()
) %>% teeGG(desc="default", ext="png")

(base + ylim(c(-200, 550))) %>% teeGG(desc="bank", ext="png")
