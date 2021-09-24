## ggplot hacks/quirks/wish list

Things we would like to fix/find a better way to do in `ggplot`:

- better minor grid lines/tick marks in log-axis graphs
	* using (0:n)/n for minor works surprisingly well for log-odds graphs unless they go really close to 0 or 1.
- better tick selection in log10 scales: e.g.
```r
set.seed(1001); dd <- data.frame(x = rlnorm(100, 0, 1), y = rlnorm(100,0,1))
png("log_base.png"); par(las=1); plot(y~x, data=dd, log="xy"); dev.off()
ggplot(dd, aes(x,y)) + geom_point() + scale_y_log10() + scale_x_log10(); ggsave("log_gg.png")
```
(ggplot uses {0.3, 1, 3, 10} while base R uses {0.2, 0.5, 1, 2, 5, 10})
- simpler way to do a bar plot with width mapped to a variable/auto-scaled (cf vaccination proportion example)

