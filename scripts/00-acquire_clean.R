####CLEANING DATA####
library(tidyverse)
library(janitor)
##Getting the apartment data. What I am looking for is the id and year built.
cleaned_apartment_data <- apartment_data |> select("_id", YEAR_BUILT)
##Filtering the apartment data by only selecting the ones built from 2022-2015
cleaned_apartment_data <- filter(cleaned_apartment_data, YEAR_BUILT == "2022" | YEAR_BUILT == "2021" 
                                 | YEAR_BUILT == "2020" | YEAR_BUILT == "2019" 
                                 | YEAR_BUILT == "2018" | YEAR_BUILT == "2017" 
                                 | YEAR_BUILT == "2016" | YEAR_BUILT == "2015")

##cleaning the name so it's easy to work with
cleaned_apartment_data <- clean_names(cleaned_apartment_data)

##getting the count of apartments built per year and putting it into my data
cleaned_apartment_data <- count(cleaned_apartment_data, year_built)

##Getting the bike data. What I am looking for is the id and year installed
cleaned_bike_data <- bike_data |> select("_id", INSTALLED)

##Filtering the bike path data by year installed from 2015-2022
cleaned_bike_data <- filter(cleaned_bike_data, INSTALLED == "2022" | INSTALLED == "2021" 
                                 | INSTALLED == "2020" | INSTALLED == "2019" 
                                 | INSTALLED == "2018" | INSTALLED == "2017" 
                                 | INSTALLED == "2016" | INSTALLED == "2015")

##Cleaning the names of the columns to make them easier to work with
cleaned_bike_data <- clean_names(cleaned_bike_data)

##Getting the count of amount of paths installed per year
cleaned_bike_data <- count(cleaned_bike_data, installed)

##Getting the applications data. What I am looking for is the condo applications approved/under review