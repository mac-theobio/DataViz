## as written, runs from the data directory

## NYC zip codes
t1 <- tempfile()
url1 <- "https://data.cityofnewyork.us/download/i8iw-xf4u/application%2Fzip"
download.file(url1, dest = t1)
unzip(t1, exdir = "nyc_zipcodes")

## 2015 Federal ridings boundaries

t2 <- tempfile()
url2 <- "https://ftp.maps.canada.ca/pub/elections_elections/Electoral-districts_Circonscription-electorale/federal_electoral_districts_boundaries_2015/federal_electoral_districts_boundaries_2015_shp_en.zip"
download.file(url2, dest = t2)
unzip(t2, exdir = "boundaries_2015_shp_en")

## previously retrieved Google Maps info
## see get_googlemaps_data.R
download.file("https://github.com/mac-theobio/DataViz19/blob/master/data/googlemaps.rda", dest = "googlemaps.rda")
