
library(ggplot2); theme_set(theme_bw(base_size=18))
library(shellpipes); startGraphics()

library(Hmisc)
data("OrchardSprays")

base <- ggplot(OrchardSprays,aes(x=treatment,y=decrease))
lbase <- base +  scale_y_log10()

## Bar charts, lin and log
print(bar <- base
    +  stat_summary(fun.data=mean_cl_normal,geom="bar",colour="gray")
    +  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.5)
)

print(bar +  scale_y_log10())

## pointrange is similar to error bar; these are are the non-dynamite analogues of the above
print(base 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
)

print(lbase 
	+ stat_summary(fun.data=mean_cl_normal,geom="pointrange")
)

## sd (default is 2 sds!!)
print(lsd <- lbase 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
)

print(base 
	+ stat_summary(fun.data=mean_sdl
		, geom="pointrange"
		, fun.args = list(mult=1)
	)
)

print(lbase + geom_point())
print(lbase + geom_boxplot())
print(lbase + geom_violin())

print(lsd + geom_point(color="blue", alpha=0.3))
