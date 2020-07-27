library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- db$Median_age
I <- (100 * db$Infected_to_peak)/db$Population

plot(S,I,                                  
     main = "Vpliv mediane populacije na delež okuženih v prvi polovici prvega vala",
     xlab = "Mediana starosti EU države",
     ylab = "Delež okuženih EU države")
abline(lm(I ~ S), col = "red")

r1 <- cor(S, I,  method = "pearson")
s1 <- cor(S, I,  method = "spearman")

rsq = r1^2

Fvalue = rsq/((2 - 1) * (1 - rsq) * (27 - 2))
