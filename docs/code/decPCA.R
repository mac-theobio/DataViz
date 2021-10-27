library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(factoextra)
library(pheatmap)

library(shellpipes)
rpcall("decPCA.Rout decPCA.R dec.rda")
loadEnvironments()

pca_ath <- prcomp(ath_mat, scale=FALSE)
fviz_screeplot(pca_ath)

fviz_pca_ind(pca_ath)
fviz_pca_var(pca_ath)
fviz_pca_var(pca_ath, axes=c(2, 3))
fviz_pca_biplot(pca_ath)

## CHECK scaling of pheatmap
load <- with(pca_ath, sweep(rotation, MARGIN=2, FUN="*", sdev))
pheatmap(load, cluster_cols=FALSE)

