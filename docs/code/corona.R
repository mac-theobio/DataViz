library(dplyr)
library(shellpipes)

dat <- csvRead()

summary(dat)

ON <- filter(dat, Province=="ON")

summary(ON)

saveVars(dat, ON)

