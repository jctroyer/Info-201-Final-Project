library(shiny)
library(dplyr)

source("./analysis/attacks_by_country.R")
source("data/terror_data.R")

server <- function(input, output) {
  output$attack_map <- renderLeaflet(target_map(terrrorism,
                                                world, input$attack_type))
}
