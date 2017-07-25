---
title: 'Visualising Food Nutrients with Interactive R Dashboard'
layout: post
date: 2017-07-26
permalink: /blog/2017/07/26/Visualising-Food-Nutrients-with-R
tags:
  - Linear Regression
  - Predictive Analytics
  - 3D Graphs
  - R
---



```{r, echo = FALSE}



---
title: "Visualising Food Nutrients with Interactive R Dashboard"
output: 
  flexdashboard::flex_dashboard:
    orientation: row
    social: menu
    source_code: embed
    navbar:
      - { title: "Felipe Rego", href: "https://feliperego.github.io", align: left }
runtime: shiny
---

```{r global, include=FALSE}

# load library to fetch .xls file from URL
library(gdata)

# pass URL to an object
url = "http://www.foodstandards.gov.au/science/monitoringnutrients/ausnut/Documents/8b.%20AUSNUT%202011-13%20AHS%20Food%20Nutrient%20Database.xls"

# use read.xls function with URL address
# and assign to object fn which is a data frame
fn = read.xls(url, sheet="Food Nutrient Database",
              fileEncoding="latin1", header=TRUE)

# change food name as character
fn$Food.Name = as.character(fn$Food.Name)

# create a rowname id
fn$idnm = paste(fn$Food.Name, fn$Food.ID)

# assign it to rownames
rownames(fn) = fn$idnm

# a smaller dataset
fnshort = fn[,c(8, 9, 10, 13, 16, 36, 38)]

# rename columns
colnames(fnshort) = c('Protein', 
         'Fat', 
         'Carbs', 
         'Sugars', 
         'Fibre', 
         'Calcium',
         'Iron')

```


```{r}
# Reactive that returns the whole dataset if there is no brush
selectedData <- reactive({
  data <- brushedPoints(fnshort, input$plot1_brush)
  if (nrow(data) == 0)
    data <- fnshort
  data
})
```


Inputs {.sidebar}
-----------------------------------------------------------------------

#####**This vis**

#####This is an interactive dashboard made with a combination of [flexdashboard for R](http://rmarkdown.rstudio.com/flexdashboard/index.html) and [Shiny](https://shiny.rstudio.com/).

#####It contains information on a selected number of nutrients of 5,740 foods. For more details, visit the [Food Starndards website](http://www.foodstandards.gov.au/science/monitoringnutrients/ausnut/ausnutdatafiles/Pages/foodnutrient.aspx). Each nutrient value is presented on a per 100 g edible portion basis.

***

#####**Interactive**

```{r}
selectInput('xcol', 'Horizontal Axis', names(fnshort))
    
selectInput('ycol', 'Vertical Axis', names(fnshort),
                selected=names(fnshort)[[2]])
```

#####Once your scatterplot graph variables have been selected above, you can click and drag your mouse over the dots in the scatterplot graph to select specific foods and the table below will be updated with your selection.

***

#####See more from this author [here](https://feliperego.github.io/blog).

Row {data-height=550}
-----------------------------------------------------------------------

### Food Nutrients Two Dimensional Interactive Scatterplot (Drag mouse over dots) {data-width=100}

```{r}
library(ggplot2)
#library(GGally)
#library(parcoords)
#library(MASS)
plotOutput("plot1", brush = brushOpts(id = "plot1_brush"))
output$plot1 <- renderPlot({
  ggplot(fnshort, 
         aes_string(x=input$xcol, y=input$ycol)) + 
    geom_point() +
    theme_bw() +
    geom_smooth(method=lm)
})
```

Row {data-height=250}
-----------------------------------------------------------------------

### Food Nutrient Table Details  {data-width=100}

```{r}
renderTable({
  selectedData() 
}, spacing = "xs"
 , rownames = TRUE)
```


```




