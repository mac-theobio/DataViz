library(igraph)

set.seed(1003)

plot(medialinks)
plot(medialinks, edge.arrow.size=.4, main="Neater")
plot(medialinks, edge.arrow.size=.4, layout=layout_randomly, main="Question defaults")
plot(medialinks, edge.arrow.size=.4, layout=layout_with_kk, main="kk layout!")
plot(medialinks, edge.arrow.size=.4, layout=layout_with_fr, main="fr layout")
plot(medialinks, edge.arrow.size=.4,vertex.label=NA, layout=layout_with_fr, main="What are we trying to show?")

