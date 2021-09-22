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

(bar +  scale_y_log10() + ggtitle("Aphids!")) %>% teeGG(desc="logbar")

## pointrange is similar to error bar; these are are the non-dynamite analogues of the above
(base 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
)

(lbase 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
)

## sd (default is 2 sds!!)
(lsd <- lbase 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
)

(base 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
)

(lbase + geom_point())
(lbase + geom_boxplot())
(lbase + geom_violin())

(lsd + geom_point(color="blue", alpha=0.3))
