
# HackerRank SQL Challenge

# Revising the Select Query I

# Query all columns for all American cities in the CITY table with population larger than 100000. The countrycode for America is USA.

SELECT id, name, countrycode, district, population
FROM city
WHERE countrycode = 'USA' 
AND population>100000;


# Query the city names for all American cities with populations larger than 120,000. The countrycode for America is USA

SELECT name
FROM city
WHERE countrycode = 'USA' 
AND population>120000;


# Query all columns (attributes) for every row in the city table. 

SELECT *
FROM city;

# SELECT BY ID Challenge
# Query all columns for a city in CITY with the ID 1661

SELECT id, name, countrycode, district, population
FROM city
WHERE id=1661;

# Query all attributes of every Japanese city in the CITY table. The countrycode for Japan is JPN. 

SELECT id, name, countrycode, district, population 
FROM city
WHERE countrycode = 'JPN';


# Query the names of all the Japanese cities in the CITY table.  The countrycode for Japan is JPN

SELECT name
FROM city
WHERE countrycode = 'JPN';

# WEATHER OBSERVATION STATION 
# Station: id, city, state, lat_n, long_w

# Query a list of CITY and STATE from the STATION table.

SELECT city, state
FROM station;

# Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 

SELECT DISTINCT city
FROM station
WHERE mod(id,2)=0;
