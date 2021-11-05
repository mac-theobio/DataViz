## remotes::install_github("clauswilke/colorblindr")
## remotes::install_github("clauswilke/dviz.supp")
## install this package to get tech_stocks data,
##   but DON'T load it (asks for fonts etc. that I don't have)
## library(dviz.supp)
library(tidyverse)
library(lubridate)
library(ggridges)
library(cowplot)
theme_set(theme_cowplot())

data("tech_stocks", package = "dviz.supp")
df_fb_drop <- (tech_stocks
    %>% ungroup()
    %>% filter(ticker == "FB",
               between(date, ymd("2016-10-22"), ymd("2017-01-22"))
               )
)

fb_drop_0 <- ggplot(df_fb_drop, aes(x=date)) +
  scale_x_date(name = NULL, #name = "day",
               breaks = ymd(c("2016-11-01", "2016-12-01", "2017-01-01")),
               labels = c("Nov 1, 2016", "Dec 1, 2016", "Jan 1, 2017"),
               expand=c(0, 0)) + 
  scale_y_continuous(name="stock price (USD)",
                     limits = c(110, 135),
                     expand=c(0, 0))
## dviz.supp() stuff not included
## theme_dviz_open() +
## background_grid(major = 'y', minor = 'none') +
## theme(plot.margin = margin(14, 7, 3, 1.5))


fb_drop_bad <- fb_drop_0 + geom_ridgeline(aes(height=price - 110, y = 110), alpha = 0.7)

print(fb_drop_bad)

fb_drop_0 + geom_line(aes(y=price)) + theme(axis.line.x = element_blank()) +
    geom_hline(yintercept=120, lty=2)

## use max value instead? (if trying to denote drop)
## automatically moving the ticks and labels up to the middle seems hard:
## https://stackoverflow.com/questions/17753101/center-x-and-y-axis-with-ggplot2/49202967#49202967
##   (disappointing: https://stackoverflow.com/questions/62345433/how-to-center-axes-in-ggplot2)

## "should" be possible!
