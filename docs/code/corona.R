library(dplyr)
library(shellpipes)
rpcall("corona.Rout corona.R data/coronaCA.csv")

dat <- csvRead()

summary(dat)

ON <- filter(dat, Province=="ON")

summary(ON)

saveVars(dat, ON)

