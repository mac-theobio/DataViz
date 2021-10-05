library(tidyverse)
library(readxl)
dd <- read_excel("../data/Table4.xlsx")

site_order = c("WWTP","Outfall","Downstream", "Reference")
x.ordered <- factor(dd$Site, levels=site_order)
plot_colours = c("red", "#FF6363", "#FFA1A1", "#5FAF6D")
`p1 <-
  ggplot(dd, aes(x=x.ordered, Temperature)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab(expression("Temperature"~(degree*C)))

p2 <-
  ggplot(dd, aes(x=x.ordered, pH)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
p3 <-
  ggplot(dd, aes(x=x.ordered, DO)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Dissolved O. (mg/L)")
p6 <-
  ggplot(dd, aes(x=x.ordered, Conductivity)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Conductivity (??S)")
p5 <-
  ggplot(dd, aes(x=x.ordered, Salinity)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Salinity (ppm)")
p4 <-
  ggplot(dd, aes(x=x.ordered, TDS)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("TDS (ppm)")
p7 <-
  ggplot(dd, aes(x=x.ordered, Flow)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Flow (m/s)")
