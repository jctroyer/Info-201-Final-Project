# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)
library(rgdal)
library(raster)

# Load dataframe
terrorism <- read.csv("data/global_terrorism.csv", stringsAsFactors = FALSE)

# Load world data
world <- readOGR("data/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp")

# Group by country name and summarize for the info we want
terrorism_select <- terrorism %>%
  dplyr::select(country_txt, attacktype1_txt, nkill, nwound, latitude, longitude)

terrorism_select$attacktype1_txt[terrorism_select$attacktype1_txt == "Unknown"] <- "Unspecified Attack Type"

# Merge data
# merged_data <- sp::merge(world, terrorism_unique, by.x = "NAME", by.y = "country_txt", duplicateGeoms = TRUE, all.x = FALSE)

# Get list of types of attack targets
attack_target <- terrorism_select %>%
  dplyr::select(attacktype1_txt) %>%
  unique()

# Extract country names for control widget
country <- terrorism %>%
  dplyr::select(country_txt) %>%
  unique() %>%
  arrange(country_txt)

# Extract region names for control widget
region <- terrorism %>%
  dplyr::select(region_txt) %>%
  unique()