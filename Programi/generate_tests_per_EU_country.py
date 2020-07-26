import csv
import pandas as pd
import math

with open('./../Podatki/List_of_EU_members.csv') as listOfEUmembersFile:
    listOfEUmembers = pd.read_csv(
        listOfEUmembersFile, delimiter=',')

    with open('./../Podatki/Peak_per_country.csv') as peakPerEUcountryFile:
        peakPerEUcountry = pd.read_csv(
            peakPerEUcountryFile, delimiter=',')
        with open('./../Podatki/Tests_per_EU_country.csv', 'a') as testsPerEUCountryFile:

            testsPerEUCountry = csv.writer(
                testsPerEUCountryFile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            testsPerEUCountry.writerow(
                ["Country_Name", "Number_of_tests_from_first_test_to_peak_of_infected", "Number_of_tests_from_first_test_to_peak_of_deaths"])

            for index in range(0, 28):
                row = listOfEUmembers.loc[index]
                nameOfCountry = row[0]

                cumulativeTestsToPeakOfInfected = 0
                cumulativeTestsToPeakOfDeaths = 0

                doNotAddToCumInfected = False
                doNotAddToCumDeaths = False

                dateOfPeakOfInfected = peakPerEUcountry.loc[index,
                                                            "Date_of_peak_of_infected"]
                dateOfPeakOfDeaths = peakPerEUcountry.loc[index,
                                                          "Date_of_peak_of_deaths"]
                with open('./../Podatki/EHI_data/Reference_hospitalization_all_locs.csv') as EHIfile:
                    dataEHI = pd.read_csv(EHIfile, delimiter=',', usecols=[
                        'location_name', 'date', 'total_tests'])

                    nrows = len(dataEHI.index)
                    for index2 in range(0, nrows):
                        countryNameInDataFile = dataEHI.loc[index2,
                                                            "location_name"]
                        date = dataEHI.loc[index2, "date"]

                        totalTests = dataEHI.loc[index2, "total_tests"]

                        if countryNameInDataFile == nameOfCountry and not doNotAddToCumInfected and not math.isnan(totalTests):
                            cumulativeTestsToPeakOfInfected += totalTests

                        if countryNameInDataFile == nameOfCountry and not doNotAddToCumDeaths and not math.isnan(totalTests):
                            cumulativeTestsToPeakOfDeaths += totalTests

                        if countryNameInDataFile == nameOfCountry and dateOfPeakOfDeaths == date:
                            doNotAddToCumDeaths = True
                        if countryNameInDataFile == nameOfCountry and dateOfPeakOfInfected == date:
                            doNotAddToCumInfected = True

                print(nameOfCountry, int(cumulativeTestsToPeakOfInfected), int(cumulativeTestsToPeakOfDeaths))
                testsPerEUCountry.writerow(
                    [nameOfCountry, int(cumulativeTestsToPeakOfInfected), int(cumulativeTestsToPeakOfDeaths)])
                index += 1
