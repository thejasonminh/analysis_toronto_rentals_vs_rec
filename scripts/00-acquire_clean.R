####CLEANING DATA####
library(tidyverse)
library(janitor)

###Getting the apartment data. What I am looking for is the id and year built.###
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

##renaming n to count for readibility
cleaned_apartment_data <- cleaned_apartment_data |> rename(Count = n)

##write this data as a CSV to be read in the quarto doc
write.csv(cleaned_apartment_data, "/cloud/project/Inputs/data/cleaned_aptment_data.csv", row.names = FALSE)


###Getting the bike data. What I am looking for is the id and year installed###
cleaned_bike_data <- bike_data |> select("_id", INSTALLED)

##Filtering the bike path data by year installed from 2015-2022
cleaned_bike_data <- filter(cleaned_bike_data, INSTALLED == "2022" | INSTALLED == "2021" 
                                 | INSTALLED == "2020" | INSTALLED == "2019" 
                                 | INSTALLED == "2018" | INSTALLED == "2017" 
                                 | INSTALLED == "2016" | INSTALLED == "2015")

##Cleaning the names of the columns to make them easier to work with
cleaned_bike_data <- clean_names(cleaned_bike_data)

cleaned_bike_data <- cleaned_bike_data |> rename(Year_Installed = installed)

##Getting the count of amount of paths installed per year
cleaned_bike_data <- count(cleaned_bike_data, Year_Installed)

##Get rid of geometry column
cleaned_bike_data <- sf::st_set_geometry(cleaned_bike_data, NULL)

##renaming n to count for readibility
cleaned_bike_data <- cleaned_bike_data |> rename(Count = n)

##write this data as a CSV to be read in the quarto doc
write.csv(cleaned_bike_data, "/cloud/project/Inputs/data/cleaned_bike_data.csv", row.names = FALSE)


###Getting the applications data. What I am looking for is the id, condo applications and status of applications###
cleaned_applications_data <- applications_data|>select("_id", APPLICATION_TYPE, STATUS)

##filtering the data so that I am only dealing with CD, or condo, application types
cleaned_applications_data <- cleaned_applications_data |> filter(APPLICATION_TYPE == "CD")

##next, to filter out all the datasets with a "Closed" application type.
cleaned_applications_data <- cleaned_applications_data |> filter(!STATUS == "Closed")

##same as above, but removing "refused" application types.
cleaned_applications_data <- cleaned_applications_data |> filter(!STATUS == "Refused")

##there are  2 "under review" columns, time to combine them. first we need to clean names so it's easier
cleaned_applications_data <- clean_names(cleaned_applications_data)

##merging the 2 "under review" columns
cleaned_applications_data <- cleaned_applications_data |> 
  mutate(
    status = 
    recode(
      status,
      "Under Review" = "Under Review "
    )
  )

##getting the counts of amounts per status
cleaned_applications_data <- count(cleaned_applications_data, status)

##renaming n to count for readibility
cleaned_applications_data <- cleaned_applications_data |> rename(Count = n)

##write this data as a CSV to be read in the quarto doc
write.csv(cleaned_applications_data, "/cloud/project/Inputs/data/cleaned_applications_data.csv", row.names = FALSE)