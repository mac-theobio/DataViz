library(ggplot2); theme_set(theme_bw(base_size=18))

library(shellpipes)

height=7
startGraphics(height=height)
df <- rdsRead()

print(ggplot(df)
	+ aes(x=gen, y=100*prop)
	+ geom_boxplot()
	+ ylab("Percent difference (A vs B)")
)

print(ggplot(df)
	+ aes(x=gen, y=100*invprop)
	+ geom_boxplot()
	+ ylab("Percent difference (B vs A)")
)

print(ggplot(df)
	+ aes(x=gen, y=centinel)
	+ geom_boxplot()
	+ ylab("Centinel difference (A vs B)")
)

