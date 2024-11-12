# COVID-19 Data Analysis

This project involves analyzing COVID-19 data from various sources to understand key trends, such as death rates, vaccination rates, and positive cases. The analysis is based on publicly available datasets from "CovidDeaths" and "CovidVaccinations." The project includes SQL queries used to extract, analyze, and visualize data, and is aimed at providing insights into the pandemic's impact across different regions.

## Project Overview

The goal of this project is to conduct SQL-based analysis on COVID-19 data to:

- Analyze the likelihood of dying due to COVID-19 in India.
- Calculate total percentages of death and vaccination across different countries.
- Compare COVID-19 cases and vaccination rates globally.
- Assess country-specific data such as total vaccinated persons and death percentages.

## SQL Queries Used in the Project

```sql
SELECT date, total_cases, total_deaths 
FROM "CovidDeaths"
WHERE location LIKE '%India%';

2. Total Percentage of Deaths All Over India
This query calculates the percentage of deaths in India relative to the population.
sql
Copy code
SELECT MAX(total_deaths) / AVG(CAST(population AS FLOAT)) * 100 
FROM "CovidDeaths" 
WHERE location LIKE '%India%';

3. Country with Highest Death Percentage as a % of Population
This query returns the country with the highest death percentage in relation to its population.
sql
Copy code
SELECT location, (MAX(total_deaths) / AVG(CAST(population AS BIGINT)) * 100) AS percentage 
FROM "CovidDeaths" 
GROUP BY location 
ORDER BY percentage DESC;

4. Total COVID Positive Cases in India
This query calculates the total COVID positive cases in India relative to the population.
sql
Copy code
SELECT MAX(total_cases) / AVG(CAST(population AS FLOAT)) * 100 
FROM "CovidDeaths" 
WHERE location LIKE '%India%';

5. Total Positive COVID % Cases in the World
This query calculates the percentage of COVID positive cases across the world.
sql
Copy code
SELECT location, MAX(total_cases) / AVG(CAST(population AS BIGINT)) * 100 AS percentagepositive 
FROM "CovidDeaths" 
GROUP BY location 
ORDER BY percentagepositive DESC;

6. Continent-wise Positive Cases
This query shows the total positive COVID cases by continent.
sql
Copy code
SELECT location, MAX(total_cases) AS total_cases 
FROM "CovidDeaths"
WHERE Continent IS NULL 
GROUP BY location 
ORDER BY total_cases DESC;

7. Continent-wise Deaths
This query shows the total deaths by continent.
sql
Copy code
SELECT location, MAX(total_deaths) AS total_death 
FROM "CovidDeaths"
WHERE Continent IS NULL 
GROUP BY location 
ORDER BY total_death DESC;

8. Daily New Cases vs Hospitalized vs ICU Patients in India
This query retrieves daily new cases, hospitalized patients, and ICU patients in India.
sql
Copy code
SELECT date, new_cases, hosp_patients, icu_patients 
FROM "CovidDeaths" 
WHERE location LIKE '%India%';

9. Countrywise Total Vaccinated Persons
This query retrieves the total number of fully vaccinated people by country.
sql
Copy code
SELECT "CovidDeaths".location AS Country, 
      MAX("CovidVaccinations".people_fully_vaccinated)
FROM "CovidDeaths"
JOIN "CovidVaccinations" 
ON "CovidDeaths".iso_code = "CovidVaccinations".iso_code 
AND "CovidDeaths".date = "CovidVaccinations".date
GROUP BY "CovidDeaths".location;
Screenshots of Outputs

Some screenshots showing the results of the SQL queries are in Folder Charts

Project Setup
Prerequisites:
PostgreSQL or any SQL-based RDBMS for running the queries.
Access to the "CovidDeaths" and "CovidVaccinations" datasets.

