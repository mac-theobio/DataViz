library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(shellpipes)

height <- 5
startGraphics(height=height)

## Use this call to make coronaPlots.Rout independently
loadEnvironments()

onp <- (ggplot(ON)
	+ aes(Date, newConfirmations)
	+ ggtitle("ON coronavirus")
	+ ylab("New confirmations")
	+ geom_line()
)

print(onp)
print(onp + scale_y_log10(limits=c(10, NA)))
