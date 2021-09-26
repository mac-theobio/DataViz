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
(`ggplot` uses {0.3, 1, 3, 10} while base R uses {0.2, 0.5, 1, 2, 5, 10})
- simpler way to do a bar plot with width mapped to a variable/auto-scaled (cf. vaccination proportion example)


## partly solved

Solutions exist, but they could be automated/made more elegant.

- bubbles (https://stackoverflow.com/questions/52612867/create-a-concentric-circle-legend-for-a-ggplot-bubble-chart; can this be automated?)

## solved

- set zero expansion at lower/left edge to 0 (and truncate/squish values going below 0):

```{r, eval=FALSE}
scale_y_continuous(
    expand=expansion(mult=c(0,0.05)), ## 0 proportional expansion at bottom, 5% (default) at top
    limits=c(0,NA),                   ## set lower limit to zero, leave upper limit data-defined
    oob = scales::squish) +           ## squash out-of-bounds values to lower/upper axis
                                      ## (clipping would be better but is hard)
  scale_x_continuous(expand=expansion(mult=c(0,0.05)))  ## same as first line of y scale, but for left/right
```
