library(pracma)
library(plotly)
library(lawstat)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db<- read.csv(fileDB, header=TRUE, sep=",")
db <- db[order(db$Median_age, decreasing = FALSE),]
infected <- db$Infected_to_peak
deaths <- db$Deaths_to_peak
prop <- 100*deaths/infected
db$Country_Name <- factor(db$Country_Name, levels = unique(db$Country_Name)[order(prop, decreasing = FALSE)])


hist(prop, main = "Histogram fatalnosti virusa držav EU", xlab = "Fatalnost", ylab = "Frekvenca")
plot_ly(x = prop, y = db$Country_Name, type = 'bar', orientation = 'h')  %>% layout(title="Fatalnost")

shapiro.test(prop)

symmetry.test(prop)


db <- read.csv(fileDB, header=TRUE, sep=",")
df <- data.frame()

for(index in 1:27) {
  new_row <- 100 * round(as.numeric(prop.test(db$Deaths_to_peak[index],db$Infected_to_peak[index])$conf.int), 5)
  df <- rbind(df, new_row)
}

namesOfCountrys <- db$Country_Name
df <- cbind(namesOfCountrys, df)

fileIntervalZaupanjaFatalnost <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/intervalZaupanjaFatalnost.csv'
write.csv(df, fileIntervalZaupanjaFatalnost)