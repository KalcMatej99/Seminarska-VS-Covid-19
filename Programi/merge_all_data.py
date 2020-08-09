import csv
import pandas as pd
import math

with open('./../Podatki/List_of_EU_members.csv') as listOfEUmembersFile, open('./../Podatki/Median_age_per_EU_country.csv') as medianAgePerEuCountryFile, open('./../Podatki/Peak_per_country.csv') as peakPerEuCountryFile, open('./../Podatki/Population_per_EU_country.csv') as populationPerEuCountryFile, open('./../Podatki/Tests_per_EU_country.csv') as testsPerEuCountryFile, open('./../Podatki/db.csv', 'a') as dbFile:

    listOfEUmembers = pd.read_csv(listOfEUmembersFile, delimiter=',')
    medianAgePerEuCountry = pd.read_csv(
        medianAgePerEuCountryFile, delimiter=',')
    peakPerEuCountry = pd.read_csv(peakPerEuCountryFile, delimiter=',')
    populationPerEuCountry = pd.read_csv(
        populationPerEuCountryFile, delimiter=',')
    testsPerEuCountry = pd.read_csv(testsPerEuCountryFile, delimiter=',')
    db = csv.writer(
        dbFile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    db.writerow(
        ["Country_Name", "Median_age", "Date_of_first_infected", "Date_of_first_death", "Date_of_peak_of_infected",
         "Date_of_peak_of_deaths", "Infected_to_peak", "Deaths_to_peak", "Population", "Number_of_tests_from_first_test_to_peak_of_infected"])
    numberOfCountries = len(listOfEUmembers.index)
    for index in range(0, numberOfCountries):
        nameofCountry = listOfEUmembers.loc[index, "Country_Name"]
        codeofCountry = listOfEUmembers.loc[index, "Country_Code"]

        medianAgeOfCountry = medianAgePerEuCountry.loc[index, "Median_age"]

        d1 = peakPerEuCountry.loc[index, "Date_of_first_infected"]
        d2 = peakPerEuCountry.loc[index, "Date_of_first_death"]
        d3 = peakPerEuCountry.loc[index, "Date_of_peak_of_infected"]
        d4 = peakPerEuCountry.loc[index, "Date_of_peak_of_deaths"]
        infectedToPeak = peakPerEuCountry.loc[index, "Infected_to_peak"]
        deathsToPeak = peakPerEuCountry.loc[index, "Deaths_to_peak"]

        population = populationPerEuCountry.loc[index, "Population"]

        n1 = testsPerEuCountry.loc[index,
                                   "Number_of_tests_from_first_test_to_peak_of_infected"]
        n2 = testsPerEuCountry.loc[index,
                                   "Number_of_tests_from_first_test_to_peak_of_deaths"]

        db.writerow(
            [nameofCountry, medianAgeOfCountry, d1, d2, d3, d4, infectedToPeak, deathsToPeak, population, n1])
