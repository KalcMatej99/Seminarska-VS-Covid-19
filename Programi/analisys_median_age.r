library(pracma)
library(plotly)
library(lawstat)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")
db <- db[order(db$Median_age, decreasing = FALSE),]
medianAge <- db$Median_age
db$Country_Name <- factor(db$Country_Name, levels = unique(db$Country_Name)[order(db$Median_age, decreasing = FALSE)])


hist(medianAge, main = "Histogram mediane starosti držav", xlab="Mediana starosti", ylab = "Frekvenca")
plot_ly(x = medianAge, y = db$Country_Name, type = 'bar', orientation = 'h') %>% layout(title="Mediana starosti")

shapiro.test(medianAge)

symmetry.test(medianAge)