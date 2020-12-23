#Using Nested SELECTS -- includes correlated subqueries

#1. List each country name where the population is larger than that of Russia.

SELECT name
FROM world
WHERE population >
	(SELECT population 
		FROM world
		WHERE name = 'Russia');
		
		
#2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name 
FROM world
WHERE continent = 'Europe'
	AND GDP/population >
		(
		SELECT gdp/population 
		FROM world 
		WHERE name = 'United Kingdom');
		
		
#3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.  


SELECT name, continent
FROM world 
WHERE 
	continent = (SELECT continent FROM world WHERE name = 'Argentina')
	OR 
	continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;


#4.  Which country has a population that is more than Canada but less than Poland?  Show the name and the population

SELECT name, population
FROM world
WHERE population > 
		(SELECT population FROM world WHERE name = 'Canada')
		AND
		population < (SELECT population FROM world WHERE name = 'Poland');
		
		
#5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany. 

SELECT name,CONCAT
		(
			(ROUND
					(population/
							(SELECT population 
							FROM world 
							WHERE name = 'Germany') 
							* 100)),'%') 
							as percentage
FROM world
WHERE continent = 'Europe'; 


# You can use the word ALL before "(SELECT" to apply >=,>,<=,< to an entire list.    

# EXAMPLE: Select the largest country in the world.

SELECT name
FROM world
WHERE population >= ALL(SELECT population FROM world WHERE population>0);

 		-- we include population>0 because some countries have NULL for population
 		

#6 Which countries have a GDP greater than every country in Europe? Give the name only. Some countries may have NUL gdp values.

SELECT name
FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp>0);


#7 Find the largest country (by area) in each continent, show the continent,name and area.

	-- We can refer to values in the outer SELECT within the inner SELECT. We can name the tables so that we can tell the difference between the inner and outer versions.

SELECT continent, name, area
FROM world x 
WHERE area >= ALL (SELECT area FROM world y 
							WHERE y.continent=x.continent
							AND population>0);
							
					-- In other words: select the area from world where the area is >= the area of all 								          areas with the same continent.


#8. List each continent and the name of the country the comes first alphabetically

SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name FROM world y
				WHERE y.continent=x.continent);



   


