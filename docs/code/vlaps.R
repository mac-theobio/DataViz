library(shellpipes)
library(dplyr)
library(forcats)

rpcall("vlaps.Rout vlaps.R f1data/drivers.csv f1data/races.csv f1data/lap_times.csv f1data/circuits.csv f1data")

vlap <- (csvRead("drivers")
	%>% filter(surname=="Verstappen")
	%>% left_join(csvRead("times"))
	%>% left_join(csvRead("races"), by="raceId")
	%>% left_join(csvRead("circuits"), by="circuitId")
	%>% filter(year >= 2018)
	%>% transmute(NULL
		, race=name.x, circuit=name.y
		, year, lap, position, time=milliseconds/1000
	)
	%>% mutate(across(where(is.character), ~fct_rev(fct_infreq(.))))
	## %>% mutate(race=fct_rev(fct_infreq(race)))
)
csvSave(vlap)
rdsSave(vlap)

