#. Show Nobel prizes for 1950

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;


#. Show who won the 1962 prize for Literature.

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';

#Show the year and subject that wom 'Albert Einstein' his prize.

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';


# Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner
FROM nobel
WHERE subject = 'peace'
AND yr LIKE '20%';


# Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
AND yr BETWEEN 1980 AND 1989;


# Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama

SELECT yr, subject, winner
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');


# Show the winners with the first name John

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'


# Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' and yr = 1980) 
OR (subject = 'chemistry' and yr = 1984);


# Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 
	AND subject 
	NOT IN ('Chemistry', 'Medicine');
	
	

# Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine'
AND yr < 1910)
OR
(subject = 'literature' AND yr >= 2004);


#  Show the winners' names beginning with C and ending in n

SELECT winner
FROM nobel
WHERE winner LIKE 'C%n';


#. How many Chemistry awards were given between 1950 and 1960

SELECT Count(subject)
FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 AND 1960;


#  Show the amount of years where no Medicine awards were given.

SELECT COUNT(DISTINCT yr)
FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');


# Show the year when neither a Physics or Chemistry award was given

SELECT yr
FROM nobel
WHERE yr
	NOT IN (SELECT yr FROM nobel WHERE subject IN ('Chemistry', 'Physics'))

#QUIZZES 


#Select the name of  ountries beginning with U.

SELECT name
FROM world
WHERE name LIKE 'U%';

#Select the population of the United Kingdom

SELECT population 
FROM world
WHERE name = 'United Kingdom';

#Select the continent for France

SELECT continent
FROM world
WHERE name = 'France';

#Find the name and population of countries in Europe and Asia
SELECT name, population
FROM world
WHERE continent IN ('Europe','Asia');




*** CHALLENGE PROBLEMS ****


# Find all details of the prize won by PETER GRÜNBERG

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'Peter Grünberg';


# Find all details of the prize won by EUGENE O'NEILL

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'Eugene O''Neill'


# List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner 


# Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.


SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY  subject IN ('Physics','Chemistry'),subject,winner
 
 #. ^ ^ ^ Last line:  SUBJECT IN converts to a Boolean value of 0 or 1. Physics and Chemistry are ordered as "1", so they are put at the end of the list, the next level orders by subject and finally by winner.






