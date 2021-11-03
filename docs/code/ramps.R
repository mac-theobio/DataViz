library(shellpipes)
rpcall("ramps.Rout ramps.R")

palf <- colorRampPalette(c("gray80", "dark red")) 
plot(x=10:1, y=1:10, pch=19, cex=5, col=palf(10)) 
print(palf(10))
