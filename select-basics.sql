# SQLZoo "WORLD" table of countries. Columns include: name, continent, area, population, gdp

# 1. WHERE:  Show the population of Germany

SELECT population 
FROM world
  WHERE name = 'Germany'	 # 83,149,300
  
  
# 2.  IN:  The word IN allows us to check if an item is in a list
  
SELECT name, population
FROM world
WHERE name IN ('Sweden','Norway','Denmark');  # Denmark - 5,822,763, Norway - 5,367,580, Sweden - 10,338,368


# 3.  BETWEEN - allows for range checking (the range is inclusive -- includes the values given as boundaries)
# Show the country and the area for countries with an area between 200,000 and 250,000

SELECT name, area
FROM world
WHERE area BETWEEN 200,000 AND 250,000;  #Belarus 207,600, Ghana 238,533, Guinea 245,857, Guyana 214,969, Laos 236,800, Romania 238,391, Uganda 241,550, United Kingdom 242,900


# 4  Show the country and population for countries with a population at least 1,000,000 but not more than 1,250,000

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 and 1250000;



# 5.  Show name and population of countries with names beginning with "Al"

SELECT name, population
FROM world
WHERE name LIKE "Al%";


# 6.  Show countries that end in A or L

SELECT name
FROM world
WHERE name LIKE "%a"
Or name LIKE "%l";


# 7.  Show countries in Europe with names that are 5-letters long

SELECT name, length(name)
FROM world
WHERE length(name)=5 and region='Europe';


# 8.  Show countries with an area larger than 50000 and a population smaller than 10000000

SELECT name, area, population
FROM world 
WHERE area > 50000 AND population < 10000000;


#9. Show the population density of China, Australia, Nigeria and France

SELECT name, population/area
FROM world
WHERE name IN ('China', 'Australia', 'Nigeria', 'France');




 