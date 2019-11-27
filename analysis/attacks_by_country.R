# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)

# Right now, the countries aren't matching up so I need to figure out
# how to match up the ISO codes of the shp and the df

# Map that filters by attack target and shows death and injury count through hue
target_map <- function(df, world_data, attack_type) {

  # Filter by attack type
  select_df <- df %>%
    filter(attacktype1_txt == attack_type) %>%
    group_by(country_txt) %>%
    summarize(impact = sum(naffected, na.rm = FALSE), deaths = sum(nkill, na.rm = FALSE),
              injuries = sum(nwound, na.rm = FALSE))
  
  # Create bins (how the legend will be ordered)
  mybins <- c(0, 10, 50, 100, 500, 1000, 10000, 50000)

  # Color palette
  mypal <- colorBin(
    palette = "YlOrRd", domain = select_df$impact,
    na.color = "transparent", bins = mybins
  )

  # Generate map
  leaflet(world_data) %>%
    addTiles() %>%
    setView(lat = 30, lng = 0, zoom = 1.5) %>%
    addPolygons(
      data = world_data,
      stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.7,
      fillColor = ~ mypal(select_df$impact),
      popup = paste(
        "Country: ", select_df$country_txt, "<br>",
        "Killed: ", select_df$deaths, "<br>",
        "Wounded: ", select_df$injuries, "<br>"
      )
    ) %>%
    addLegend(
      position = "bottomright",
      pal = mypal,
      values = select_df$impact,
      title = "Casualties",
      opacity = 1
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