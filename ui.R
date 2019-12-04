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
          political coercion. Global acts of terrorism have impacted hundreds,
          thousands, and millions of people throughout history in social, economic,
          and political regards and on local, national, and international levels."),
        p("Global terrorism is a threat to the health and well-being of both the 
          targets at which the attacks are aimed, and to the innocent people that 
          sustain loss and damage as a perhaps unintended result of those attacks. 
          It is important to consider the effects of terrorist attacks on individuals,
          communities, and societies as global acts of terrorism can have great social,
          economic, and political repurcussions."),
        h3("OUR PROJECT |Goals and Why We Care"),
        p("Terrorism affects individuals, communities, and societies on multiple levels.
          Aside from the obvious physical and psychological impacts on direct victims
          of terrorism, terrorism causes deep-rooted fear and insecurity within affected
          populations. This problem is pertinent for any civilian or member of society as
          it is difficult to predict when or where the next attack will occur. Therefore,
          it is important to be aware of the ways in which one can be affected and to
          potentially prepare ways in which to respond. It is also important in order 
          to be an informed citizen and to be aware of global issues."),
        p("We seek to shed light on the sensitve topic of terrorist attacks by 
          bringing attention to the number of terrorist attacks that have occurred,
          where they occurred, and who and what was affected. By bringing awareness 
          to these aspects of terrorism and finding correlations between various data
          about those attacks (date, location, cause, etc.), we can raise awareness 
          and educate the public about terrorism and about targeted regions that are 
          not widely publicized by the media."),
        h3("THE DATA | Global Terrorism Dataset"),
        p("The dataset used throughout this project is called Global Terrorism Database
          (GTD) from kaggle.com. It lists over 180,000 terrorist attacks from 1970 to 2017.
          The GTD contains more than 135 features describing various aspects of terrorist 
          events such as location, target and attack type, damage sustained, whether the 
          attack was 'successful,' and more. The data was collected from researchers at 
          the National Consortium for the Study of Terrorism and Responses to Terrorism 
          (START) at the University of Maryland. Those researchers are also partnered with 
          the Pinkerton Global Intelligence Service (PGIS) to collect and maintain this data.
          Researchers obtained the data by reviewing articles that have been published about 
          each terrorist attack."),
        p("This project focuses on data from 2000 to  2017. From this 
          subset, 111,856 entries were recorded. The main features of interest include the 
          country in which the attack occurred, the type of attack that was used (i.e.
          bombing, hostage, kidnapping), the number of deaths from that attack, and the 
          number of people injured by the attack.")
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
        h3("CONCLUSION | Findings"),
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
        and to generate creative solutions."),
        p("Additionally, we found that the most terror attacks occurred
          in the Middle East and South Asia. There was a total of about
          forty-one thousand attacks in the Middle East and about 39 thousand
          in South Asia. The attacks the city targeted are mainly in Afghanistan
          and Iraq. Interestingly, the Philippines was ranked first in Southeast 
          Asia for the greatest number of terrorist attacks. The Philippines had 
          nearly five thousand attacks.")
      ),
      
      mainPanel(
        img(src = "https://communicationinprint.files.wordpress.com/2016/07/cartoon-2.jpg?w=1300&h=768&crop=1")
      )
    )
    )
  )
)
