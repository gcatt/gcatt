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



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plotoutput <- renderPlot({ggplot(aes(input$plotinput1, input$plotinput2)) + geom_point()})

  output$news_articles <- renderDataTable({
  
      if (input$Choose_newsfeed == 'Neue Zürcher Zeitung') {
        py_run_file("NZZ_Crawler.py")
        nzz_news <- read.table('NZZ_Output/NZZ_headlines_Corona.csv', sep = ';', header = TRUE)
        nzz_news$Titel <- paste(nzz_news$Titel, ' | ', "<a href='",nzz_news$Link,"' target='_blank'>Read more..</a>", sep = '\n')
        nzz_news['Titel']} else {
    
      if (input$Choose_newsfeed == 'Google') {
        py_run_file('main_crawler.py')
        google_news <- read.table('Google_Output/google.csv' , sep = ';', header = TRUE)
        google_news$Titel <- paste(google_news$Titel, "<a href='",google_news$Link,"' target='_blank'>Read more..</a>", sep = '\n')
        google_news['Titel']}}},
    
        options = list(lengthMenu = c(3, 10), pageLength = 5),
        escape = FALSE)
    
})
