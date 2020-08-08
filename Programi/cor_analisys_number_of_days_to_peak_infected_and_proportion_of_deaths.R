library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

dataFrameDates <- data.frame(date=db$Date_of_peak_of_infected,tx_start=db$Date_of_first_infected)
dataFrameDates$date_diff <- as.Date(as.character(dataFrameDates$date), format="%Y-%m-%d")-
  as.Date(as.character(dataFrameDates$tx_start), format="%Y-%m-%d")

N <- as.numeric(dataFrameDates$date_diff)
P <- 100 * db$Deaths_to_peak/db$Infected_to_peak

plot(N,P,                                  
     main = "Vpliv števila dni do vrha prvega vala okužencev na delež mrtvih",
     xlab = "Število dni do vrha prvega vala okužencev",
     ylab = "Delež mrtvih")

r <- cor(N, P,  method = "pearson")
s <- cor(N, P,  method = "spearman")

rtest <- cor.test(N,P, method = "pearson")
stest <- cor.test(N,P, method = "spearman")