library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Global Terrorism"),
  tabsetPanel(
    tabPanel("Background & Research Question", fluid = TRUE),
    
    tabPanel("Data Visualizations",
             fluid = TRUE,
             navlistPanel(
               tabPanel("Data Viz 1"),
               tabPanel("Data Viz 2")
             )
    ),
    
    tabPanel("Conclusions", fluid = TRUE),
    
    tabPanel("About the Tech", fluid = TRUE),
    
    tabPanel("About Us", fluid = TRUE)
  )
)