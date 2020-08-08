library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- db$Median_age
P <- 100 * db$Deaths_to_peak/db$Infected_to_peak

plot(S,P,                                  
     main = "Vpliv mediane populacije na fatalnost",
     xlab = "Mediana starosti EU države",
     ylab = "Fataliteta")

r <- cor(S, P,  method = "pearson")
s <- cor(S, P,  method = "spearman")

rtest <- cor.test(S,P, method = "pearson")
stest <- cor.test(S,P, method = "spearman")
