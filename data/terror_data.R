# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)
library(rgdal)
library(raster)

# Load dataframe
terrorism <- read.csv("data/global_terrorism.csv", stringsAsFactors = FALSE)

# Group by country name and summarize for the info we want

# terrorism_select info: country (code and name), attack, num killed and
# wounded, and total number "affected" 
terrorism_select <- terrorism %>%
  mutate(naffected = nkill + nwound) %>%
  dplyr::select(country, country_txt, attacktype1_txt, nkill, nwound, naffected)

terrorism_unique <- terrorism %>%
  mutate(affected = nkill + nwound) %>%
  group_by(country_txt) %>% 
  summarize(impact = sum(affected, na.rm = FALSE))

# Load world data
world <- readOGR("data/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp")

# Merge data
merged_data <- sp::merge(world, terrorism_unique, by.x = "NAME", by.y = "country_txt", duplicateGeoms = TRUE)

# Get list of types of attack targets
attack_target <- terrorism %>%
  dplyr::select(attacktype1_txt) %>%
  unique()

# Extract country names for control widget
country <- terrorism_df %>%
  dplyr::select(country_txt) %>%
  unique() %>%
  arrange(country_txt)