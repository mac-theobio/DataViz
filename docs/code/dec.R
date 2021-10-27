library(factoextra)
library(tidyr)
library(dplyr)
library(shellpipes)
rpcall("dec.Rout dec.R")

summary(decathlon2)
attributes(decathlon2)

## Use event columns only; restrict to one Competition
raw_frame <- (decathlon2
	%>% filter(Competition=="OlympicG")
	%>% select(-c("Rank", "Points", "Competition"))
)
raw_mat <- as.matrix(raw_frame)

## Rows are athletes
ath_frame <- (raw_frame
	%>% rename_all(sub, pattern="^X", replacement="Run_")
	%>% rename_all(sub, pattern="110m.", replacement="")
	%>% mutate_at(vars(contains('Run_')), ~(-1*.)) ## use across() (would 1/x be better??)
	%>% mutate_all(~ drop(scale(.)))
)
row.names(ath_frame) <- row.names(raw_frame)
summary(ath_frame)
attributes(ath_frame)

ath_mat <- as.matrix(ath_frame)
event_mat <- t(ath_mat)

saveVars(raw_mat, ath_frame, ath_mat, event_mat)
