bananas <- read.csv("data/FAOSTAT_data_1-7-2018.csv")
library(cowplot)
library(ggplot2)
library(dplyr)
library(colorspace)
library(directlabels)
theme_set(theme_cowplot())

bananas2 <- (bananas
    %>% mutate(tval=Value/1000,
               ## reorder country levels by first value, in reverse order
               Country=reorder(Country,Value,FUN=function(x) -x[1]))
)

## forcats package

## a reasonable start
(g1 <- ggplot(bananas2,aes(Year,tval,colour=Country))
    + geom_line()
    + scale_colour_discrete_qualitative() ## better colours
    + scale_x_continuous(breaks=seq(1995,2005,by=2))
    + labs(y="Bananas (thousands of tonnes)")
)

## try log-scaling (too strong?)
g1 + scale_y_log10()

## nicely spaced, but what does it mean?
g1 + scale_y_sqrt()

## "magic" function - remove legend, pick an appropriate labeling method,
## guess the labeling variable
direct.label(g1)

(g1
    + geom_dl(method="last.bumpup",
              aes(label=Country))
    + theme(legend.position="none")
    + scale_x_continuous(lim=c(1995,2008),
                         breaks=seq(1995,2005,by=2))
    ## also see ?expand_limits
)

## with faceting
(g1
    + scale_x_continuous(breaks=c(1995,2000,2005))
    + facet_wrap(~Country)
    + theme(legend.position="none")
)

##
library(colorspace)
library(viridis)
g1 <- ggplot(bananas2,
      aes(x=Year,y=Country,fill=tval))+
  geom_tile()+
  scale_fill_viridis()+
  scale_x_continuous(breaks=seq(1995,2005,by=3),
                     expand=c(0,0))
print(g1)

rayshader::plot_gg(
  
  
  g1+scale_y_discrete(breaks=levels(bananas2$Country),
        labels=1:10))

bananas3 <- bananas2 %>%
  mutate(Country=fct_reorder(Country,tval))

bananas3 <- bananas2 %>%
  mutate_at("Country",~fct_reorder(.,tval))

print(ggplot(bananas3,
      aes(x=Country,y=tval))
  + geom_point(aes(colour=Year),
      ##position=position_jitter(width=0.1,
      ##                         height=0))
  position=position_dodge(width=1))
  + labs(x="",y="bananas (?? units ??)")
  + coord_flip()
  + scale_y_sqrt()
  + scale_colour_viridis(
    breaks=c(1995,2000,2005))
  + theme_gray()
)


print(g2)
## various attempts to make the bad plot ...
plot_gg(g1)
library(rayshader)


(g2 <- ggplot(bananas2,aes(Year,Country,colour=tval))
    + geom_point()
    
)
plot_gg(g2)
library(plot3D)
with(bananas2,hist3D(unique(Year),as.numeric(unique(Country)),
                            matrix(tval,nrow=12)))

ghash <- "01c25068df145aa0b97f"
devtools::source_gist(ghash, filename = "barplot3d.R")
with(bananas2,
     barplot3d(matrix(tval,nrow=12)))

##

library(plotrix)
