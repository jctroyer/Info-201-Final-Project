library(dplyr)
library(ggplot2)
library(leaflet)
library(rgdal)
library(raster)

terrorism <- read.csv("data/global_terrorism.csv", stringsAsFactors = FALSE)

region <- terrorism %>%
  dplyr::select(region_txt) %>%
  unique()

region_summary <- function(region){
  region_string <- toString(region)
  region_filter <- terrorism %>% filter(region_txt == region_string)
  #
  all_country_attacked <- region_filter %>% count(country_txt)
  #
  all_attack_type <- region_filter %>% count(attacktype1_txt)
  #
  max_country_targetted <- all_country_attacked[which.max(all_country_attacked$n),]
  #used - _Total_ number of attacks
  total_attacks <- sum(all_country_attacked$n)
  #used - Percentage of successful attacks in this region
  num_success <- region_filter %>% count(success)
  percent_success <- paste0(trunc((num_success[2,2] / total_attacks) * 100), "%")
  #used - Country with _most_ attacks 
  name_max_country <- max_country_targetted[,1]
  #used - Number of Attacks in Country with _highest_ Frequency
  num_max_country <- max_country_targetted$n
  #used - Country with _least_ number of attacks
  min_country_targetted <- all_country_attacked[which.min(all_country_attacked$n),]
  name_min_country <- min_country_targetted[,1]
  #used - Number of Attacks in Country with _lowest_ Frequency
  num_min_country <- min_country_targetted$n
  #used - most frequent attack type
  max_attack_type <- all_attack_type[which.max(all_attack_type$n),]
  name_max_attack_type <- max_attack_type[,1]
  #used - least frequent attack type 
  min_attack_type <- all_attack_type[which.min(all_attack_type$n),]
  name_min_attack_type <- min_attack_type[,1]
  #used - most common target type
  all_target_type <- region_filter %>% count(targtype1_txt)
  max_target_type <- all_target_type[which.max(all_target_type$n),]
  name_max_target_type <- max_target_type[,1]
  #used - least common target type
  min_target_type <- all_target_type[which.min(all_target_type$n),] 
  name_min_target_type <- min_target_type[,1]
  #used - most frequent city attacked
  city <- region_filter %>% count(city)
  max_city <- city[which.max(city$n),]
  name_max_city <- max_city[,1]
  #used - least frequency city attacked
  min_city <- city[which.min(city$n),]
  name_min_city <- min_city[,1]
  
  #creating a dataframe for what will be returned 
  Title <- c("Region", "Percentage of successful attacks in this region",
             "Total number of attacks in this region",
             "Country with MOST attacks", "Number of Attacks in Country with HIGHEST Frequency",
             "Country with LEAST attacks", "Number of Attacks in Country with LOWEST Frequency",
             "MOST frequent ATTACK type", "LEAST frequent ATTACK type", 
             "MOST common TARGET type", "LEAST common TARGET type", 
             "MOST frequent city attacked", "LEAST frequency city attacked")
  Information <- c(region_string,  percent_success,
                   total_attacks,
                   name_max_country, num_max_country, 
                   name_min_country, num_min_country, 
                   name_max_attack_type, name_min_attack_type,
                   name_max_target_type, name_min_target_type,
                   name_max_city, name_min_city)
  df <- tibble(Title, Information)
}

