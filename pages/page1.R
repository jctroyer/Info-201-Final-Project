# Load packages
library(shiny)

page_one <- tabPanel("About The Project", fluid = TRUE,
        # Link to tech report
        h4("Technical Report"),
        a("Access technical report here",
           href="https://github.com/jctroyer/Info-201-Final-Project/wiki",
           target="_blank"),
        
        h4("Background"),
        p("Terrorism is the unlawful and systematic use of violence against a
          state, country, or group of people, motivated by various ideologies,
          as a form of political coercion. Global acts of terrorism have 
          impactedhundreds, thousands, and millions of people throughout 
          history in social, economic, and political ways."),

        h4("Stakeholders"),
        p("Direct stakeholders include political entities (i.e. a government,
          political figure, or organization), both as targets and instigators.
          As instigators, political entities plan and execute attacks against
          other states, nations, other political groups, or specific political
          figures to further some political, religious, or other ideological
          objective. As targets, these political entities suffer damage from
          their attackers which may include death, injury, and political and
          economic harm.
          <br>
          Indirect stakeholders include civilians residing in or around the
          targeted person, group, or nation. These civilians are typically
          citizens of a state and are not direct or intended targets. Civilians
          may suffer personal loss via death or injury of themselves or loved
          ones as well as property damage or socioeconomic difficulties that
          may result from damage sustained from main stakeholders (such as
          governments or major political leaders)."),
        
        h4("What We're Studying"),
        p("The members of our group, like many Americans and other citizens
          around the world, is generally uninformed about both small and large
          scale terrorist attacks that have happened in the last few decades.
          We are interested in this topic because we would like to learn more
          on how these attacks could potentially affect us if we as a community,
          state, or nation were to become the next target of an attack. In other
          words, what are the effects of terrorism on individuals and their
          societies?"),

        h4("About the Tech"),
        p("The dataset that is being used throughout this project is called the
          Global Terrorism Database from kaggle.com.  The database is maintained
          by researchers at the National Consortium for the Study of Terrorism and
          Responses to Terrorism (START), headquartered at the University of
          Maryland. All data wrangling was done in R and deployed on this site
          using Shiny.  Additionally, we used packages such as ggplot and leaflet
          to create the engaging data visualizations.")
        )