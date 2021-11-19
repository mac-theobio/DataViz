library(tidygraph)
library(igraph)
library(ggraph); theme_set(theme_void())
library(dplyr)

set.seed(213)

ntmp <- read.csv("data/sunbelt/Dataset1-Media-Example-NODES.csv", header=TRUE, as.is=TRUE)
etmp <- read.csv("data/sunbelt/Dataset1-Media-Example-EDGES.csv", header=TRUE, as.is=TRUE)

## summary(etmp)

## use dplyr-like stuff with the tbl_graph using activate()
citen <- (tbl_graph(ntmp, etmp)
	%>% activate("edges")
	%>% rename(`link type`=type)
	%>% activate("nodes")
	%>% rename(medium=type.label)
)

summary(citen)
print(citen)

hb <- ggraph(citen)

## wran <- range(activate …

print(hb 
	+ geom_edge_fan(aes(color=`link type`, width=weight)
		, arrow = arrow(length = unit(3, 'mm'))
		, end_cap = circle(1.5, 'mm')
		, alpha=0.8
	) 
	+ scale_edge_width(range=c(0.1, 2.3))
	+ guides(edge_width="none")
	+ geom_node_point(aes(size=audience.size, color=medium))
	+ guides(size="none")
	+ scale_color_discrete(l=40)
	+ scale_edge_color_discrete(l=90, c=70)
	+ scale_size_area(max_size=3)
	+ geom_node_text(aes(label=media), repel=TRUE)
)

## Hive plot; foreground node category

print(ggraph(citen, layout="hive", axis=medium, sort.by=audience.size)
	+ geom_edge_arc(aes(color=`link type`, width=weight)
		, arrow = arrow(length = unit(3, 'mm'))
		, end_cap = circle(1.5, 'mm')
		, alpha=0.8
	) 
	+ scale_edge_width(range=c(0.1, 2.3))
	+ guides(edge_width="none")
	+ geom_node_point(aes(size=audience.size, color=medium))
	+ guides(size="none")
	+ scale_color_discrete(l=40)
	+ scale_edge_color_discrete(l=90, c=70)
	+ scale_size_area(max_size=3)
	+ geom_node_text(aes(label=media), repel=TRUE)
	+ geom_axis_hive(aes(color=medium), label=FALSE)
)
