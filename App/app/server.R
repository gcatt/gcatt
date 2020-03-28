#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(grDevices)
library(dplyr)
library(ggplot2)


mobility <- readRDS('Mobility/mobility.rds', refhook = NULL)
dist_100km <- readRDS('Mobility/distance_100km.rds', refhook = NULL)

str(dist_100km)
source('Mobility_Data.R', local = TRUE)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$ggplot_employment_student_male_female <- renderPlot({
    if (input$ggplot_employment_student_male_female_input == 'employed') {
      plot_employed} else {
        if (input$ggplot_employment_student_male_female_input == 'students') {
          plot_students} else {
            if (input$ggplot_employment_student_male_female_input == 'male') {
                plot_male} else {
                  if (input$ggplot_employment_student_male_female_input == 'female') {
                  plot_female} else {
                    if (input$ggplot_employment_student_male_female_input == 'age comparison') {
                      plot_age } else {
                        plot_gender}
                      }
                  }
                }
              }
           }
        
       
      
    
    )
   
   
  output$news_articles <- renderDataTable({
    
    if (input$Choose_newsfeed == 'Kinda positive Newsfeed') {
      py_run_file('main_crawler.py')
      google_news <- read.table('Google_Output/google.csv' , sep = '|', header = TRUE)
      google_news$Titel <- paste(google_news$Titel, "<a href='",google_news$Link,"' target='_blank'>Read more..</a>", sep = '\n')
      google_news['Titel']} else {
  
      #if (input$Choose_newsfeed == 'Really Hardcore Facts') {
        py_run_file("NZZ_Crawler.py")
        nzz_news <- read.table('NZZ_Output/NZZ_headlines_Corona.csv', sep = ';', header = TRUE)
        nzz_news$Titel <- paste(nzz_news$Titel, ' | ', "<a href='",nzz_news$Link,"' target='_blank'>Read more..</a>", sep = '\n')
        nzz_news['Titel']}
    
      },
    
        options = list(lengthMenu = c(3, 10), pageLength = 5),
        escape = FALSE)
  })
