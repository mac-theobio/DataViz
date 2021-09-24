library(ggplot2); theme_set(theme_bw(base_size=18))
library(magrittr)
library(shellpipes)

height <- 5
startGraphics(height=height) ## shellpipes

library(Hmisc)
data("OrchardSprays")

base <- ggplot(OrchardSprays,aes(x=treatment,y=decrease))
lbase <- base +  scale_y_log10()

## Bar charts, lin and log
(bar <- base
    +  stat_summary(fun.data=mean_cl_normal,geom="bar",colour="gray")
    +  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.5)
) %>% teeGG(desc="bar")

(bar +  scale_y_log10()) %>% teeGG(desc="logbar")

## pointrange is similar to error bar; these are are the non-dynamite analogues of the above
(base 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
) %>% teeGG(desc="base")

(lbase 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
) %>% teeGG(desc="logbase")

## sd (default is 2 sds!!)
(lsd <- lbase 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
) %>% teeGG(desc="logsd1")

(base 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
) %>% teeGG(desc="sd1")

(lbase + geom_point()) %>% teeGG(desc="points")
(lbase + geom_boxplot()) %>% teeGG(desc="box")
(lbase + geom_violin()) %>% teeGG(desc="violin")

(lsd + geom_point(color="blue", alpha=0.3)) %>% teeGG(desc="hybrid")
