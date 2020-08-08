library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- 100 * db$Number_of_tests_from_first_test_to_peak_of_infected/db$Population
P <- 100 * db$Deaths_to_peak/db$Infected_to_peak

plot(S,P,                                  
     main = "Vpliv deleža testov na delež mrtvih",
     xlab = "Delež testov",
     ylab = "Delež mrtvih")

r <- cor(S, P,  method = "pearson")
s <- cor(S, P,  method = "spearman")

rtest <- cor.test(S,P, method = "pearson")
stest <- cor.test(S,P, method = "spearman")