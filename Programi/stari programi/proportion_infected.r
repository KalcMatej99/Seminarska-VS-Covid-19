library(pracma)
require(graphics)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

dataFrameDates <- data.frame(date=db$Date_of_peak_of_infected,tx_start=db$Date_of_first_infected)
dataFrameDates$date_diff <- as.Date(as.character(dataFrameDates$date), format="%Y-%m-%d")-
  as.Date(as.character(dataFrameDates$tx_start), format="%Y-%m-%d")

inf <- (db$Infected_to_peak)/db$Population
names <- db$Country_Name

u = mean(inf)


n <- 27

t2 <- 1.96
t <- 3.291

country <- c()
leftMargin <- c()
rightMargin <- c()

for (ind in 1:27) {

p <- inf[ind]
margin <- t * sqrt((1 - p) * p / db$Population[ind])

country <- append(country, as.character(names[ind]))
leftMargin <- append(leftMargin, round(p * 100, digits = 3))
rightMargin <- append(rightMargin, round((p + margin) * 100, digits = 3))
}
dataToPlot <- data.frame(country, leftMargin, rightMargin)
write.csv(dataToPlot,'/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/dbMargins.csv', row.names = FALSE)
