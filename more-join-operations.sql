# More JOIN Operations

# This database contains three tables:
   -- MOVIE: id, title, yr, director, budget, gross
   -- ACTOR: id, name
   -- CASTING: movieid (from movie table), actorid (from actor table), ord (the ordinal position of the actor in the cast list)
   
#1.  List the id and title of films that were released in 1962.

SELECT id, title
FROM movie
WHERE yr = 1962;


#2. Show the year that Citizen Kane was released

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';  #1941


#3. List all of the Star Trek movies, include the id, title and year. (All of these movies include the words Star Trek in the title). Order the results by year. 

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;


#4. What id number does the actor Glenn Close have?

SELECT id
FROM actor
WHERE name='Glenn Close';  #140


#5. What is the id of the film Casablanca?

SELECT id
FROM movie 
WHERE title='Casablanca';  #11768


#6.  Obtain the cast list for 'Casablanca'.  Use the movie ID from the last question.

SELECT name
FROM actor JOIN casting ON (actor.id=casting.actorid)
WHERE movieid = 11768;


#7 Obtain the cast list for the film Alien.

SELECT name 
FROM casting JOIN movie ON (casting.movieid=movie.id) 
JOIN actor ON (casting.actorid=actor.id)
WHERE title='Alien';


#8 List the films in which Harrison Ford has appeared.

SELECT title
FROM casting JOIN movie ON (casting.movieid=movie.id)
JOIN actor ON (casting.actorid=actor.id)
WHERE name = 'Harrison Ford';


#9 List the films where Harrison Ford has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1, then this actor is in the starring role]

SELECT title
FROM casting JOIN movie ON (casting.movieid=movie.id)
JOIN actor ON (casting.actorid=actor.id)
WHERE name = 'Harrison Ford'
AND ord != 1;


#10. List the films together with the leading star for all 1962 films.

SELECT title, name
FROM casting JOIN movie ON (casting.movieid=movie.id) 
JOIN actor ON (casting.actorid=actor.id)
WHERE yr = 1962
AND ord = 1;


#11. Which were the busiest years for Rock Hudson? Show the year and the number of movies he made each year for any year in which he made more than two movies.

SELECT yr, COUNT(movieid)
FROM casting JOIN movie ON (casting.movieid=movie.id)
JOIN actor ON (casting.actorid=actor.id)
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(movieid) > 2;


#12. List the film title and the leading actor for all of the films Julie Andrews played in. 

-- this subquery gives us a list of movieids of all Julie Andrews movies
#	SELECT movieid FROM casting
#	WHERE actorid IN (
#		SELECT id FROM actor WHERE name = 'Julie Andrews')
				
--  this subquery gives us a list of movie titles with Julie Andrews
#	SELECT title
#	FROM movie 
#	WHERE id IN (
#	 SELECT movieid FROM casting
#		WHERE actorid IN (
#			SELECT id FROM actor WHERE name = 'Julie Andrews')
#		   ) 
		
SELECT title, name
FROM movie JOIN casting ON (movie.id=casting.movieid
								AND ord =1)
		   JOIN actor ON (casting.actorid=actor.id)
WHERE movie.id IN (SELECT movieid FROM casting
				WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews')
 		   			); 

#13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE ord =1
GROUP BY name ASC
HAVING COUNT(name) >=15;


#14.  List the films released in the year 1978, ordered by the number of actors in the cast, then by title

SELECT DISTINCT title, COUNT(actorid) AS Size_of_Cast
FROM movie JOIN casting ON (movie.id=casting.movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC,title;


#15.  List all the people who have worked with Art Garfunkel

-- this query selects all movies that Art Garfunkel is in:
--	SELECT movieid
--	FROM casting WHERE
--  		(SELECT id 
--  			FROM actor
--  				WHERE name = 'Art Garfunkel')

-- This query lists all people who are in movies from the above query

--	SELECT movieid
--	FROM casting WHERE
--  		(SELECT id 
--  			FROM actor
--  				WHERE name = 'Art Garfunkel')


SELECT name,actorid
FROM actor JOIN casting ON (actor.id=casting.actorid)
WHERE actorid IN
(SELECT actorid FROM casting WHERE movieid IN
(SELECT casting.movieid FROM casting WHERE actor.id IN
(SELECT actor.id FROM actor WHERE actor.name = 'Art Garfunkel')))
))