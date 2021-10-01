library(ggplot2); theme_set(theme_classic(base_size=12))
library(dplyr)
library(tidyr)

library(shellpipes)

rpcall("vlap_plots.Rout lap_plots.R data/vlaps.rds")

lap <- rdsRead()

lap_bar_data <- (lap
  %>% select(race, circuit, year)
  %>% mutate(across(everything(), as.character))
  %>% pivot_longer(everything())
  %>% mutate(across(value, forcats::fct_infreq))
)

(ggplot(lap_bar_data)
  + geom_bar(aes(y=value), orientation="y")
  + facet_wrap(~name, scale="free_y", ncol=1)
)

## or:

bar_plot <- function(data, var) {
  gg <- (ggplot(data)
    + aes(x={{var}})
    + geom_bar()
    + coord_flip()
  )
  return(gg)
}


bar_plot(lap, circuit)
## but now how do we loop/iterate across columns?
## would be
## https://sebastiansauer.github.io/looping-purrr/

plot_list <- lap %>%
  select(where(is.factor)) %>%
  map(bar_plot, data = lap)


cowplot::plot_grid(plotlist= plot_list, ncol=1, align="v", axis = "t")
