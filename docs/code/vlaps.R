library(shellpipes)
library(dplyr)
library(forcats)

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
)
csvSave(vlap)
rdsSave(vlap)

