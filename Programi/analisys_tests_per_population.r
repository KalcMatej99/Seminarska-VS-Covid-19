library(pracma)
library(plotly)
library(lawstat)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")
db <- db[order(db$Median_age, decreasing = FALSE),]
tests <- db$Number_of_tests_from_first_test_to_peak_of_infected
population <- db$Population
prop <- 100*tests/population
db$Country_Name <- factor(db$Country_Name, levels = unique(db$Country_Name)[order(prop, decreasing = FALSE)])


hist(prop, main = "Histogram deleža testov", xlab="Delež testov", ylab = "Frekvenca")
plot_ly(x = prop, y = db$Country_Name, type = 'bar', orientation = 'h') %>% layout(title="Delež testov")

shapiro.test(prop)

symmetry.test(prop)


minimum <- min(prop)
maximum <- max(prop)

medianN <- median(prop)
razponN <- IQR(prop)