data(cbpp, package="lme4")
library(broom)
cb <- transform(cbpp, prop = incidence/size,
                period = as.numeric(as.character(period)))
m1 <- glm(prop ~ period, weights = size, data = cb, family = binomial)
library(broom)
nd <- data.frame(period  = 1:2)
library(ggplot2)

ggplot(cb, aes(period, prop)) + 
  geom_point() +
  geom_smooth(method = "glm", aes(weight = size),
              method.args = list(family = quasibinomial))


library(ggeffects)
ggpredict(m1) %>% as.data.frame()

