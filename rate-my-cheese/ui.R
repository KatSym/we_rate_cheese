#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  titlePanel("Cheese Rating App"),
  
  sidebarLayout(
    sidebarPanel(
      dateInput("date", "Date"),
      selectInput("rater", "Rater", 
                  choices = list(
                    "Angelos", 
                    "Katerina")),
      textInput("cheese_name", "Cheese Name", ""),
      textInput("producer", "Cheese Producer", ""),
      textInput("provider", "Cheese Provider", ""),
      sliderInput("cheese_rating", "Cheese rating", 
                  min = 0, max = 5, value = 3),
      numericInput("piece_rating", "Piece rating", ""),
      actionButton("submit", div("Submit", icon("cheese")))
    ),
    
    mainPanel(
      tableOutput("ratings_table")
    )
  )
)
