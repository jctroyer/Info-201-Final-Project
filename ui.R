library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Global Terrorism"),
  tabsetPanel(
    tabPanel("About The Project", fluid = TRUE),
    
    tabPanel("Data Visualization 1", fluid = TRUE),
    
    tabPanel("Data Vizualization 2", fluid = TRUE),
    
    tabPanel("About Us", fluid = TRUE)
  )
)