# ui.R
library(shiny)

shinyUI(fluidPage(
  titlePanel("Exploratory Analysis of Ebola Data"),
  
  sidebarLayout(
    sidebarPanel("Click through option below to explore data",
                 
       radioButtons("plotselection",
          label = h3("Select a Plot"),
          choices = c("All Countries Time Series of Cases" = "plot1",
                      "All Countries Time Series of Deaths" = "plot2",
                      "Total Cases vs Deaths by Country" = "plot3",
                      "Histogram of Cases Each Day" = "plot4",
                      "Histogram of Deaths Each Day" = "plot5"),
          selected = "plot1")
    ),
    
    mainPanel(
      p("Data Provided by Caitlin Rivers on GitHub"),
      plotOutput("plot")
    )
  )
))