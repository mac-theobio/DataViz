library(shellpipes)
library(readr)

temps <- read_csv("https://datahub.io/core/global-temp/r/annual.csv")

saveVars(temps)

