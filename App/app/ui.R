#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(ggplot2)
library(reticulate)







# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    img(src='visuals-0RPf107BLek-unsplash.png', width = '100%'),
    h1('COVID-19: Some other News', align = 'center'),
    h3('Plots'),
    h2('News Feed'),
    dataTableOutput('news_articles')
      
      
      
      
      
      
  
))
