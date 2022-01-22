library(shiny)
library(data.table)

# Define server logic required to make a prediction
shinyServer(function(input, output) {
  # Load the prediction function
  
  mydir = paste0(getwd(), '/Modeling/Pred/')
  
  paste0(mydir, 'predictionTableFull.csv')
  
  suppressMessages(library(data.table))
  nGramAll <- fread(paste0(mydir, 'predictionTableFull.csv'))
  source('PredNextWords.R')
  
  source('PredNextWordsApp.R')
  
  # Load the prediction table
  nGramAll <- fread(paste0(mydir, 'predictionTableFull.csv'))
  
  # Predict next word
  observe({ #need this for reactive mode!!!
    query <- as.character(input$query)
    n <- input$wordN
    result <- PredNextWords(query, n, nGramAll)
    
    if (query == '') {
      output$predicted <- renderPrint(cat(''))
    } else {
      output$predicted <- renderPrint(cat(result, sep = '\n'))
    }
    
  })
})