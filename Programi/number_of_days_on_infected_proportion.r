library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

dataFrameDates <- data.frame(date=db$Date_of_peak_of_infected,tx_start=db$Date_of_first_infected)
dataFrameDates$date_diff <- as.Date(as.character(dataFrameDates$date), format="%Y-%m-%d")-
  as.Date(as.character(dataFrameDates$tx_start), format="%Y-%m-%d")

N <- as.numeric(dataFrameDates$date_diff)
I <- (100 * db$Infected_to_peak)/db$Population

plot(N,I,                                  
     main = "Vpliv števila dni do viška dnevnih okuženih primerov na delež okuženih v prvi polovici prvega vala",
     xlab = "Število dni do viška dnevnih okuženih primerov EU države",
     ylab = "Delež okuženih EU države")
abline(lm(I ~ N), col = "red")

r1 <- cor(N, I,  method = "pearson")
s1 <- cor(N, I,  method = "spearman")
k1 <- cor(N, I,  method = "kendall")

rsq = r1^2

Fvalue = rsq/((2 - 1) * (1 - rsq) * (27 - 2))
