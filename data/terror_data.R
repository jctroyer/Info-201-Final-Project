# Load packages
library(dplyr)
library(ggplot2)
library(leaflet)
library(rgdal)

# Load dataframe
terrrorism <- read.csv("data/global_terrorism.csv", stringsAsFactors = FALSE)

world <- readOGR("data/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.shp")

# Get list of types of attack targets
attack_target <- terrrorism %>%
  dplyr::select(attacktype1_txt) %>%
  unique()
