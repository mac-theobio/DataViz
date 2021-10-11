

# Final project

Your final project will be done with in a group of size 1-3. The profs will help you pair up (and check with us if you really think you want to go alone).

The project should consist of an exploration of some data. There should be a consistent topic but you needn't use only a single data file.

Your project should consist roughly of a brief description of the data set, and three or four well-thought-out visualizations (this is a guide, you could have a few as one really fancy one, or as many as ten simple ones that work really well together).

Your **presentation** will be in person (or at least synchronous), using some sensible format; we encourage reproducible formats but Powerpoint is acceptable. Aim for 10 minutes and be prepared to answer questions.

Your **writeup** should be in two parts: the *main text* will be just the text necessary to support the story that you're trying to tell, and there should be a *methods* part explaining briefly some of the visualization choices that you made, and if necessary briefly explaining decisions or data cleanup you had to do. Your project should be (very roughly) 10 pages long. Do *not* include code in your writeup except (if necessary) short snippets illustrating some technical issue you solved.

Please submit your writeup as a PDF or HTML file by noon on 22 December. Submit by pushing to your repository (ideally with all of the scripts used to construct the visualizations from raw data) and letting us know the name of the primary file.

## Project milestone

Please submit a brief (0.5-2 pages) prospectus outlining what data you will use and some ideas about the story you wish to tell.

You should post this on a github repo. This can either be a directory in an existing repo, or a new repo to which one of you invites both of us (bbolker, dushoff) and your group members.

# Weekly assignments

## week 5

1.  **due Fri Oct 22**: Fit a model to real data, or find a table of model results, and one or two plots illustrating a statistical inference. Let us know if you need help finding a data set, or a plausible scientific question to attack with a model.

2. Read Sections 12-16 of [Wilke's _Fundamentals of Data Visualization_](https://serialmentor.com/dataviz/) (and (**due Weds Oct 20**) post a discussion question on the Teams channel)

## week 4

No written assignment. Please read Sections 12-16 of [Wilke's _Fundamentals of Data Visualization_](https://serialmentor.com/dataviz/)

### for Monday

- e-mail us one discussion question or comment about Wilke sections 8-11

## week 4

### For Friday:

1. Find a table that you find hard to read and turn it into one, two or three graphs. Explain what features of the data you are trying to draw attention to, and what story you think your figures tell (or fail to tell).

If you have trouble finding a Table you could consider these:

* Table 3 of [McCallum et al. 2017](http://www.sciencedirect.com/science/article/pii/S0166445X16303757)
* Table 3 of [Dushoff et al. 2005](https://academic.oup.com/aje/article/163/2/181/95820)

### for Monday 

- read Sections 8-11 of [Wilke's _Fundamentals of Data Visualization_](https://serialmentor.com/dataviz/)


## week 3

For Friday:

* take a look at Jia You's online graphic about vaccine [here](http://www.sciencemag.org/news/2017/04/here-s-visual-proof-why-vaccines-do-more-good-harm) (**update**, a copy of the full version is [here](https://twitter.com/acuadra/status/859096708264996864/photo/1)
* to get the data, you can use
```{r eval=FALSE}
readr::read_csv("https://mac-theobio.github.io/DataViz/data/vaccine_data_online.csv")
```
or download the data directly from [AAAS](http://sciencestatic.aws.aaas.org.s3.amazonaws.com/article-resources/vaccine-war/vaccine_data_online.csv)
or get it from the [course data page](../data/index.html)

* write a short statement (a few sentences) that explains what question you think the graphic is trying to answer, or what pattern it's trying to display
* based on these data, create 2 ggplots that display the data in a different way from the original; use the 2 plots to illustrate tradeoffs between different graphical principles. (If you're feeling truly uncreative, one of your plots can replicate the original graphical design.) You do **not** need to worry about the dynamic-graphics aspect or the historical events shown in the original display
* explain (in a few sentences) why your graph or graphs answer the question better than the original graph
* Put your **reproducible** code in your main repository directory
	* use either `hw2.R` (with comments as comments or in `hw2.txt`) or else `hw2.rmd` for the code
	* put the output graphs (or rmarkdown output) in a directory called `HW2` 
* *extra credit*: see if you can find information about vaccine coverage over time (i.e., estimates of fraction vaccinated in the US per year) - not just the date of licensing - and incorporate it in your results (we have no idea if this is possible)


## week 2

For Monday: 

- find an example (on the web, in a research paper, etc etc etc) of *either* a **great** (in your opinion) or a **terrible** (also in your opinion) data visualization. 
- write a explanation of a few sentences that explains what is good about it (e.g. interesting, engaging, funny, makes good use of Cleveland principles, makes a point clearly ...) or bad about it (is it ugly, bad, or wrong [see Wilke chapter 1]? [inaccessible](https://twitter.com/FrankElavsky/status/1396898372183855105)? how/why?)
- put the explanation and a link to the example (you can upload images to your github repo) in the `README` file in your GH repository, and e-mail us that you've done so. (If you run into git trouble you can e-mail us your assignment instead, but putting it all in the repo is better.) (Plain text only, please - in this course we *never* want `.docx` (Word) files. PDF is OK, but plain text [including `.R` files and Markdown files] are always preferred when they work.)

For Friday's class:

- read Sections 4-7 of [Wilke's _Fundamentals of Data Visualization_](https://serialmentor.com/dataviz/)

## week 1

For Wednesday's class:

- make sure you have R (https://cloud.r-project.org/) and RStudio
(https://www.rstudio.com/products/rstudio/download/) installed. Please
make sure you have at least version 4.0 of R.
- set up a GitHub account (https://github.com) if you don't already have
one (see
https://beta.rstudioconnect.com/jennybc/happy-git-with-r/github-acct.html for
more information)

For Friday's class:

- watch Rauser's ["How Humans See Data"](https://www.youtube.com/watch?v=fSgEeI2Xpdc)
- read Sections 1-3 of [Wilke's _Fundamentals of Data Visualization_](https://serialmentor.com/dataviz/)
- read and follow chapters 1, 5, 7, 8, 10 of [""Happy Git with R""](https://beta.rstudioconnect.com/jennybc/happy-git-with-r/)(they're short!)
reading: "Git stuff (; [GitHub with GitHub desktop](https://jcszamosi.github.io/mcmaster_swc_git_gui/); [GitHub on the command line](https://swcarpentry.github.io/git-novice/)); tidyverse stuff (Software Carpentry lessons on [dplyr](http://swcarpentry.github.io/r-novice-gapminder/13-dplyr/) and [tidyr](http://swcarpentry.github.io/r-novice-gapminder/14-tidyr/); [tidyverse cheat sheets](https://www.rstudio.com/resources/cheatsheets/) (see especially ""data import"" and ""data transformation""))"
   - create an (empty except for a `README` file) repository called
Stat744, and add `dushoff` and `bbolker` as collaborators
   - email us to let us know you have finished, and to tell us your
github username


## General

For the first part of the course, there will be a short assignment every week. These will be promulgated usually on Sunday, and you are advised to start before class on Monday. Assignments are technically due Friday at 16:30. This is to encourage you to finish quickly if you can, and move on with your life, not to give you pressure. 

If your assignment will be late, please email us by Friday at 16:30 to let us know when you will hand it in. This should be before 16:30 on Monday, unless we give permission for special circumstances.

**Submit your assignment by email** to [macdataviz@gmail.com](mailto:macdataviz@gmail.com). Your assignment is not done until you do this. 

<!-- Comment
    See QMEE/ assignments for more text that we will want to adapt when we give them R assignments.
-->


