
## Data from: https://www.healthsystemtracker.org/chart-collection/current-costs-outcomes-related-mental-health-substance-abuse-disorders/#item-eighteen-percent-adults-united-states-mental-behavioral-emotional-disorder

library(tidyverse)
library(ggalt)
dd <- (read_csv("data/kaiser.csv")
    %>% mutate(category=rep(c("overall","sex","age","ethnicity"),
                            times=c(1,2,3,6)),
               category=factor(category,levels=unique(category)))
    %>% rename(pct="Percent of adults with AMI")
    %>% group_by(category)
    %>% arrange(category,desc(pct))
    %>% ungroup()
    %>% mutate(Group=factor(Group,levels=rev(Group)))
)
library(ggplot2); theme_set(theme_classic())

ggplot(dd,aes(fill=category,x=Group,y=pct))+
  geom_bar(stat="identity")+
  coord_flip()

ggplot(dd,aes(colour=category,x=Group,y=pct))+
    scale_x_discrete()+
    ggalt::geom_lollipop(size=5) + 
    coord_flip() +
    theme(legend.position="none") +
    labs(x="",y="Percent of adults with AMI")+
    scale_colour_brewer(palette="Dark2")+
  annotate(geom="vline",xintercept=c(5.5,7.5),
           linetype=2)

