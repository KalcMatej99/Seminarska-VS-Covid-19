library(pracma)
fileMedianAgePerEuCountry <- './../Podatki/Median_age_per_EU_country.csv'
filePeakPerEuCountry <- './../Podatki/Peak_per_country.csv'
dataMedianAge <- read.csv(fileMedianAgePerEuCountry, header=TRUE, sep=",")
dataPeakPerContry<- read.csv(filePeakPerEuCountry, header=TRUE, sep=",")

dataMedianAge
dataPeakPerContry

numberOfEUCountries <- 27

S <- dataMedianAge[, 2]
F <- dataPeakPerContry[, 5]/dataPeakPerContry[, 4]

plot(S,F,                                  
     main = "Vpliv mediane populacije na fatalnost Covid-19 v prvi polovici prvega vala",
     xlab = "Mediana starosti EU države",
     ylab = "Fatalnost EU države")
abline(lm(F ~ S), col = "red")