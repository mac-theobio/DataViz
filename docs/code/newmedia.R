library(tidygraph)
library(igraph)
library(ggraph); theme_set(theme_void())

set.seed(213)

ntmp <- read.csv("data/sunbelt/Dataset1-Media-Example-NODES.csv", header=TRUE, as.is=TRUE)
etmp <- read.csv("data/sunbelt/Dataset1-Media-Example-EDGES.csv", header=TRUE, as.is=TRUE)

## summary(etmp)

## use dplyr-like stuff with the tbl_graph using activate()
citen <- tbl_graph(ntmp, etmp)

summary(citen)
print(citen)

hb <- ggraph(citen)

## wran <- range(activate …

print(hb 
	+ geom_edge_fan(aes(color=type, width=weight)
		, arrow = arrow(length = unit(3, 'mm'))
		, end_cap = circle(1.5, 'mm')
		, alpha=0.4
	) + scale_edge_width(range=c(0.1, 2.3))
	+ geom_node_point(aes(size=audience.size, color=type.label))
	+ scale_color_brewer(palette="Dark2")
	+ scale_size_area(max_size=3)
	+ geom_node_text(aes(label=media), repel=TRUE)
)

quit()

print(ggraph(citen, layout="hive", axis=type.label, sort.by=-audience.size)
	+ geom_edge_hive()
	+ geom_node_point()
	+ geom_axis_hive(aes(color=type.label), label=FALSE)
)
