## Miscellaneous links

A variety of links that we've run across; hopefully these will get incorporated in the primary course material eventually, but in the meantime enjoy browsing!

- tweet about bad graphics: https://twitter.com/ASeatonSpatial/status/1520029030472462337
- Lin, Chujun, and Mark Allen Thornton. “Fooled by Beautiful Data: Visualization Aesthetics Bias Trust in Science, News, and Social Media.” PsyArXiv, December 17, 2021. https://doi.org/10.31234/osf.io/dnr9s.
- [What They Forgot to Teach You About R](https://rstats.wtf/index.html): tips on maintenance, workflows, etc..
* https://twitter.com/MapesGeog/status/1448436559456440320
* `rdeck` package: https://twitter.com/MilesMcBain/status/1448076055651053569
* on labeling area plots: https://bjnnowak.netlify.app/2021/08/10/r-labelling-area-plots/
* thread on `ggdist`, `see`, etc. packages: https://twitter.com/mjskay/status/1419792270258225153
* Alberto Cairo presentation slides: https://www.dropbox.com/s/pwiqaux9dkcgdga/NICAR2020_SHORT.pdf?dl=0
* https://www.download.thelancet.com/gbd
* https://www.adfontesmedia.com/interactive-media-bias-chart/
* https://www.reddit.com/r/dataisbeautiful
* https://twitter.com/EmmaVitz/status/1432553056558673926
* https://github.com/juba/obsplot/ (another option for dynamical plots: R interface to [Observable](https://observablehq.com/@observablehq/plot) JavaScript library
* https://emilhvitfeldt.github.io/r-color-palettes/discrete.html
* https://journal.r-project.org/dev/articles/RJ-2021-050/
* vis/inference: @cook_foundation_2021, @hullman_design_2021
* [twitter thread on accessibility](https://twitter.com/FrankElavsky/status/1396898372183855105)
* blog post about data viz dogma (e.g. anti-pie-charts): https://buttondown.email/willchase/archive/dogma/
* https://www.cedricscherer.com/slides/useR2021.pdf
* `ggpattern` package
* history: WEB Dubois (Mansky, Jackie. “W.E.B. Du Bois’ Visionary Infographics Come Together for the First Time in Full Color.” Smithsonian Magazine, November 15, 2018. https://www.smithsonianmag.com/history/first-time-together-and-color-book-displays-web-du-bois-visionary-infographics-180970826/.)
* letter value boxplots: https://cran.r-project.org/web/packages/lvplot/lvplot.pdf
* `hues` package (R implementation of IWantHue) now exists on CRAN
* https://micahallen.org/2018/03/15/introducing-raincloud-plots/
* Some fun slides here (not sure where they should be included: under GG intro? Just "extras"? : https://www.williamrchase.com/slides/assets/player/KeynoteDHTMLPlayer.html#0
* https://github.com/zumbov2/votemapswitzerland
* https://eos.org/features/visualizing-science-how-color-determines-what-we-see
* Padilla, Lace M. K., Maia Powell, Matthew Kay, and Jessica Hullman. “Uncertain About Uncertainty: How Qualitative Expressions of Forecaster Confidence Impact Decision-Making With Uncertainty Visualizations.” Frontiers in Psychology 11 (2021). https://doi.org/10.3389/fpsyg.2020.579267.
* Comments on compositionality from [here](https://teams.microsoft.com/l/message/19:369591fac9f94ed3a283cbd329633c0a@thread.tacv2/1613089702007?tenantId=44376307-b429-42ad-8c25-28cd496f4772&groupId=f81633df-ce5f-48f1-81b3-bedfdab309ab&parentMessageId=1613089702007&teamName=BIOLOGY%20708%20C01%20WIN%202021%20Quantitative%20Methods%20in%20Ecology%20and%20Evolution&channelName=Software%20and%20programming%20help&createdTime=1613089702007):

> here are my thoughts about plotting veg composition by period: plotting compositional data is fundamentally difficult. There is a tension between

> - making it easy to read off quantitative information (i.e. using Cleveland hierarchy, which says it is easiest to judge magnitudes when we are comparing the position of points along a linear scale, e.g. along the x- or y-axis of a plot)
>  - expressing the 'compositionality' of the data set, i.e. that the sum of the types is always 1 (which would suggest something like stacked bar charts or treemaps - although treemaps are arguably even worse because they represent magnitudes by area rather than by (linear) areas). (Ternary diagrams are a particularly nice approach but they only work when there are exactly three categories.)
>  - This gets even harder when there are a large number of categories (microbiome, allele frequencies, etc.) - luckily this is not at play here.

> My solution here does some more processing to get confidence intervals for the proportions of each type (which I always like to include if possible), based on binomial/multinomial sampling.


