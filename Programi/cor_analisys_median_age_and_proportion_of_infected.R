library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- db$Median_age
P <- 100 * db$Infected_to_peak/db$Population

plot(S,P,                                  
     main = "Vpliv mediane populacije na delež okuženih",
     xlab = "Mediana starosti EU države",
     ylab = "Delež okuženih")

r <- cor(S, P,  method = "pearson")
s <- cor(S, P,  method = "spearman")

rtest <- cor.test(S,P, method = "pearson")
stest <- cor.test(S,P, method = "spearman")
