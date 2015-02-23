library(shiny)
shinyUI(fluidPage(
titlePanel("Final Data Product Presentation"),
  sidebarLayout(
    sidebarPanel(
      textInput("text", label = h3("Text input"), value = "The goal of this exercise is to create"),
      radioButtons("n", label = h3("n - gram"),
                   choices = list("1" = 1, "2" = 2, "3" = 3), 
                   selected = 3),
      helpText("Please enter sentence in text input, then the predition outcome will show up. Notice that the 
               single word can not apply to 2 - gram and 3 - gram, the ouput will show nothing, so make 
               sure the length of sentence is enough.")
      
    ),
    mainPanel(
            tableOutput("table")
    )
  )
))
