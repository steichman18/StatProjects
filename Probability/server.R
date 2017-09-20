library(shiny)
library(zipfR)

data(Brown.spc)
data(Dickens.spc)
# Cat data
catData.tfl <- read.tfl("13CatTales.txt")
catData.spc <- tfl2spc(catData.tfl)
# Horton data
hortondata.tfl <- read.tfl("HortonR.txt")
hortonR.spc <- tfl2spc(hortondata.tfl)
# Count of Monte Christo data
mcData.tfl <- read.tfl("CountMonteCristo1.txt")
mcData.spc <- tfl2spc(mcData.tfl)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$data,
           "Cat Books" = catData.spc,
           "Professor Horton's Website" = hortonR.spc,
           "Brown Corpus" = Brown.spc, 
           "Dickens Corpus" = Dickens.spc,
#            "Don Quixote" = dqData.spc,
           "The Count of Monte Cristo" = mcData.spc
           )
  })

  #Output the histogram
  output$freqPlot <- renderPlot({
    # If fit check box is checked
    if(input$fitCheck){
      fzm <- lnre("fzm", datasetInput())
      fzm.spc <- lnre.spc(fzm,N(datasetInput()))
      # If log box is checked
      if(input$logCheck){
        plot(log(datasetInput()$m), log(datasetInput()$Vm), 
             xlim = c(1, log(input$bins)), 
             xlab = "log(m)", ylab = "log(Vm)")
        lines(log(fzm.spc$m), log(fzm.spc$Vm), col = "red")
      }
      else{
        plot(datasetInput()$m, datasetInput()$Vm, 
             xlim = c(1, input$bins), 
             xlab = "m", ylab = "Vm")
        lines(fzm.spc$m, fzm.spc$Vm, col = "red")
      }
    }
    # If fit check box is unchecked
    else{
      # If log box is checked
      if(input$logCheck){
        plot(log(datasetInput()$m), log(datasetInput()$Vm), 
             xlim = c(1, log(input$bins)), 
             xlab = "log(m)", ylab = "log(Vm)")
      }
      else{
        plot(datasetInput()$m, datasetInput()$Vm, 
             xlim = c(1, input$bins), xlab = "m", ylab = "Vm")
      }
    }
  })

})
