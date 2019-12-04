# Load packages
library(shiny)
library(shinythemes)

# Source file with dataframe used for project
source("./data/terror_data.R")

# Define UI
ui <- fluidPage(
  theme = shinytheme("superhero"),

  # Name of final project
  titlePanel("Global Terrorism: Effects on Individuals and Societies"),
  
  tabsetPanel(
    # Project overview tab
    tabPanel("Project Overview", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h3("BACKGROUND | What is Terrorism?"),
        p("Terrorism is the unlawful and systematic use of violence against a state,
        country, or group of people, motivated by various ideologies, as a form of
        political coercion. Global acts of terrorism have impacted hundreds, thousands,
        and millions of people throughout history in social, economic, and political ways."),
        p("Terrorism occurs on local, national, and international levels.
          Take - for instance - the white supremacist attack at the Unite the Rally
          attack in 2019, which occurred on US soil in Charlottesville, VA by Americans.
          This act of terrorism occurred on a more local level. Another example is the 
          infamous al-Qaeda attack on the USA on September 11, 2001, which was a national
          terrorist attack. On an international level, one can look back on World War II
          and the Holocaust, which mainly targeted Jewish populations in Western Europe."),
        p("Global terrorism is a threat to the health and well-being of both the 
          targets at which the attacks are aimed, and to the innocent people that
          sustain loss and damage as a perhaps unintended result of those attacks."),
        h3("OUR PROJECT | Why do we Care?"),
        p("Terrorism affects individuals, communities, and societies on multiple levels.
          Aside from the obvious physical and psychological impacts on direct victims
          of terrorism, terrorism causes deep-rooted fear and insecurity within affected
          populations. This problem is pertinent for any civilian or member of society as
          it is difficult to predict when or where the next attack will occur. Therefore,
          it is important to be aware of the ways in which one can be affected and to
          potentially prepare ways in which to respond. It is also important in order 
          to be an informed citizen and to be aware of global issues."),
        p("The sensitive subject of terrorist attacks will be addressed by 
          bringing attention to the number of terrorist attacks that have occurred,
          where they occurred, and who and what was affected. By gaining awareness 
          of these aspects of terrorism and finding correlations between various data
          about those attacks (date, location, cause, etc.), we can raise awareness 
          and educate the public about terrorism and about targeted regions that are 
          not widely publicized by the media."),
        p("We seek to shed light on global terrorist attacks, particularly on regions of
          the world that people would not otherwise consider. Another goal is to put
          the effects of terrorism into perspective with the number of individuals affected
          as a result of these attacks, whether it was intentional or unintentional. 
          Anyone could be a victim and anyone can be affected at any given time."),
        h3("THE DATA"),
        p("The dataset that will be used throughout this project is called 
          Global Terrorism Database from kaggle.com. It lists over 180,000
          terrorist attacks from 1970 to 2017. The GTD contains more than 100 variables,
          using information from media outlets/articles that are not classified.
          This project focuses on data from 2000-2017.")
      ),
      
      mainPanel(
        img(src = "https://www.gcsp.ch/sites/default/files/2019-04/Geneva%20Launch%20of%20Global%20Terrorism%20Index%20Report%202018_Web.jpg")
      )
    )
    ),

    tabPanel("Casualties Map", fluid = TRUE,sidebarLayout(
      sidebarPanel(
        h4("Casualties By Attack Type"),
        p("Select an attack type to see how many individuals were affected
          (by personal death or injury) as a result of that type of attack.
          Zoom in on the map to view countries and cities and click on a point
          of attack to view more detailed casualty statistics such as the number
          of people killed and wounded by that attack."),
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

    tabPanel("Country Comparison", fluid = TRUE,
      sidebarLayout(
        sidebarPanel(
          h4("Number of Individuals Affected by Attack Type by Country"),
          p("Select two countries via the drop down menu
            (or search and select a country by typing the country's name)
            to compare the number of individuals affected by the attack types
            used in the chosen countries. "),
          selectizeInput(inputId = "country_one", label = "Country 1",
                         choices = country, multiple = FALSE, 
                         options = list(placeholder = "Select Country or Type to Search")),
          selectizeInput(inputId = "country_two", label = "Country 2",
                         choices = country, multiple = FALSE, 
                         options = list(placeholder = "Select Country or Type to Search"))
        ),
        mainPanel(
          plotOutput("comparison_one"),
          plotOutput("comparison_two")
        )
      )
    ),

    tabPanel("Summary Table", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h4("Summary Table"),
        p("Select a region of the world (or search and select by typing the name of a region)
          to view a table that displays summary statistics about
          terrorist attacks in the chosen region. Search for certain stats using the search bar."),
        selectizeInput("region", "Region", region,
                       multiple = FALSE,
                       options = list(
                         placeholder = "Select"
                       )
        )
      ),
      
      mainPanel(
        dataTableOutput("tbl")
      )
    )
    ),

    tabPanel("Conclusion", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h3("CONCLUSION"),
        p("According to the insights gathered from the visualizations,
          it seems that a majority of terrorist attacks that occurred in 
          the 21st century were targeted at countries in Africa and the Middle East.
          That is not too shocking, given the political unrest and wars occurring
          in those regions of the world."),
        p("We learned that global terrorism is much too broad, complex,
        and large of an issue to make causal or predictive claims and analyses.
        However, through discussion about research questions, data visualizations,
        and future plans, we have learned to develop our critical thinking
        and coding skills. Another noteworthy lesson we learned was that it
        can be difficult to find datasets to fit our needs, and sometimes,
        we need to challenge ourselves to work with what we have available
        and to generate creative solutions.
")
      ),
      
      mainPanel(
        img(src = "https://communicationinprint.files.wordpress.com/2016/07/cartoon-2.jpg?w=1300&h=768&crop=1")
      )
    )
    )
  )
)
