-- Datewise likelihood of dying due to covid total cases vs total Death cases in india.

SELECT date, total_cases, total_deaths 
FROM "CovidDeaths"
WHERE location LIKE '%India%';

-- Total Percentage of Deaths in India
SELECT MAX(total_deaths) / AVG(CAST(population AS FLOAT)) * 100 AS death_percentage
FROM "CovidDeaths"
WHERE location LIKE '%India%';

-- Country with the Highest Death Percentage of Population
SELECT location, MAX(total_deaths) / AVG(CAST(population AS BIGINT)) * 100 AS death_percentage
FROM "CovidDeaths"
GROUP BY location 
ORDER BY death_percentage DESC;

-- Total Percentage of Positive COVID Cases in India
SELECT MAX(total_cases) / AVG(CAST(population AS FLOAT)) * 100 AS positive_case_percentage
FROM "CovidDeaths"
WHERE location LIKE '%India%';

-- Total Positive COVID Percentage by Country (Worldwide)
SELECT location, MAX(total_cases) / AVG(CAST(population AS BIGINT)) * 100 AS positive_case_percentage
FROM "CovidDeaths"
GROUP BY location 
ORDER BY positive_case_percentage DESC;

-- Positive Cases by Continent
SELECT location, MAX(total_cases) AS total_case
FROM "CovidDeaths"
WHERE continent IS NULL
GROUP BY location 
ORDER BY total_case DESC;

-- Deaths by Continent
SELECT location, MAX(total_deaths) AS total_death
FROM "CovidDeaths"
WHERE continent IS NULL
GROUP BY location 
ORDER BY total_death DESC;

-- Daily New Cases vs. Hospitalized vs. ICU Patients in India
SELECT date, new_cases, hosp_patients, icu_patients
FROM "CovidDeaths"
WHERE location LIKE '%India%';

-- Join Country wise age 65 or greater

SELECT "CovidDeaths".date, "CovidDeaths".location, "CovidVaccinations".aged_65_older 
FROM "CovidDeaths"
JOIN "CovidVaccinations" 
ON "CovidDeaths".iso_code = "CovidVaccinations".iso_code 
AND "CovidDeaths".date = "CovidVaccinations".date;

--Countrywise Total Vaccinated Persons
SELECT "CovidDeaths".location AS Country, MAX("CovidVaccinations".people_fully_vaccinated) AS total_fully_vaccinated
FROM "CovidDeaths"
JOIN "CovidVaccinations" 
ON "CovidDeaths".iso_code = "CovidVaccinations".iso_code 
AND "CovidDeaths".date = "CovidVaccinations".date
GROUP BY "CovidDeaths".location;


