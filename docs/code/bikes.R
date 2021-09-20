library(readr)
library(dplyr)
library(shellpipes)

bike_weather <- csvRead("weather")

bikes <- (read_csv(input_files[[1]])
	%>% left_join(bike_weather)
	%>% rename(rentals=cnt)
   %>% mutate(weather=reorder(weather,weathersit))
)

print(table(bikes$rentals))

# rdsave(bikes)
