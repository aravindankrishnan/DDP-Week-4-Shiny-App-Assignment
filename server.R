# Server
server <- function(input,output){
  # Create a subset of data filtering for transmission type
  mtcars$am <- as.factor(mtcars$am)
  mtcars$cyl <- as.factor(mtcars$cyl)
  output$mtcars_data <- renderDataTable({head(mtcars)})
  pretty_plot_title <- reactive({input$plot_title})
  
  # Create scatterplot for selected data
  output$scatterplot <- renderPlot({
    ggplot(data = mtcars,aes_string(x=input$X,y=input$Y,color = input$Z))+
      geom_point()+
      labs(title=pretty_plot_title())
  })
  # Create descritive text
  output$description <- renderText({
    paste0("The Plot above titled ",pretty_plot_title()," visualises the relationship between ",
           input$X, " and ",input$Y)
  })
}

# Create the Shiny App object
#shinyApp(ui=ui, server=server)