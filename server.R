# Load packages
library(shiny)
library(dplyr)

# Source file with dataframe
source("data/terror_data.R")
# Source analysis files that create info viz
source("./analysis/attacks_by_country.R")
source("./analysis/country_impact_comparison.R")
source("./analysis/attacks_by_size.R")

server <- function(input, output) {
  # Casualties Map
  output$attack_map <- renderLeaflet(point_map(terrorism_select, 
                                                input$attack_type))
  # Country Comparison Bar Graphs
  output$comparison_one <- renderPlot(affected_chart(terrorism, input$country_one))
  output$comparison_two <- renderPlot(affected_chart(terrorism, input$country_two))
  # Summary Table
}
