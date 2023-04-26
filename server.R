library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(shinydashboard)
library(plotly)
library(DT)

function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- UkSponsors_Assignment1
    if (input$town != "All") {
      data <- data[data$town == input$town,]
    }
    if (input$ind != "All") {
      data <- data[data$industry == input$ind,]
    }
    data
  },
  extensions = c("Scroller", "FixedColumns", "Buttons", "Select"), 
  selection = "none",
  options = list(
    dom = "lftiprB", 
    buttons = c(
      # enregistrements
      'copy', 'csv', 'excel', 'pdf',
      # visualisation des colonnes
      'colvis'
    ), pageLength = 15),
  )
  )
}

