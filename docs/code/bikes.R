library(readr)
library(dplyr)
library(shellpipes)

bike_weather <- csvRead("weather")

bikes <- (csvRead("hour")
	%>% left_join(bike_weather)
	%>% rename(rentals=cnt)
   %>% mutate(weather=reorder(weather,weathersit))
)

print(table(bikes$rentals))

rdsSave(bikes)
