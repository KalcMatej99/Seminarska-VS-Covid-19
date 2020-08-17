library(pracma)
fileDB <- './../Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")

S <- 100 * db$Number_of_tests_from_first_test_to_peak_of_infected/db$Population
P <- 100 * db$Infected_to_peak/db$Population

plot(S,P,                                  
     main = "Vpliv deleža testov na delež okuženih",
     xlab = "Delež testov",
     ylab = "Delež okuženih")


r <- cor(S, P,  method = "pearson")
s <- cor(S, P,  method = "spearman")

rtest <- cor.test(S,P, method = "pearson")
stest <- cor.test(S,P, method = "spearman")

transf<-function(r){
  0.5*log((1+r)/(1-r))}

cor2.test<-function(r,rh0,n){
  z<-(transf(r)-transf(rh0))*sqrt(n-3)/sqrt(1.06)
  p<-1-pnorm(z)
  c(paste("Test statistics=",round(z,3), ", ", "p-value=",round(p,3),sep=""))
}

cor2.test(r,0.3,27)

