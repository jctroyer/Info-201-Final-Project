# Load packages
library(shiny)
source("./data/terror_data.R")

# Define UI
ui <- fluidPage(

  # Name of final project
  titlePanel("Global Terrorism: Effects on Individuals and Societies"),
  tabsetPanel(

    # Project overview tab
    tabPanel("About The Project",
      fluid = TRUE,
      h4("Background"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),

      h4("Research Question"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),

      h4("Conclusion"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),

      h4("About the Tech"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
        non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ),

    tabPanel("Casualties Map", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h4("Casualties By Attack Type"),
        p("Choose an attack type to see how much a country has been affected by that
          specific type of attack.  Click on the map to view the specific casualty
          statistics."),
        selectizeInput("attack_type", "Attack Type", attack_target,
          multiple = FALSE,
          options = list(
            maxOptions = 9, placeholder = "Select",
            onInitialize = I('function() { this.setValue("Armed Assault"); }')
          )
        )
      ),

      mainPanel(
        leafletOutput("attack_map", height = 500, width = 800)
      )
    )),

    tabPanel("Data Vizualization 2", fluid = TRUE),

    tabPanel("About Us", fluid = TRUE)
  )
)
