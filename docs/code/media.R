library(igraph)

## Put Data directory from http://www.kateto.net/wordpress/wp-content/uploads/2019/06/sunbelt2019.zip here as sunbelt
ntmp <- read.csv("data/sunbelt/Dataset1-Media-Example-NODES.csv", header=TRUE, as.is=TRUE)
ltmp <- read.csv("data/sunbelt/Dataset1-Media-Example-EDGES.csv", header=TRUE, as.is=TRUE)

medialinks <- graph_from_data_frame(d=ltmp, vertices=ntmp, directed=TRUE)

## default: ?igraph::layout_nicely (fr for small data, drl for large data)
plot(medialinks)
plot(medialinks, edge.arrow.size=.4)
## random
plot(medialinks, edge.arrow.size=.4, layout=layout_randomly)
## kk: Kamada-Kawai (?igraph::layout_with_kk)
plot(medialinks, edge.arrow.size=.4, layout=layout_with_kk)
## fr: Fruchterman-Reingold (?igraph::layout_with_fr)
plot(medialinks, edge.arrow.size=.4, layout=layout_with_fr)
plot(medialinks, edge.arrow.size=.4,vertex.label=NA, layout=layout_with_fr)
## drl: "DrL" (Distributed Recursive Layout) (?igraph::layout_with_drl)
plot(medialinks, edge.arrow.size=.4, layout=layout_with_drl)
## rdsave(medialinks)
