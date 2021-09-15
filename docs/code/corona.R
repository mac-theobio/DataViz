library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(shellpipes)

dat <- csvRead()

summary(dat)

ON <- filter(dat, Province=="ON")

summary(ON)

saveVars(dat, ON)

