# SELECT from world Practice

# Show the name for the countries that have a population of at least 200 million.

use world;
select database();

SELECT name
FROM country
WHERE population >= 200000000;



# Show the name and per capita GDP for countries with a poplation of at least 200 million

SELECT name, gdp/population
from world
where population >= 200000000;


#Show the name and population in millions for the countries of the continent 'South America'.

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';




# Show the name and population for France, Gernmany and Italy

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');



# Show the countries which have a name that includes the word 'United'

SELECT name
FROM world 
WHERE name LIKE '%united%';



# Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.  Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000;



# Exclusive OR. (XOR).  Show the countries that are big by area (more than 3 million) OR big by population (more than 250 million), but not both.  Show name, population and area.

SELECT name, population, area
FROM world 
WHERE area > 3000000 
XOR population > 250000000;



# Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.  

SELECT name, round(population/1000000, 2), round(gdp/1000000000,2)
FROM world
WHERE continent = 'South America';



# Show the name and per-capita GDP for those countries with a GDP of at least one trillion.  Round this value to the nearest 1000.    (A negative number rounds to the left of the decimal. )

SELECT name, round(gdp/population,-3) 
FROM world
WHERE gdp >=1000000000000;


#Show the name and capital where the name and the capital have the same number of characters.You can use the LENGTH function to find the number of characters in a string


SELECT name, capital 
FROM world
WHERE length(name) = length(capital);



# Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
	-- You can use the function LEFT to isolate the first character.
	-- You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital;


# Find the country that has all the vowels and no spaces in its name.
	-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
	
SELECT name
FROM world
WHERE name LIKE '%a%'
	AND name LIKE '%e%'
	AND name LIKE '%i%'
	AND name LIKE '%o%'
	AND name LIKE '%u%'
	AND name NOT LIKE '% %';
