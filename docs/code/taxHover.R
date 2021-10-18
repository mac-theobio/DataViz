library(dplyr)
library(ggplot2)
library(plotly)
library(htmlwidgets)
library(shellpipes)
rpcall("taxHover.Rout taxHover.R data/tax.rda")

loadEnvironments()

summary(tax)

xlabs <- c("0-10th", "20th-30th", "40th-50th", "60th-70th",
           "80th-90th", "95th-99th", "99.99th", "Top 400")
xbr <- seq(0, 14, 2)

theme_set(theme_bw())
stat <- (tax
    %>% highlight_key(~year)
    %>% ggplot(aes(income_group,total_tax_rate,
                   colour=year,group=year))
    + geom_line(size=2)
    + labs(x="Income group", y="Total tax rate")
    + scale_x_continuous(labels=xlabs, breaks=xbr)
)

print(stat)

dyn <- (stat
    %>% ggplotly(tooltip="group")
    %>% highlight(on="plotly_hover",
			off=NULL,
			color="gold",
			dynamic=TRUE
		)
)

dyn %>% as_widget %>% saveWidget(targetname(ext=".dyn.html"))

