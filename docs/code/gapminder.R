## https://github.com/keithmcnulty/hans_rosling_bubble/blob/master/rosling.R
# packages

library(tidyverse)
library(ggplot2)
library(viridis)
library(gganimate)
library(wbstats)
## need gifski *or* magick package, *or* something ...

# Rosling gapminder chart: previously in one command ...

# pull the country data down from the World Bank - three indicators
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
save("wbdata1",file="../data/wbdata.rda")
if (file.exists("../data/wbdata.rda")) {
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

if (require("gifski")) {
    ## animate it over years
    gg1 <- gg0 + gganimate::transition_states(date,
                           transition_length = 1, state_length = 1) +
        gganimate::ease_aes('cubic-in-out')


    gg1A <- animate(gg1,renderer=ffmpeg_renderer())
    ## anim_save("gapminder1.mp4")

    ## OR
    gg1B <- animate(gg1)
    ## anim_save("gapminder1.gif")

}
## gifski needs Rust installed!
## rendering takes about 30 seconds

