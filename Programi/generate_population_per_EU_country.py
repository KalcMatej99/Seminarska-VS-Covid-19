import csv

with open('./../Podatki/Population_per_country.csv') as populationCountryFile:

    with open('./../Podatki/Population_per_EU_country.csv', 'a') as populationPerEUCountryFile:
        populationCountry = csv.reader(populationCountryFile, delimiter=',')
        populationPerEUCountry = csv.writer(populationPerEUCountryFile, delimiter=';', quotechar='|', quoting=csv.QUOTE_MINIMAL)

        for row in populationCountry:
            nameOfCountryInPopulationFile = row[0]
            with open('./../Podatki/List_of_EU_members.csv') as listOfEUmembersFile:
                listOfEUmembers = csv.reader(listOfEUmembersFile, delimiter=';')
                for row2 in listOfEUmembers:
                    nameOfCountryInEUMembers = row2[0]
                    if nameOfCountryInPopulationFile == nameOfCountryInEUMembers:
                        print(row)
                        populationPerEUCountry.writerow(row)