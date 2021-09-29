library(ggplot2); theme_set(theme_classic(base_size=12))
library(dplyr)

library(shellpipes)

rpcall("vlap_plots.Rout lap_plots.R data/vlaps.rds")

lap <- rdsRead()

summary(lap)

print(ggplot(lap)
	+ aes(x=race)
	+ geom_bar()
	+ coord_flip()
)

print(ggplot(lap)
	+ aes(x=circuit)
	+ geom_bar()
	+ coord_flip()
)

print(time1 <- ggplot(lap)
	+ aes(x=time)
	+ geom_histogram()
)

## %+% here is some new data keep everything else the same
print(time1 %+% (lap %>% filter(time<300)))

