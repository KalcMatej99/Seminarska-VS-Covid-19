import csv

with open('./../Podatki/Median_age_per_country.csv') as medianAgePerCountryFile:

    with open('./../Podatki/Median_age_per_EU_country.csv', 'a') as medianAgePerEUCountryFile:
        medianAgePerCountry = csv.reader(medianAgePerCountryFile, delimiter=',')
        medianAgePerEUCountry = csv.writer(medianAgePerEUCountryFile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)

        for row in medianAgePerCountry:
            print(row)

            nameOfCountryInAgeFile = row[0]

            with open('./../Podatki/List_of_EU_members.csv') as listOfEUmembersFile:
                listOfEUmembers = csv.reader(listOfEUmembersFile, delimiter=';')
                for row2 in listOfEUmembers:
                    nameOfCountryInEUMembers = row2[0]
                    print(nameOfCountryInEUMembers)
                    if nameOfCountryInAgeFile == nameOfCountryInEUMembers:
                        medianAgePerEUCountry.writerow(row)