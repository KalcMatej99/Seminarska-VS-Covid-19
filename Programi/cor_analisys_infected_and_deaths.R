library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

N <- db$Infected_to_peak
P <- db$Deaths_to_peak

plot(N,P,                                  
     main = "Vpliv števila okužencev na število mrtvih",
     xlab = "Število okužencev",
     ylab = "Število mrtvih")

r <- cor(N, P,  method = "pearson")
s <- cor(N, P,  method = "spearman")

rtest <- cor.test(N,P, method = "pearson")
stest <- cor.test(N,P, method = "spearman")