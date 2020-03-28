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
    h2('Swiss Transport Data'),
    splitLayout(
    plotOutput('ggplot_age'),
    plotOutput('ggplot_gender')
    ),
    sidebarLayout(
      sidebarPanel(
        radioButtons('ggplot_employment_student_male_female_input', 'Choose your graph: ', c('employed', 'students', 'male', 'female', 'age comparison', 'gender comparison'))),
      mainPanel(
        plotOutput('ggplot_employment_student_male_female'))),
   
    h2('News Feed'),
    sidebarLayout( 
      sidebarPanel(
        radioButtons('Choose_newsfeed', label = 'Choose your Newsfeed: ', choices = c('Kinda positive Newsfeed', 'Hardcore Facts'))
      ),
      mainPanel(
        dataTableOutput('news_articles')
        
      ) )
    
    
      
      
      
      
      
      
  
))
