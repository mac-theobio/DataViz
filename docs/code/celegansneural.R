library(igraph)
library(ggraph)
library(tidygraph)
library(colorspace)
theme_set(theme_void())

set.seed(2131)

elegans <- (
  read_graph("../data/celegansneural.gml", format="gml")
  %>% as_tbl_graph()
  %>% activate("nodes")
  %>% mutate(cpr =centrality_pagerank())
)

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


print(ggraph(elegans, layout = "stress")
      + geom_edge_link(aes(width = value), alpha = 0.03, colour = "wheat4")
      + geom_node_point(aes(colour = cpr, size = cpr))
      + scale_size(range = c(3, 12))
      + scale_colour_continuous_sequential(
            palette = "heat",
            ## palette = "lajolla",
            trans = "log10") +
      theme(panel.background = element_rect(fill = "#eeeeff"))
)
