library(tidyverse)
## choose specific rows
filter(mtcars, cyl == 4)
## ditto, columns
select(mtcars, cyl, mpg)
mutate(mtcars, cyl_sq = cyl^2)  ## change or create a new variable
mutate(mtcars, cyl = cyl/10)  ## change or create a new variable

mtcars %>% filter(cyl == 4) %>% select(cyl) %>% mutate(cyl_sq = cyl^2)

(mtcars 
  %>% filter(cyl == 4) 
  %>% select(cyl) 
  %>% mutate(cyl_sq = cyl^2)
)

## more data
mtcars %>% 
  filter(cyl == 4) %>% 
  select(cyl) %>% 
  mutate(cyl_sq = cyl^2)

## tibbles  ("table")
mtcart <- tibble(mtcars)  ## coercion or casting
class(mtcars)
class(mtcart)
str(mtcars[,1])  ## structure
str(mtcart[,1])
mtcart[[1]]  ## safer
mtcart$mpg  ## always use names instead of numbers when possible
mtcart[["mpg"]]  ## best (for programming)
## you can use indirect references:
var <- "mpg" ## avoid using built-in names like 'var'
mtcart$var
mtcart[[var]]
mtcars$mp  ## partial variable name works for data frames!
mtcart$mp  ## doesn't work for tibble
mtcart %>% pull(mpg)  ## 'pull' = extract a column

## tidyverse cheat sheets
(mtcart 
  %>% group_by(cyl,am)
  %>% summarise(wt=mean(wt))
)
