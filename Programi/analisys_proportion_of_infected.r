library(pracma)
library(plotly)
library(lawstat)
fileDB <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/db.csv'
db <- read.csv(fileDB, header=TRUE, sep=",")

db <- db[order(db$Median_age, decreasing = FALSE),]
infected <- db$Infected_to_peak
population <- db$Population
prop <- 100*infected/population
db$Country_Name <- factor(db$Country_Name, levels = unique(db$Country_Name)[order(db$Infected_to_peak/db$Population, decreasing = FALSE)])


hist(prop, main = "Histogram deleža okužencev držav EU", xlab="Delež okužencev", ylab = "Frekvenca")
plot_ly(x = prop, y = db$Country_Name, type = 'bar', orientation = 'h') %>% layout(title="Delež okužencev")

shapiro.test(prop)

symmetry.test(prop)


db <- read.csv(fileDB, header=TRUE, sep=",")
df <- data.frame()

for(index in 1:27) {
  new_row <- 100 * round(as.numeric(prop.test(db$Infected_to_peak[index],db$Population[index])$conf.int), 5)
  df <- rbind(df, new_row)
}

namesOfCountrys <- db$Country_Name
df <- cbind(namesOfCountrys, df)

fileIntervalZaupanjaDelezOkuzenih <- '/home/matej/Documents/Seminarska-VS-Covid-19//Podatki/intervalZaupanjaDelezOkuzenih.csv'
write.csv(df, fileIntervalZaupanjaDelezOkuzenih)


minimum <- min(prop)
maximum <- max(prop)

medianN <- median(prop)
razponN <- IQR(prop)

