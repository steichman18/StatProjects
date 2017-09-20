library(shiny)

shinyUI(fluidPage(

  tags$h1("Fun with Zipf's Law",
          style = "height:35px"),
  tags$h4(em("Jonathan Che, Tim Lee, Sarah Teichman"), 
          style = "height:10px;color:gray"),
  tags$hr(), # Adds a faint line
 
  sidebarLayout(
    sidebarPanel(
      # Drop-down Input for dataset displayed
      selectInput("data", 
                  label = "Choose a dataset to examine",
                  choices = c("Professor Horton's Website",
                              "Cat Books",
                              "Dickens Corpus",
                              "Brown Corpus", 
                              "The Count of Monte Cristo"),
                  selected = "Professor Horton's Website"),
      # Slider Input for number of m-vals displayed
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 100,
                  value = 15),
      # Checkbox for whether Z-M Distribution is displayed
      checkboxInput("fitCheck", 
                    label = "Add Zipf-Mandelbrot Distribution", 
                    value = FALSE),
      # Checkbox for whether log scale is used
      checkboxInput("logCheck", 
                    label = "Log Scale", 
                    value = FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("freqPlot")
    )
  )
))
