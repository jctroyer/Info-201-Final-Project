# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)

# Right now, the countries aren't matching up so I need to figure out
# how to match up the ISO codes of the shp and the df

# Map that filters by attack target and shows death and injury count through hue
point_map <- function(df, attack_type) {
  
  # Filter by attack type
  select_df <- df %>%
    filter(attacktype1_txt == attack_type) %>%
    mutate(impact = (nkill + nwound)/10)
  
  # Generate map
  leaflet(data = select_df) %>%
    addProviderTiles("CartoDB.Positron") %>%
    setView(lat = 30, lng = 0, zoom = 1.5) %>%
    addCircleMarkers(
      lat = ~latitude,
      lng = ~longitude,
      radius = ~impact,
      popup = ~ paste0(
        "<br> Deaths: ", nkill,
        "<br> Injured: ", nwound
      ),
      opacity = 0.7,
      stroke = FALSE
    )
}

# show breakdown of attacks by country, maybe compare
# how are types of attacks diff in diff countries
# what are the severity of attacts by country
# talk about where our current questions down and where they could go in a writeup
# api key in gitignore

# mapping from country_txt to shape-country-name, then replace names in the terrorism dataframe by making a new column called country_txt_clean or something
# within terrorism, group by country_txt and summarize
# create new col info  -if there is info, show info, if no info, show NA