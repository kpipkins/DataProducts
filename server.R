# server.R
library(RCurl)
library(ggplot2)
library(shiny)
library(plyr)
library(reshape2)

url <- "https://raw.githubusercontent.com/cmrivers/ebola/master/data_products/graphs/html/graph_data.csv"

data <- getURL(url, ssl.verifypeer = FALSE)
df <- read.csv(textConnection(data))
df_cases <- df[df$Type=='Cases',]
df_deaths <- df[df$Type=='Deaths',]
df_value <- df[,c(1:5)]
df_wide <- dcast(df_value, Country + Type ~ ., sum)

#totals <- 
shinyServer(function(input, output) {
  
  plot <- reactive({
    if(input$plotselection=="plot1"){
      viz <- qplot(Day,Value,data=df_cases,colour=Country,geom='path')
    }
    else if(input$plotselection=="plot2"){
      viz <- qplot(Day,Value,data=df_deaths,colour=Country,geom='path')
    }
    else if(input$plotselection=="plot3"){
      viz <- qplot(Country,.,data=df_wide,colour=Type)
    }
    else if(input$plotselection=="plot4"){
      viz <- qplot(Value, data=df_cases, colour=Country,geom="histogram")
    }
    else if(input$plotselection=="plot5"){
      viz <- qplot(Value, data=df_deaths, colour=Country,geom="histogram")
    }
  })
  
  output$plot <- renderPlot({
    print(plot())
  })
})