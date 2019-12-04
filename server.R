# Load packages
library(shiny)
library(dplyr)

# Source file with dataframe
source("data/terror_data.R")
# Source analysis files that create info viz
source("./analysis/attacks_by_country.R")
source("./analysis/country_impact_comparison.R")
source("./analysis/attacks_by_size.R")
source("./analysis/terror_table.R")

# Server
server <- function(input, output) {
  # Casualties Map
<<<<<<< HEAD
  output$attack_map <- renderLeaflet(point_map(terrorism_select, input$attack_type))
=======
  output$attack_map <- renderLeaflet(point_map(terrorism_select, 
                                               input$attack_type))
>>>>>>> 7bf1144ef9497bcd00f3c22d43a125be0ebc1747
  # Country Comparison Bar Graphs
  output$comparison_one <- renderPlot(affected_chart(terrorism, input$country_one))
  output$comparison_two <- renderPlot(affected_chart(terrorism, input$country_two))
  # Summary Table
  output$tbl <- renderDataTable(region_summary(input$region))
}
