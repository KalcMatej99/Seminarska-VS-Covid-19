library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- db$Median_age
dataFrameDates <- data.frame(date=db$Date_of_peak_of_infected,tx_start=db$Date_of_first_infected)
dataFrameDates$date_diff <- as.Date(as.character(dataFrameDates$date), format="%Y-%m-%d")-
  as.Date(as.character(dataFrameDates$tx_start), format="%Y-%m-%d")

N <- as.numeric(dataFrameDates$date_diff)

plot(S,N,                                  
     main = "Vpliv mediane populacije na število dni do vrhunca prvega vala okužencev",
     xlab = "Mediana starosti EU države",
     ylab = "Število dni do vrhunca prvega vala okužencev")

r <- cor(S, N,  method = "pearson")
s <- cor(S, N,  method = "spearman")

rtest <- cor.test(S,N, method = "pearson")
stest <- cor.test(S,N, method = "spearman")
