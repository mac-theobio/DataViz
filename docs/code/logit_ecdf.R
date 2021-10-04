do_install <- FALSE
if (do_install) {
  remotes::install_github("clauswilke/colorblindr")
  remotes::install_github("clauswilke/dviz.supp")
}
## from  https://github.com/clauswilke/dataviz/blob/153c1bbe5ed113c44156c355a662f765e5595212/visualizing_distributions_II.Rmd
library(ggplot2)
library(dviz.supp)

ggplot(US_census, aes(x=pop2010, y = 1-..y..)) +
  stat_ecdf(geom = "step", color = "#0072B2", size = 0.75, pad = FALSE) +
  scale_x_log10(expand = c(0.01, 0),
                breaks = 10^(2:7),
                labels = scales::trans_format('log10', scales::math_format(10^.x)),
                name = "number of county inhabitants") +
  ## scale_y_log10(expand = c(0.01, 0), breaks = c(1e-3, 1e-2, 1e-1, 1), name = "relative frequency") +
  scale_y_continuous(trans="logit", breaks=c(0.01,0.1,0.25,0.5,0.75,0.9,0.99)) +
  theme_dviz_grid() +
  theme(plot.margin = margin(3.5, 7, 3.5, 1.5))
