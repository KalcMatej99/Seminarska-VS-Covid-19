import csv

with open('./../Podatki/List_of_EU_members.csv') as listOfEUmembersFile:
    listOfEUmembers = csv.reader(listOfEUmembersFile, delimiter=',')

    with open('./../Podatki/Peak_per_country.csv', 'a') as peakDateOfInfectedPerCountryFile:
        peakDateOfInfectedPerCountry = csv.writer(
            peakDateOfInfectedPerCountryFile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        peakDateOfInfectedPerCountry.writerow(
            ["Country_Name", "Date_of_first_infected", "Date_of_first_death", "Date_of_peak_of_infected", "Date_of_peak_of_deaths", "Infected_to_peak", "Deaths_to_peak"])

        isFirstRow = True
        for row in listOfEUmembers:
            if isFirstRow:
                isFirstRow = False
                continue
            codeOfCountry = row[1]
            nameOfCountry = row[0]
            maxInfectedPerDay = 0
            maxDeathsPerDay = 0
            dayOfPeakofInfected = 0
            dayOfPeakofDeaths = 0
            dayOfFirstInfected = 0
            dayOfFirstDeath = 0
            cumulativeInfectedToPeak = 0
            cumulativeDeathsToPeak = 0

            with open('./../Podatki/WHO-COVID-19-global-data.csv') as WHOFile:
                dataWHO = csv.reader(WHOFile, delimiter=',')
                for row2 in dataWHO:
                    countryCodeInDataFile = row2[1]
                    if countryCodeInDataFile == codeOfCountry:
                        date = row2[0]
                        newDeathsForDate = int(row2[6])
                        newInfectedForDate = int(row2[4])

                        if newDeathsForDate > maxDeathsPerDay:
                            if dayOfFirstDeath == 0:
                                dayOfFirstDeath = date
                            dayOfPeakofDeaths = date
                            maxDeathsPerDay = newDeathsForDate

                        if newInfectedForDate > maxInfectedPerDay:
                            if dayOfFirstInfected == 0:
                                dayOfFirstInfected = date
                            dayOfPeakofInfected = date
                            maxInfectedPerDay = newInfectedForDate

            with open('./../Podatki/WHO-COVID-19-global-data.csv') as WHOFile:
                dataWHO = csv.reader(WHOFile, delimiter=',')
                for row2 in dataWHO:
                    countryCodeInDataFile = row2[1]
                    date = row2[0]
                    if countryCodeInDataFile == codeOfCountry and dayOfPeakofInfected == date:
                        cumulativeInfectedToPeak = row2[5]
                        cumulativeDeathsToPeak = row2[7]

            peakDateOfInfectedPerCountry.writerow(
                [nameOfCountry, dayOfFirstInfected, dayOfFirstDeath, dayOfPeakofInfected, dayOfPeakofDeaths, cumulativeInfectedToPeak, cumulativeDeathsToPeak])
