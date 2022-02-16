library(readr)
library(dplyr)
library(forcats)
library(shellpipes)
rpcall("canada.Rout canada.R data/canada.tsv")

canada <- (tsvRead()
	%>% transmute(NULL
		, Mh = Total/1e4
		, Mp = Population/1e6
		, Province = Abbreviation %>% factor %>% fct_reorder(Mh)
	)
)

summary(canada)

rdsSave(canada)
