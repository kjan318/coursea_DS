library(shiny)
library(shinythemes)
#nGramAll <- fread('predictionTableFull.csv')

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("darkly"),
  
  # Application title
  titlePanel("Next Word Prediction App"),
  
  # Sidebar with a slider input for number of predicted words to return 
  sidebarLayout(
    sidebarPanel(
      code('Function Intro.'),
      p('This Shiny app is created for the Coursera Data Science Capstone Project.'),
      p('This app is able to predict next 1~5 English words based on typed word.'),
      p("The algorithm is based on Katz's back-off model using 2 to 7-grams."),
      code('How to use it?'),
      tags$ul(
        tags$li('Select how many number of next words to predict.'),
        tags$li('Typing English Words in textbox')
      ),
      code('Output'),
      p('The predicted next word text will keep changing to show up by sequence of most used to less frequently used')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      h4('Number of predictions:'),
      selectInput(inputId = "wordN",
                  label = "Choose a number (1~5)",
                  choices = c("1", "2", "3","4","5")),
      
      h4('Type English Words in here:'),
      
      tags$textarea(id = 'query', rows = 5, cols = 35),
      HTML("<br>"), hr(), HTML("<br>"), 
      h4('Next Predicted Word'),
      #tableOutput('predicted')
      verbatimTextOutput('predicted')
      
    )
  )
))