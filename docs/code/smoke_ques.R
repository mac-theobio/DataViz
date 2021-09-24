library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes)
library(magrittr)

height <- 5
startGraphics(height=height)

smoke <- rdsRead()

## What is the relationship between smoking and lung capacity
## Why doesn't varwidth play nicely with dodge? (crashes)
## scale="count" is ignored ☹
(ggplot(smoke, aes(x=smoking, y=fev, color=sex))
	## + geom_boxplot(varwidth=TRUE, position="dodge")
	+ geom_boxplot(position="dodge")
	+ ylab("Lung capacity")
) %>% teeGG(desc="sexbox", ext="png")

(ggplot(smoke, aes(x=smoking, y=fev))
	+ geom_boxplot(varwidth=TRUE)
	+ ylab("Lung capacity (L/s)")
) %>% teeGG(desc="box", ext="png")

## Who are the smoke people?
(ggplot(smoke, aes(x=smoking, y=age))
	+ geom_boxplot(varwidth=TRUE)
) %>% teeGG(desc="boxage", ext="png")

## Who are the smoke people?
(ggplot(smoke, aes(x=smoking, y=age))
	+ geom_violin(scale="count")
) %>% teeGG(desc="violinage", ext="png")


