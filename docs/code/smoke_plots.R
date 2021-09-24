library(ggplot2)
theme_set(theme_bw(base_size=18))
library(magrittr)

library(shellpipes)

library(splines)
library(MASS)

point_alpha <- 0.4
height <- 5
startGraphics(height=height)

smoke <- rdsRead()

## Age vs fev

af <- (ggplot(smoke, aes(x=age, y=fev))
	+ ylab("Lung capacity")
)

(af + geom_point())  %>% teeGG(desc="scatter", ext="png")
(af + geom_point(alpha=point_alpha))  %>% teeGG(desc="tatter", ext="png")

(af + geom_count(alpha=point_alpha)) %>% teeGG(desc="badarea", ext="png")
(afp <- af 
	+ geom_count(alpha=point_alpha) 
	+ scale_size_area()
) %>% teeGG(desc="goodarea", ext="png")

(aflp <- afp + geom_smooth(method=loess)) %>% teeGG(desc="loess", ext="png")

(afls <- aflp + aes(color=smoking)) %>% teeGG(desc="compare", ext="png")
(afls + facet_wrap(~sex) 
	+ theme(legend.position="none")
) %>% teeGG(desc="comparesex", ext="png")

## Is there a way to do this? Does it mess up the loess?
## print(afb <- af + geom_boxplot(group=age) + geom_smooth(method="loess"))
## print(afb <- af + geom_boxplot(group=age))
## print(afb <- af + geom_boxplot(group=age))
## "q

## rlm plots don't seem to work with ggsave!!

(afr <- 
	af + geom_smooth(method=rlm, formula=y~ns(x,3))
) 

(afrp <- afr + geom_point(alpha=point_alpha)) %>% teeGG(desc="rlm")

(afr 
	+ geom_count(alpha=point_alpha) + scale_size_area()
) %>% teeGG(desc="rlmarea")

(afrp + aes(color=smoking)) %>% teeGG(desc="rlmcomp")

## Replot so we can put side-by-side
## print(afls + theme(legend.position="none") + ggtitle("loess"))
## print(afrs + theme(legend.position="none") + ggtitle("rlm plus ns(3)"))
