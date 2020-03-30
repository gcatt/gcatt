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
library(plotly)







# Define UI for application that draws a histogram
shinyUI(fluidPage(
  tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
  tags$style(HTML('.box{-webkit-box-shadow: none; -moz-box-shadow: none;box-shadow: none;}'))),
  
  #img(src='visuals-0RPf107BLek-unsplash.png', width = '100%'),


           
           # child: images
           
  
  tabsetPanel(
                  
                  tabPanel('Home', 
                           h1('COVID-19:',tags$br('Some other News'), align = 'center', escape = FALSE),
                           
                          img(src='virus.svg', width = '15%', class = 'home_image', align = 'center')),
                                    
                                  
                                   
                           
                   tabPanel("People",
                            h1('COVID-19:',tags$br('Effects on People'), align = 'center', escape = FALSE),
                            div(
                            h2('Lifestyle Changes', class = 'header_title_lifestyle'),
                            plotOutput('plot_lifestyle'), class = 'lifesytle_plot'),  
                            
                            h2('Travelling Behaviour Swiss People'),
                            sidebarLayout(
                              sidebarPanel(
                                radioButtons('ggplot_employment_student_male_female_input', NULL, c('employed', 'students', 'male', 'female', 'age comparison', 'gender comparison'), inline = TRUE)),
                              mainPanel(
                                plotOutput('ggplot_employment_student_male_female'))),
                            
                              h2('Recoverd People'),
                              plotOutput('plot_recovered'), class = 'lifestyle_page'),
                                       
                  tabPanel('Economy', 
                           h1('COVID-19:',tags$br('Effects on Economy'), align = 'center', escape = FALSE),
                           h2('Stockprices Slack & Zoom'),
                           sidebarLayout(
                             sidebarPanel(
                               radioButtons('Input_stocks', NULL, c('Slack', 'Zoom'), inline = TRUE)),
                             mainPanel(
                               plotOutput('plot_stocks'))),
                           
            
                           h2('Flights'),
                           plotOutput('plot_airplane')),
                          
                       
                  tabPanel('Environment',
                                       
                           h1('COVID-19:',tags$br('Effects on Environment'), align = 'center', escape = FALSE),
                            h2('Airquality'),
                            sidebarLayout(
                              sidebarPanel(
                                h3('Airquality Index all Years'),
                                radioButtons('plot_all_years_options', NULL, c('Bejing', 'Wuhan', 'Milano', 'Berlin'), inline = TRUE)),
                              mainPanel(
                                plotOutput('plot_all_years'))),
                            
                            sidebarLayout(
                              sidebarPanel(
                                h3('Airqualtiy Index since 2019'),
                                radioButtons('plot_since2019', NULL, c('Bejing', 'Wuhan', 'Milano', 'Berlin'), inline = TRUE)),
                              mainPanel(
                                plotOutput('plot_since2019'))),
                            
                            sidebarLayout(
                              sidebarPanel(
                                h3('Airqualtiy Index Jan - Mar 2019'),
                                radioButtons('plot_jan_mar_options', NULL, c('Bejing', 'Wuhan', 'Milano', 'Berlin'), inline = TRUE)),
                              mainPanel(
                                plotOutput('plot_jan_mar'))),
                  
                            sidebarLayout(
                              sidebarPanel(
                                h3('Airqualtiy Switzerland'),
                                selectInput('airquality_swiss', NULL, c('Bern', 'Basel', 'Lugano', 'Lausanne', 'Davos'))),
                              mainPanel(
                                plotOutput('plot_airquality_swiss', height = 1000)))),
                            
                            
                   tabPanel("News", 
                            h1('COVID-19:',tags$br('News'), align = 'center', escape = FALSE),
                            h2('News Feed'),
                            sidebarLayout( 
                              sidebarPanel(
                                radioButtons('Choose_newsfeed', label = NULL, c('Kinda positive Newsfeed', 'Hardcore Facts'))),
                              mainPanel(
                                dataTableOutput('news_articles'))))
                  
                 
  
)))
