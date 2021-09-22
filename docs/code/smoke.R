library(readr)
library(dplyr)
library(shellpipes)

smoke <- csvRead() %>% rename(smoking=smoke)

rdsSave(smoke)
