library(dplyr)

library(shellpipes)

set.seed (2046)

ng <- 8
samps <- 20
between <- 0.4
within <- 0.2

geff <- rnorm(ng, sd=between)
genotypes <- factor(1:ng) %>% reorder(geff, FUN = mean)

nl <- list()
for (i in 1:length(genotypes)){
	j <- order(geff)[[i]]
	j <- i
	print(j)
	nl[[i]] <- tibble(sample = 1:samps
		, rat = rlnorm(samps, meanlog=geff[[j]], sdlog=within)
		, prop = rat-1
		, invprop = 1/rat-1
		, gen = genotypes[[j]]
		, centinel=100*log(rat)
	)
}

df <- bind_rows(nl)

summary(df)

rdsSave(df)
