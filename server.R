# server.R
library(RCurl)
library(ggplot2)
library(shiny)

url <- "https://raw.githubusercontent.com/kpipkins/DataProducts/master/Data/EbolaCountryTimeSeries.csv"

data <- getURL(url, ssl.verifypeer = FALSE)
df <- read.csv(textConnection(data))
df_cases <- df[df$Type=='Cases',]
df_deaths <- df[df$Type=='Deaths',]
df_wide <- aggregate(df$Value, by=list(Type=df$Type,Country=df$Country), FUN=sum)
total_cases <- sum(df$Value)

shinyServer(function(input, output) {
  
  plot <- reactive({
    if(input$plotselection=="plot1"){
      viz <- qplot(Day,Value,data=df_cases,colour=Country,geom='path')
    }
    else if(input$plotselection=="plot2"){
      viz <- qplot(Day,Value,data=df_deaths,colour=Country,geom='path')
    }
    else if(input$plotselection=="plot3"){
      viz <- qplot(Country,x,data=df_wide,colour=Type)
    }
    else if(input$plotselection=="plot4"){
      viz <- qplot(Value, data=df_cases, colour=Country,geom="histogram")
    }
    else if(input$plotselection=="plot5"){
      viz <- qplot(Value, data=df_deaths, colour=Country,geom="histogram")
    }
  })
  
  diff <- reactive({
    answer <- abs(input$guess-total_cases)
  })
  output$plot <- renderPlot({
    print(plot())
  })
  output$answer <- renderText({
    paste("You are ", print(diff()), "cases away from the right answer.")
  })
})