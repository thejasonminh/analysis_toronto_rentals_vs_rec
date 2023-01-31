##download and datasets and put them into a csv file in /inputs

library(opendatatoronto)
library(dplyr)

##downloading Apartment Building Evaluation dataset first
# get package
package <- show_package("4ef82789-e038-44ef-a478-a8f3590c3eb1")
package

# get all resources for this package
resources <- list_package_resources("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
apartment_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

##write the apartments data as a csv within inputs/data folder
write.csv(apartment_data, "/cloud/project/Inputs/data/raw_apartment_data.csv", row.names = FALSE)

##next, downloading the Parks and Recreational Projects dataset

# get package
package_2 <- show_package("park-and-recreation-facility-projects")
package_2

# get all resources for this package
resources_2 <- list_package_resources("park-and-recreation-facility-projects")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources_2 <- filter(resources_2, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
parks_n_rec_data <- filter(datastore_resources_2, row_number()==1) %>% get_resource()


##write the parks n rec projects data as a csv within inputs/data folder
write.csv(parks_n_rec_data, "/cloud/project/Inputs/data/raw_pnr_data.csv", row.names = FALSE)

##downloading dataset for development applications

# get package
package_3 <- show_package("0aa7e480-9b48-4919-98e0-6af7615b7809")
package_3

# get all resources for this package
resources_3 <- list_package_resources("0aa7e480-9b48-4919-98e0-6af7615b7809")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources_3 <- filter(resources_3, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
applications_data <- filter(datastore_resources_3, row_number()==1) %>% get_resource()

##write the applications data as a csv within inputs/data folder
write.csv(applications_data, "/cloud/project/Inputs/data/raw_applications_data.csv", row.names = FALSE)
