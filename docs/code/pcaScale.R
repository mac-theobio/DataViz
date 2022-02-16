library(factoextra)
library(ggplot2); theme_set(theme_bw(base_size=16))

library(shellpipes)
startGraphics(height=5)

loadEnvironments()

winePCAd <- prcomp(wine, scale = TRUE) ## compute PCA

biplot_uns <- (
	fviz_pca_biplot(winePCAd
		, geom = "point", habillage = wine.class
		, col.var = "violet", addEllipses = TRUE, ellipse.level = 0.69
	)
   + scale_colour_brewer(palette="Dark2")
	+ scale_fill_brewer(palette="Dark2")
	+ coord_fixed()
   + ggtitle("Wine components")
)

## Scale axes by importance
sdvec <- winePCAd$sdev[1:2]
coord_ratio <- sdvec[2]/sdvec[1]

print(biplot_uns)
print(biplot_uns + coord_fixed(ratio = coord_ratio))
