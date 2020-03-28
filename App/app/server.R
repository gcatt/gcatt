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
    py_run_file("../../NZZ_Crawler/NZZ_Crawler.py")
    nzz_news <- read.table('NZZ_Output/NZZ_headlines_Corona.csv', sep = ';', header = TRUE)
    nzz_news$Titel <- paste(nzz_news$Titel, ' | ', "<a href='",nzz_news$Link,"' target='_blank'>Read more..</a>", sep = '\n')
    
    nzz_news['Titel']},options = list(lengthMenu = c(5, 30, 50), pageLength = 5),
    escape = FALSE)
    
})
