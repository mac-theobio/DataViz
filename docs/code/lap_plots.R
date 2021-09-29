library(ggplot2)
library(shellpipes)

lap <- rdsRead()

summary(lap)

print(ggplot(lap)
	+ aes(x=race)
	+ geom_bar()
	+ coord_flip()
)

