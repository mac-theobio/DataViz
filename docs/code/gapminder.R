## https://github.com/keithmcnulty/hans_rosling_bubble/blob/master/rosling.R
# packages

library(tidyverse)
library(ggplot2)
library(viridis)
library(gganimate)
library(wbstats)

## Talk to us if you have trouble installing gifski
## There are substitutes (including magick)
library(gifski)

# Rosling gapminder chart: previously in one command ...

## Download data unless it's already found; run this in a place with a data subdirectory
if (!file.exists("data/wbdata.rda")) {
  ## pull the country data down from the World Bank - three indicators
  wbdata0 <- wbstats::wb_data(indicator = c("SP.DYN.LE00.IN",
                                    "NY.GDP.PCAP.CD",
                                    "SP.POP.TOTL"),
                      country = "countries_only",
                      start_date = 1960,
                      end_date = 2018)

  wbdata1 <- (wbdata0
    ## pull down mapping of countries to regions and join
    %>% dplyr::left_join(wbstats::wb_countries()
                         %>% dplyr::select(iso3c, region),
                         by="iso3c"))
  save("wbdata1",file="data/wbdata.rda")
} else {
  load("data/wbdata.rda")
}

## plot the data (everything)
gg0 <- (ggplot(wbdata1,
               aes(x = log(NY.GDP.PCAP.CD),
                   y = SP.DYN.LE00.IN,
                   size = SP.POP.TOTL,
                   group=country))
    + geom_point(alpha = 0.5, aes(color = region))
    + scale_size(range = c(.1, 16), guide = "none")
    + scale_x_continuous(limits = c(2.5, 12.5))
    + scale_y_continuous(limits = c(30, 90))
    + viridis::scale_color_viridis(discrete = TRUE,
                                 name = "Region", option = "viridis")
    + labs(x = "Log GDP per capita",
           y = "Life expectancy at birth",
           size = "Population size")
    + theme_classic()
    + geom_text(aes(x = 7.5, y = 60, label = date),
                size = 14, color = 'lightgrey'
                ## , family = 'Oswald' ## not available everywhere
                )
)
print(gg0)

## rendering takes about 30 seconds
## animate it over the variable "date"
gg1 <- (gg0 
	+ transition_states(date, transition_length = 1, state_length = 1) 
	+ ease_aes('cubic-in-out')
)

## Animate as gif
gg1gif <- animate(gg1)
anim_save("gapminder1.gif")

## You can get a prettier animation if you have installed ffmpeg
## ask us about this, too
gg1mp4 <- animate(gg1,renderer=ffmpeg_renderer())
anim_save("gapminder1.mp4")

