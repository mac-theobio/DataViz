library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(tidyr)
library(shellpipes)

height <- 5
widthFactor <- 7e6
startGraphics(height=height)

dat <- (tsvRead()
	%>% mutate(Pop=Number/Prop)
)

base <- (ggplot(dat)
	+ aes(Age, Prop)
	+ ylab("Proportion vaccinated")
)

print(base + geom_point())

print(base + geom_point()
	+ scale_y_continuous(trans = "logit")
)

print(base
	+ geom_col()
	+ ylim(c(0, 1))
)

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

both <- (ggplot(longdat)
	+ aes(Age, Prop)
	+ ylab("Proportion vaccinated")
)

print(both
	+ geom_col()
	+ ylim(c(0, 1))
)
