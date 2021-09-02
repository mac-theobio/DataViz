---
title: Data visualization
bibliography: vis.bib
---

<!-- from https://www.w3schools.com/css/css_table.asp -->
<style>
th, td {
   vertical-align: top;
   padding: 15px;
}
tr:nth-child(even) {background-color: #f2f2f2;} 
th {background-color: #ccccff;}
</style>


<!-- 
## Current

We are looking forward to seeing you on Friday for an organizational meeting!  Sep 6 from 9:30-10 AM in Hamilton Hall 207 (the main floor of Hamilton Hall)

-->

## Info

This course will be offered in Fall 2021. The web page is under construction and may contain some material
left over from the previous offering of the course.

### Course meetings

TBA

### Links

- [Course outline](outline.html) (or at [math & stats web site](https://mcmasteru365.sharepoint.com/:w:/s/sci-course-outlines/EQIfPDteOwhApDyncmtsPccBnD1-BnBNvI3d7lHqbVDRKQ?e=2Vt5pV))
- [Assignments](assignments.html)
    - [Fall 2019 (previous) assignments](assignments_old.html)
- [The github back-end for this site](https://github.com/mac-theobio/DataViz/)

## Faculty

-   [Ben Bolker](http://www.math.mcmaster.ca/~bolker/)
-   [Jonathan Dushoff](http://www.biology.mcmaster.ca/dushoff/)

## Schedule

TBA

```{r echo=FALSE,message=FALSE,warning=FALSE, results="asis", eval=FALSE}
## what do we want to include here?
## do we need to hack format?
##   widths
##   alternating gray background?
## is there something better than pander (e.g. huxtable)?
## how do we associate notes with 
library("pander")
## library("huxtable")
library("dplyr")
library("readr")
mk_url <- function(x) {
  ifelse(nchar(trimws(x))==0,x,
         sprintf("[%s](https://mac-theobio.github.io/DataViz/%s.html)",
                 x,x))
}
dd <- (read_csv("sched.csv", comment="#")
  %>% mutate(`lecture notes`=mk_url(`lecture notes`))
)
## dd <- dd[,1:4]
## topics <- read.csv("topics.csv")
## dd2 <- arrange(merge(dd,topics,by.x="topic",by.y="title",all.x=TRUE),number)
panderOptions('missing', '')
panderOptions('table.split.cells', 15)
panderOptions('table.split.table',Inf)
panderOptions('table.style','multiline')
panderOptions('table.alignment.default','left')
pander(dd)
##print_latex(theme_plain(huxtable(dd)))
```

<!-- regular html comment
...
--> 


## References

