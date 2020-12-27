# PRACTICE WITH SELECT OPERATIONS:
 -- concatenate columns
 -- like
 -- union
 -- apostrophe
 -- full text search
 -- column name
 -- equi join
 -- column name with spaces
 -- null
 
# CONCATENATE COLUMNS - CONCAT
 
 SELECT CONCAT (region, name). # would have to add ' ' to put a space between the two columns
 FROM bbc; 
 
# LIKE - The like command allows "wild cards". % may be use to match string, _ will match any single character
 
#Ex:  Show countries beginning with Z
 
 SELECT name
 FROM bbc
 WHERE name LIKE 'Z%';
 
 
# UNION:  you can enter a number of SELECT statements separated by the UNION key word

SELECT name 
	FROM bbc WHERE name LIKE 'Z%'
UNION
SELECT name
	FROM world WHERE name LIKE 'So%';
	

# APOSTROPHE -
# To include a statement with a word containing an apostrophe, such as Cote d'Ivoire

SELECT * 
FROM world
WHERE name='Cote d''Ivoire';

		# Or Tom's Book:

		SELECT 'Tom''s Book';


# FULL TEXT SEARCH:  Ex: find a specific word in any column of the table -- the word you are searching for should be single-quoted and placed between two wild cards

SELECT name
FROM world
WHERE name LIKE '%the%';


# COLUMN NAME: Use AS to specify a column name

SELECT region, SUM(Population) AS Total_Population
FROM bbc
GROUP BY region;


# EQUI JOIN - can be used to join two tables with the same name

# COLUMN NAMES WITH SPACES -- use back ticks to access columns where the name contains a space 

# NULL -- the null value indicates missing or unknown data.  The phrase "IS NULL" is used to select these values

SELECT name,gdp
FROM world
WHERE gdp IS NULL










