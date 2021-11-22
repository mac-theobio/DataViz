library(igraph)
library(ggraph)

set.seed(2131)

dolphin <- read_graph("dolphins.gml", format="gml")

print(ggraph(dolphin, layout="kk")
	+ geom_edge_link()
	+ geom_node_point()
)

print(ggraph(dolphin, layout="fr")
	+ geom_edge_link()
	+ geom_node_point()
)

print(ggraph(dolphin, layout="randomly")
	+ geom_edge_link()
	+ geom_node_point()
)

