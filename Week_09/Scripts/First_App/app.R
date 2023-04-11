# Week 9b Lecture Shiny app
# Mac Hein
# 2023-04-06

library(shiny)
library(tidyverse)

ui <- fluidPage(
  
  # Input functions
  
  sliderInput(inputId = "num", # ID name for the input
              label = "Choose a number", # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
              ),
  
  textInput(inputId = "title", # new Id is title
            label = "Write a title",
            value = "Histogram of Random Normal Values"), # starting title
  
  # Output functions
  
  plotOutput("hist"), #creates space for a plot called hist
  verbatimTextOutput("stats") # create a space for stats
  
                )

server <- function(input,output){
  
  data <- reactive({
    tibble(x = rnorm(input$num)) # 100 random normal points
  })
  
  output$hist <- renderPlot({
    
    # R code to make the hist output goes here
    
    # {} allows us to put all our R code in one nice chunk
    
    ggplot(data, aes(x = x)) + # make a histogram
      geom_histogram() +
      labs(title = input$title) #Add a new title
  
    })
  
  output$stats <- renderPrint({
    summary(data()) # calculate summary stats based on the numbers
    })
  
}

shinyApp(ui = ui, server = server)
