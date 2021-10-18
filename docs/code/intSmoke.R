library(readr)
library(dplyr)
library(ggplot2); theme_set(theme_bw(base_size=18))

library(plotly)
library(htmlwidgets)

library(shellpipes)

smoke <- csvRead() %>% rename(smoking=smoke)
summary(smoke)

volAge <- (
	ggplot(smoke, aes(x=age, y=fev, label1=id, label2=height))
	+ ylab("Lung capacity")
	+ geom_point() 
)

(volAge
	%>% ggplotly(tooltip=c("id", "height"))
	%>% as_widget
	%>% saveWidget(targetname(ext=".graph.html"))
)

volAgeF <- volAge + aes(frame=age)

(volAgeF
	%>% ggplotly(tooltip=c("id", "height"), height = 900, width = 900)
	%>% animation_opts()
	%>% as_widget
	%>% saveWidget(targetname(ext=".anim.html"))
)

