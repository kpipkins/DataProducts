---
title       : Exploratory Analysis of Ebola Data
subtitle    : Developing Data Products Class Project
author      : Kyle Pipkins
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## Acquiring the Data

Data for this exercise was pulled from https://github.com/cmrivers/ebola. 

Data has been processed and normalized by various contributors.

The scope of my exercise is to simply take normalized data and allow users to explore it by pre-populating various graphs.

---
## Producing Graphs

All graphs were produced with package ggplot2 using the function qplot

Minimal data reshaping was required for the exercise

---
## Example of Code

To perform the calculation I allow the user to enter a value and then calculate the absolute difference, ex:

```r
guess <- 80
answer <- 100
diff <- abs(guess-answer)
diff
```

```
## [1] 20
```

---
## End Product

5 Graphs were produced

1. All Countries Time Series of Cases
2. All Countries Time Series of Deaths
3. Total Cases vs Deaths by Country
4. Histogram of Cases Each Day
5. Histogram of Deaths Each Day

---
## Link to Find the App

My shiny app is hoted here: https://kpipkins.shinyapps.io/DevDataProd/


