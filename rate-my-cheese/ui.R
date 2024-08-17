#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

rating = list(0L,1L,2L,3L,4L,5L)
names(rating) = c("I regret eating it",
                  "I hate it",
                  "I don't like it",
                  "I can eat it",
                  "I like it",
                  "I love it")

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
      #sliderInput("cheese_rating", "Cheese rating", 
      #            min = 0, max = 5, value = 3),
      selectInput("cheese_rating", "Cheese rating",
                  rating,
                  selected = 3L),
      #numericInput("piece_rating", "Piece rating", ""),
      selectInput("piece_rating", "Piece rating",
                  rating,
                  selected = 3L),
      actionButton("submit", div("Submit", icon("cheese")))
    ),
    
    mainPanel(
      tableOutput("ratings_table")
    )
  )
)
