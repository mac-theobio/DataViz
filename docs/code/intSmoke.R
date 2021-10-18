library(readr)
library(dplyr)
library(ggplot2); theme_set(theme_bw(base_size=18))

library(plotly)
library(htmlwidgets)

library(shellpipes)

smoke <- csvRead() %>% rename(smoking=smoke)
summary(smoke)

af <- (ggplot(smoke, aes(x=age, y=fev, label1=id, label2=height))
	+ ylab("Lung capacity")
	+ geom_point() 
) %>% ggplotly(tooltip=c("id", "height"))

htmlname <- paste0(rtargetname, ".R.html")
## saveWidget(as_widget(( af)), htmlname)

an <- (ggplot(smoke, aes(label1=id, label2=height, frame=age))
	+ ylab("Lung capacity")
	+ geom_point(aes(x=height, y=fev)) 
)

ggp <- (ggplotly(an, height = 900, width = 900)
	%>% animation_opts()
)

saveWidget(as.widget(ggp), htmlname)

