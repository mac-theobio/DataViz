library(ggplot2); theme_set(theme_bw(base_size=18))
library(magrittr)
library(shellpipes)

height <- 5
startGraphics(height=height)

bikes <- rdsRead()

base <- ggplot(bikes, aes(x=weather,y=rentals))
lbase <- base +  scale_y_log10()

(bar <- base
    +  stat_summary(fun.data=mean_cl_normal,geom="bar",colour="gray")
) %>% teeGG(desc="bar", ext="png")

(barbar <- bar
    +  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.5)
) %>% teeGG(desc="dyn", ext="png")

(base 
   +  stat_summary(fun.data=mean_cl_normal,geom="pointrange")
) %>% teeGG(desc="stderr", ext="png")

(base 
   +  stat_summary(fun.data=mean_sdl,geom="pointrange")
) %>% teeGG(desc="sd2", ext="png")

(lbase 
   +  stat_summary(fun.data=mean_sdl,geom="pointrange")
) %>% teeGG(desc="sd2log", ext="png")

(base + geom_boxplot()) %>% teeGG(desc="box", ext="png")
(lbase + geom_boxplot()) %>% teeGG(desc="boxlog", ext="png")
(base + geom_boxplot(varwidth=TRUE)) %>% teeGG(desc="varbox", ext="png")
(lbase + geom_boxplot(varwidth=TRUE)) %>% teeGG(desc="varboxlog", ext="png")
(base + geom_violin()) %>% teeGG(desc="violin", ext="png")
(lbase + geom_violin()) %>% teeGG(desc="violinlog", ext="png")
(base+geom_violin(scale="count")) %>% teeGG(desc="vv", ext="png")
(lbase+geom_violin(scale="count")) %>% teeGG(desc="vvlog", ext="png")
