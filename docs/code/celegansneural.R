library(igraph)
library(ggraph)

set.seed(2131)

elegans <- read_graph("celegansneural.gml", format="gml")

print(ggraph(elegans, layout="kk")
	+ geom_edge_link(aes(width=value))
	+ geom_node_point()
)

print(ggraph(elegans, layout="fr")
	+ geom_edge_link()
	+ geom_node_point()
)

print(ggraph(elegans, layout="randomly")
	+ geom_edge_link()
	+ geom_node_point()
)

