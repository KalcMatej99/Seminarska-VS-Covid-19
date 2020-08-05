library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- db$Median_age
F <- db$Deaths_to_peak/db$Infected_to_peak

plot(S,F,                                  
     main = "Vpliv mediane populacije na fatalnost Covid-19 v prvi polovici prvega vala",
     xlab = "Mediana starosti EU države",
     ylab = "Fatalnost EU države")
abline(lm(F ~ S), col = "red")

r1 <- cor(S, F,  method = "pearson")
r2 <- cor(S, F,  method = "pearson", use = "complete.obs")
s1 <- cor(S, F,  method = "spearman")
s1 <- cor(S, F,  method = "spearman", use = "complete.obs")

rsq = r1^2

Fvalue = rsq/((2 - 1) * (1 - rsq) * (27 - 2))
