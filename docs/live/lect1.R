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