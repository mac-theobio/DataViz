library(rgl)
library(htmlWidgets)
with(as.data.frame(USArrests),
     plot3d(Murder, Assault, UrbanPop, type = "s")
     )
htmlwidgets::saveWidget(rglwidget(), "rgl_tmp.html")
browseURL("rgl_tmp.html")
