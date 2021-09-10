library(dplyr)
library(shellpipes)

offset <- 15
temps <- (csvRead()
	%>% mutate(Temp=offset+Mean)
)

gis <- (temps
	%>% filter(Source=="GISTEMP")
	%>% select(-Source)
)

saveVars(temps, gis)
