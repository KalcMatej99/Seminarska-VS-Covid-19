library(pracma)
fileNameAgePerCountry <- './../Podatki/Median_age_per_country.csv'
fileNameCountryInEurope <- './../Podatki/List_of_European_countries.csv'
fileNameAgePerCountryInEurope <- "./../Podatki/Median_age_per_European_country.csv"
file.create(fileNameAgePerCountryInEurope)

dataAgePerCountry <- read.csv(fileNameAgePerCountry)
dataCountryInEurope <- read.csv(fileNameCountryInEurope)

numberOffCountries <- nrow(dataCountryInEurope)

index <- 1
dataToInsert <- matrix(, nrow = 0, ncol = 2)
for (c in 1:nrow(dataCountryInEurope["Country"])) {
  countryName <- as.character(dataCountryInEurope[c, "Country"])
  for(c2 in 1:nrow(dataAgePerCountry["Country"])) {
    countryInEuropeName <- as.character(dataAgePerCountry[c2, "Country"])
    if(strcmpi(countryName, countryInEuropeName)) {
      dataToInsert[index] <- dataAgePerCountry[index,]
      print(dataToInsert)
      dataToInsert
      index <- index + 1
    }
  }
    
}

write.csv(dataToInsert, fileNameAgePerCountryInEurope, row.names=FALSE, append = TRUE)


