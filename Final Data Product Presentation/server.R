library(shiny)

shinyServer(function(input, output) {

  output$table <- renderTable({

 
          data=pred(input$text,input$n)
          row.names(data)<-1:dim(data)[1]
          data

  })

})
