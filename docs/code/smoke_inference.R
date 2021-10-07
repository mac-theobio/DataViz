
library(broom)
library(dotwhisker)
library(shellpipes)

bs=18
vls=0.8
dws=1
library(ggplot2); theme_set(theme_bw(base_size=bs))

library(dplyr)

smoke <- rdsRead()
full <- lm(fev ~ age + height + sex + smoking, data=smoke) 
print(summary(full))

print(
	dwplot(full, by_2sd=FALSE)
	+ geom_vline(xintercept=0,lty=2, size=vls)
	+ ggtitle("Regression coefficients")
)

new_plot <- (
	dwplot(full)
	+ geom_vline(xintercept=0,lty=2, size=vls)
	+ ggtitle("Regression coefficients")
)

stdsmoke <- (smoke
	%>% mutate(scap = fev/sd(fev)
		, age = age/sd(age)
		, height = height/sd(height)
		, male_sex = as.numeric(as.factor(sex))
		, male_sex = male_sex/sd(male_sex)
		, nonsmoking = as.numeric(as.factor(smoking))
		, nonsmoking = nonsmoking/sd(nonsmoking)
	)
)

std <- lm(fev ~ age + height + male_sex + nonsmoking, data=stdsmoke)
summary(std)

print(
	dwplot(std, whisker_args=list(size=dws))
	+ geom_vline(xintercept=0,lty=2, size=vls)
	+ ggtitle("Scaled effect on lung capacity (L/s)")
)

partial <- lm(scap ~ age + height + male_sex + nonsmoking, data=stdsmoke)

print(
	dwplot(partial, whisker_args=list(size=dws) , by_2sd=FALSE)
	+ geom_vline(xintercept=0,lty=2, size=vls)
	+ ggtitle("Partial correlations with lung capacity")
)

