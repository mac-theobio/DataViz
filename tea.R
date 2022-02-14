library(factoextra)
library(ggplot2); library(ggdark); theme_set(dark_theme_grey())

library(shellpipes)
startGraphics(height=5)

load("data/wine.RData")      ## numeric matrix (wine)
load("data/wineClass.RData") ## metadata (wine.class)

winePCAd <- prcomp(wine, scale = TRUE) ## compute PCA

## Scale axes by importance
sdvec <- winePCAd$sdev[1:2]
coord_ratio <- sdvec[2]/sdvec[1]

print(
	fviz_pca_biplot(winePCAd
		, geom = "point", habillage = wine.class
		, col.var = "violet", addEllipses = TRUE, ellipse.level = 0.69
	)
	+ dark_theme_bw()
   + scale_colour_brewer()
	+ scale_fill_brewer()
   + ggtitle("Wine component biplot") + coord_fixed()
   + coord_fixed(ratio = coord_ratio)
)


