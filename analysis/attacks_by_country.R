# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)
library(tidyr)

# Right now, the countries aren't matching up so I need to figure out
# how to match up the ISO codes of the shp and the df

# Filter by attack target and show death and injury count through hue
target_map <- function(df, world_data, attack_type) {
  num_affected <- df %>%
    mutate(naffected = df$nkill + df$nwound) %>%
    select(country, country_txt, attacktype1_txt, nkill, nwound, naffected) %>%
    drop_na()

  # Select only the data that the user selects
  select_df <- num_affected %>%
    filter(attacktype1_txt == attack_type) %>%
    group_by(country_txt) %>%
    summarize(impact = sum(naffected), deaths = sum(nkill),
              injuries = sum(nwound))

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
