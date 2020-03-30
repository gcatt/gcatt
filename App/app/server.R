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
library(shinydashboard)
library(gridExtra)



mobility <- readRDS('Mobility/mobility.rds', refhook = NULL)
dist_100km <- readRDS('Mobility/distance_100km.rds', refhook = NULL)

str(dist_100km)
source('Mobility_Data.R', local = TRUE)
source('AQI.R', local = TRUE)
source('RecoveredVerlauf.R', local = TRUE)
source('Flugzeug.R', local = TRUE)
source('Lifestyle.R', local = TRUE)
source('Stocks.R', local = TRUE)
source('R_Ready/Plot_NABEL.R', local = TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
 
  
  output$plot_airplane <- renderPlot({Flightplot})
  
  output$plot_lifestyle <- renderPlot({Lifestyleplot})
  
  output$plot_recovered <- renderPlot({RecoveredGraph})
  
  ###### Airquality all Years
  output$plot_all_years<- renderPlot({
    if (input$plot_all_years_options == 'Bejing') {
      plot_bejing_all_years} else if (input$plot_all_years_options == 'Wuhan') {
        plot_wuhan_all_years} else if (input$plot_all_years_options == 'Berlin') {
          plot_berlin_all_years} else {
            plot_milano_all_years}})
  
  ###### Airquality since 2019
  output$plot_since2019<- renderPlot({
    if (input$plot_since2019 == 'Bejing') {
      plot_bejing_2019} else if (input$plot_since2019 == 'Wuhan') {
        plot_wuhan_2019} else if (input$plot_since2019 == 'Berlin') {
          plot_berlin_2019} else {
            plot_milano_2019}})
  
  ###### Airquality Jan-Mar
  output$plot_jan_mar<- renderPlot({
    if (input$plot_jan_mar_options == 'Bejing') {
      plot_jan_mar_bejing} else if (input$plot_jan_mar_options == 'Wuhan') {
        plot_jan_mar_wuhan} else if (input$plot_jan_mar_options == 'Berlin') {
          plot_jan_mar_berlin} else {
            plot_jan_mar_milano}})
  
  ##### Transport Data
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
                        plot_gender}}}}}})
   
  ###### News Feed
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
        nzz_news['Titel']}},
        options = list(lengthMenu = c(3, 10), pageLength = 5),
        escape = FALSE)
  
  output$plot_stocks <- renderPlot({
    if (input$Input_stocks == 'Slack'){
      plot_slack} else {
        plot_zoom}})
  
  output$plot_airquality_swiss <- renderPlot({
    
    if (input$airquality_swiss == 'Bern') {
      gridExtra::grid.arrange(
        BER_O3, 
        BER_NO2, 
        BER_PM10, 
        BER_PM2.5, 
        BER_NOX, 
        BER_TEMP,
        nrow = 4
      )} else if (input$airquality_swiss == 'Basel')  {
        gridExtra::grid.arrange(
          BAS_O3,
          BAS_NO2,
          BAS_PM10,
          BAS_SO2,
          BAS_PM2.5,
          BAS_NOX,
          BAS_TEMP,
          nrow = 4
        )} else if (input$airquality_swiss == 'Lugano') {
       gridExtra::grid.arrange(
         LUG_O3, 
         LUG_NO2, 
         UG_SO2, 
         LUG_CO, 
         LUG_PM10, 
         LUG_PM2.5, 
         LUG_NOX, 
         LUG_TEMP,
         nrow = 4)
        } else if (input$airquality_swiss == 'Lausanne') {
          gridExtra::grid.arrange(
            LAU_O3, 
            LAU_NO2, 
            LAU_CO, 
            LAU_PM10, 
            LAU_PM2.5, 
            LAU_NOX, 
            LAU_TEMP,
            nrow = 4
          )
          } else {
            gridExtra::grid.arrange(
              DAV_O3, 
              DAV_NO2, 
              DAV_PM10, 
              DAV_NOX, 
              DAV_TEMP,
              nrow = 4)
          }
        
      
    
    
    
  })
      
  


})