
# ************THIS IS AN EXPERIMENTAL TEST FILE BECAUSE I DON'T KNOW WHAT I'M DOING SOMETIMES**************

# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(maps)
library(ggiraph)
library(rgdal)

# Load dataframe
terrrorism <- read.csv("../data/global_terrorism.csv", stringsAsFactors = FALSE)

# Load world map
world <- readOGR("../data/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp")

# Get list of types of attack targets
attack_target <- terrrorism %>%
  select(attacktype1_txt) %>%
  unique()

# Number of people affected (killed + injured) by country
num_affected <- terrrorism %>%
  mutate(naffected = terrrorism$nkill + terrrorism$nwound) %>%
  group_by(country_txt) %>%
  summarize(impact = sum(naffected), deaths = sum(nkill), injuries = sum(nwound)) 

# Filter by attack target and show death and injury count through hue

select_df <- terrrorism %>%
  filter(attacktype1_txt == "Armed Assault") %>%
  group_by(country) %>%
  summarize(impact = sum(naffected), deaths = sum(nkill), injuries = sum(nwound)) %>%
  sort()

# Create bins (how the legend will be ordered)
mybins <- c(0,10, 50, 100, 500, 1000, 10000, 50000)

# Color palette
mypal <- colorBin(palette = "RdYlBu", domain = select_df$impact, na.color = "transparent", bins = mybins, reverse = TRUE)

# Generate map
leaflet(world) %>% 
  addTiles() %>%
  setView(lat=40, lng=0 , zoom=1.5) %>%
  addPolygons(data = world,
              stroke = FALSE, smoothFactor = 0.2, fillOpacity = 0.7,
              fillColor = ~mypal(select_df$impact),
              popup = paste("Country: ", select_df$country_txt, "<br>",
                            "Killed: ", select_df$deaths, "<br>",
                            "Wounded: ", select_df$injuries, "<br>")) %>%
  addLegend(position = "bottomright", 
            pal = mypal, 
            values = select_df$impact,
            title = "Impact by Country",
            opacity = 1)
