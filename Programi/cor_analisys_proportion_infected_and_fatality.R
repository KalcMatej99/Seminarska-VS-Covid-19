library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

N <- 100 * db$Infected_to_peak/db$Population
P <- 100 * db$Deaths_to_peak/db$Infected_to_peak

plot(N,P,                                  
     main = "Vpliv deleža okužencev na fatalnost",
     xlab = "Delež okužencev",
     ylab = "Fatalnost")

r <- cor(N, P,  method = "pearson")
s <- cor(N, P,  method = "spearman")

rtest <- cor.test(N,P, method = "pearson")
stest <- cor.test(N,P, method = "spearman")