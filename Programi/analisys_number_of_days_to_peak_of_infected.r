library(pracma)
library(plotly)
library(lawstat)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")
dataFrameDates <- data.frame(date=db$Date_of_peak_of_infected,tx_start=db$Date_of_first_infected)
dataFrameDates$date_diff <- as.Date(as.character(dataFrameDates$date), format="%Y-%m-%d")-
  as.Date(as.character(dataFrameDates$tx_start), format="%Y-%m-%d")

N <- as.numeric(dataFrameDates$date_diff)
db$Country_Name <- factor(db$Country_Name, levels = unique(db$Country_Name)[order(N, decreasing = FALSE)])


hist(N, main = "Histogram števila dni do vrha prvega vala okužencev", xlab="Število dni", ylab = "Frekvenca")
plot_ly(x = N, y = db$Country_Name, type = 'bar', orientation = 'h') %>% layout(title="Število dni do vrha prvega vala okužencev")

shapiro.test(N)

symmetry.test(N)