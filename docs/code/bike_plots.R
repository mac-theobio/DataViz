## Redo with ggtitle!
library(ggplot2); theme_set(theme_bw(base_size=18))
library(magrittr); theme_set(theme_bw(base_size=18))
library(shellpipes)

height <- 5
startGraphics(height=height)

bikes <- rdsRead()

base <- ggplot(bikes, aes(x=weather,y=rentals))
lbase <- base +  scale_y_log10()

(bar <- base
    +  stat_summary(fun.data=mean_cl_normal,geom="bar",colour="gray")
) %>% teeGG("dyn")

(barbar <- bar
    +  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.5)
)

(base 
   +  stat_summary(fun.data=mean_cl_normal,geom="pointrange")
)

(base 
   +  stat_summary(fun.data=mean_sdl,geom="pointrange")
)

(base + geom_boxplot())
(lbase + geom_boxplot())
(base + geom_boxplot(varwidth=TRUE))
(lbase + geom_boxplot(varwidth=TRUE))
(base + geom_violin())
(lbase + geom_violin())
(lbase+geom_violin(scale="count"))
