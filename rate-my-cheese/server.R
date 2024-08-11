#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define the path to the CSV file where ratings will be stored
ratings_file <- "cheese_ratings.csv"

# Function to read the ratings from the CSV file
load_ratings <- function() {
  if (file.exists(ratings_file)) {
    read.csv(ratings_file, stringsAsFactors = FALSE)
  } else {
    data.frame(Date = as.Date(),
               Rater = factor(),
               Cheese = character(),
               Producer = character(),
               Provider = character(),
               Cheese_rating = numeric(), 
               Piece_rating = numeric(), 
               stringsAsFactors = FALSE)
  }
}

# Function to save the ratings to the CSV file
save_ratings <- function(ratings) {
  write.csv(ratings, ratings_file, row.names = FALSE)
}

server <- function(input, output, session) {
  
  # Load existing ratings from the CSV file
  ratings <- reactiveVal(load_ratings())
  
  observeEvent(input$submit, {
    # get the current ratings data
    current_ratings <- ratings()
    
    # Add a new row with input of new info
    new_row <- data.frame(
      Date = input$date,
      Rater = input$rater,
      Cheese = input$cheese_name,
      Producer = input$producer,
      Provider = input$provider,
      Cheese_rating = input$cheese_rating,
      Piece_rating = input$piece_rating,
      stringsAsFactors = FALSE
    )
    
    # update ratings
    updated_ratings <- rbind(current_ratings, new_row)
    
    # save updated ratings to csv file
    save_ratings(updated_ratings)
    
    # Update the reactive value
    ratings(updated_ratings)
    
  # Print message
  showNotification(paste("Enjoy your", input$cheese_name, "!"), 
                   type = "message")
  })
  
  # # Render the table with the ratings
  # output$ratings_table <- renderTable({
  #   ratings()
  # })
}
