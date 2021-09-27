library(ggplot2)
library(ggplot2)

d <- data.frame(x = 1:10 , y = 1:10)

print(ggplot(d)
	+ aes(x, y)
	+ geom_point()
)
