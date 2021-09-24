library(tidyverse)
library(directlabels)
dd <- (read_csv("data/FAOSTAT_data_1-7-2018.csv")
        %>% select(Year, Value, Country)
        %>% mutate(Country = factor(Country),
                   Country = reorder(Country, Value,
                        FUN = min))#
                          #function(x) x[length(x)])) ## reorder by mean Value
)
levels(dd$Country)
gg0 <- (ggplot(dd, aes(x=Year, y = Value, colour = Country)) 
   + geom_line(size= 2, aes(linetype = Country))
   + scale_colour_discrete(guide = guide_legend(reverse=TRUE))
    + theme_classic()
   + expand_limits(x=2007)
)

direct.label(gg0)
