library(ggplot2); theme_set(theme_bw(base_size=18))
library(dplyr)
library(shellpipes)
rpcall("coronaPlots.Rout coronaPlots.R corona.rda")

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

print(onp 
	+ geom_hline(yintercept=0, color="blue")
	+ geom_vline(xintercept=max(ON$Date), color="blue")
)
print(onp + scale_y_log10(limits=c(10, NA)))
print(onp 
	+ geom_hline(yintercept=0, color="blue")
	+ geom_vline(xintercept=max(ON$Date), color="blue")
)
print(onp + scale_y_log10(limits=c(10, NA)))
