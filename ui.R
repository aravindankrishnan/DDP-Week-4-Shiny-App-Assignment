# DDP Week 4 Assignment

library(shiny)
library(ggplot2)
library(dplyr)
library(tools)
library(DT)
data("mtcars")
# Define UI for application that plots different variables of mtcars dataset

ui <- fluidPage(
  titlePanel("Exploratory Plots for mtcars dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Y",
                  label = "Y-Axis",
                  choices = c("Mileage"="mpg","Horsepower"="hp","Weight"="wt"),
                  selected = "mpg"),
      selectInput(inputId = "X",
                  label = "X-Axis",
                  choices = c("Mileage"="mpg","Horsepower"="hp","Weight"="wt"),
                  selected = "wt"),
      selectInput(inputId = "Z",
                  label = "Color by",
                  choices = c("Cylinder"="cyl","Transmision Type"="am","Displacement"="disp"),
                  selected = "am"),
      # Enter Text for Plot Title
      textInput(inputId = "plot_title",
                label = " Plot Title",
                placeholder = "Enter text for Plot Title")
      # Select Auto or Manual Gear Transmission for plot analysis
      #checkboxGroupInput(inputId = "transmision_type",
                         #label = "Select Type of Transmission",
                         #choices = c(0,1),
                         #selected = 0)
    ),
    # Output
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Instructions",
                           h3("How to use this App"),
                           br(),
                           h4("Introduction"),
                           p("This Shiny App is used to review the relationship between
                             a set of variables that are part of the mtcars dataset. 
                             A scatter plot is created between a given pair of variables 
                             in the mtcars data set. The points are further color coded 
                             based on a third variable."),
                           hr(),
                           h4("Selection Screen"),
                           #br(),
                           h5("Y-Axis:"),
                           p("Select from the drop down the variable you want to use as 
                             Y-Axis in the Scatter Plot"),
                           #br(),
                           h5("X-Axis:"),
                           p("Select from the drop down the variable you want to use as 
                             X-Axis in the Scatter Plot"),
                           #br()
                           h5("Color by:"),
                           p("Select from the drop down the variable you want to use to color
                             code the scatter plot"),
                            
                           h5("Plot Title:"),
                           p("Enter the Title you want to keep for this Plot"),
                           hr(),
                           h4("To view the mtcars data"),
                           p("Go to 'Data' Tab to get a sneak peek of the mtcars data"),
                           hr(),
                           h4(" To view the Plot"),
                           p("Go to the 'Plot' tab to view the scatter plot generated based on the 
                              above selection parameters.")
                  ),
                  tabPanel("Data",
                           h4("The mtcars dataset"),
                           p("The data was extracted from the 1974 Motor Trend US magazine, 
                              and comprises fuel consumption and 10 aspects of 
                              automobile design and performance for 
                              32 automobiles (1973 to 1974 models)."),
                              br(),                              
                              p("Below is shown the first 6 rows of mtcars dataset. 
                             The variables are the various columns of the table.
                             The selection screen fields show a drop down of a select list 
                             of variables from which we choose the axes and the color coding variable."),
                           DT::dataTableOutput(outputId = "mtcars_data")),
                  tabPanel("Plot",
                          plotOutput(outputId = "scatterplot"),
                          textOutput(outputId = "description"))
      )
    )
  )
)
