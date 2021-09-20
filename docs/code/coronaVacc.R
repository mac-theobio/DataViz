library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(tidyr)
library(shellpipes) ## See lecture for link

height <- 5
widthFactor <- 7e6
startGraphics(height=height) ## shellpipes

## read_tsv (readr, tidyverse) 
dat <- (tsvRead()
	%>% mutate(Pop=Number/Prop)
)

base <- (ggplot(dat)
	+ aes(x=Age, y=Prop) ## aesthetic mapping
	+ ylab("Proportion vaccinated")
)

print(base + geom_point()) ## geometric objects show the data

print(base + geom_point()
	+ scale_y_continuous(trans = "logit"
		, breaks = (0:10)/10
		, minor_breaks = (0:40)/40
	)
)

print(base
	+ geom_col()
	+ ylim(c(0, 1))
)

## tidy data is long; it codes values that are comparable by putting them in the same column and then describing them
longdat <- (dat
	%>% transmute(NULL
		, Age=Age
		, Pop=Pop
		, vacc=Prop
		, unvacc=1-Prop
	)
	%>% pivot_longer(cols = c(vacc, unvacc)
		, names_to = "Status"
		, values_to = "Prop"
	)
)

print(dat)
print(longdat)

both <- (ggplot(longdat)
	+ aes(Age, Prop, fill=Status)
	+ ylab("Proportion vaccinated")
)

print(both
	+ geom_col()
	+ ylim(c(0, 1))
	+ coord_flip()
	+ aes(width=Pop/widthFactor)
)

## See geom_tile(): aesthetics(x, y, width, height)
## 	geom_rect(): aesthetics(x, y, xend, yend)
