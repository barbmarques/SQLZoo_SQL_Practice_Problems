#Sum and Count 
#This is practice with aggregate functions such as COUNT, SUM, MAX and AVG. Aggregate function means that it takes in many values and delivers just one value. These functions are e ven more useful when used with the GROUP BY clause).


#DISTINCT: By default the result of a SELECT may contain duplicate rows. We can remove these duplicates using the DISTINCT key words

#ORDER BY: Order by permits us to see the result of a SELECT in any particular order -- ASC or DESC 

#1. Select the TOTAL population and the TOTAL GDP of Europe

SELECT SUM(population) AS "Total Pop", SUM(gdp) AS "Total GDP"
FROM bbc
WHERE region='Europe';


#2. Show all the regions in BBC

SELECT DISTINCT region
FROM bbc;

#3. Show the name and population for each country with a population of more than 100000000. Show countries in descending order of population.

SELECT name, population
FROM bbc
WHERE population > 100000000
ORDER BY population DESC;


#SUM AND COUNT QUIZ

#1 SHOW THE SUM OF POPULATION OF ALL COUNTRIES IN 'EUROPE'

SELECT SUM(Population)
FROM bbc
WHERE region = 'Europe';

#2. Show the number of countries with population smaller than 150,000

SELECT COUNT(name)
FROM bbc
WHERE population < 150000;

#3 THE core SQL aggregate functions are: AVG(), COUNT(), MAX(), MIN(), SUM()

#5 Show the average population of Poland, Germany and Denmark

SELECT AVG(population)
FROM bbc
WHERE name IN ('Poland', 'Germany', 'Denmark');


#6 Show the population density of each region

SELECT region, SUM(population)/SUM(area) as Density
FROM bbc
GROUP BY region;


#7 Show the name and population density of the country with the largest population

SELECT name, population/area AS density
FROM bbc
WHERE population = (SELECT MAX(population) FROM bbc); 








