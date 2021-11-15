library(igraph)
library(ggraph)
theme_set(theme_void())

layout <- ggraph(medialinks, layout="fr")

old <- print(layout
	+ geom_edge_link()
	+ geom_node_point()
	+ geom_node_text(aes(label=media))
) 

## EDGE aesthetics: type,weight
## NODE media,media.type,type.label,audience.size

print(layout
	+ geom_edge_fan(aes(color=type, width=weight))
	+ geom_node_point(aes(size=audience.size, color=type.label))
	+ scale_size_area() ## Confirm DOES THIS WORK?
	+ geom_node_text(aes(label=media), repel=TRUE)
) 
