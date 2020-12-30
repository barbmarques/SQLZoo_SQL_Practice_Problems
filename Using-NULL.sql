# Using NULL Exercises (NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN, COALESCE, CASE)
# Tables:
# teacher: id, dept, name, phone, mobile
# dept: id, name

#The school includes many departments. Most teachers work exclusively for a single department. Some teachers have no department.

#Sometimes NULL values are given if data is unknown or inappropriate. 

# Example: 
--	SELECT code, name
-- FROM party
-- WHERE leader IS NULL

#1. List the teachers who have NULL for their department.

SELECT name
FROM teacher
WHERE dept IS NULL;


#2 Note the INNER JOIN misses the teachers with no department and the departments with no teacher.  (An inner join of A and B gives the result of A intersect B, (i.e., the inner part of a Venn diagram intersection)

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);
           

#3. Use a different JOIN so that all teachers are listed.

SELECT teacher.name AS Teacher, dept.name AS Dept
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id);
 
 
#4. Use a different JOIN so that all departments are listed.

SELECT teacher.name AS Teacher, dept.name AS Dept
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id);


#5. Use COALESCE to print the mobile number. [Use the number '07986 444 2266' if there is no number given] Show teacher name and mobile number or '07986 444 2266'

--  COALESCE can be useful when you want to replace a NULL value with some other value

SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher;


#6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name.  Use the string 'None' where the is no department. 

SELECT teacher.name AS Teacher, COALESCE(dept.name,'None') AS Dept
FROM teacher LEFT JOIN dept ON
	(teacher.dept=dept.id);


#7. Use COUNT to show the number of teachers and the number of mobile phones

SELECT COUNT(name) AS Teachers, COUNT(mobile) AS Mobile_Phones
FROM teacher;


#8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. 

SELECT dept.name, COUNT(teacher.name) AS Number_of_Staff
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
GROUP BY dept.name;



# CASE allows you to return different values under different conditions. If no conditions match (and there is not ELSE) then NULL is returned.

	-- EXAMPLE: 
	--  CASE WHEN condition1 THEN value1
	--       WHEN condition2 THEN value2
	--       ELSE def_value
	--  END

   -- EXAMPLE 2:
   -- SELECT name, population
   -- 		,CASE WHEN population<1000000
   --				 THEN 'small'
   --   			 WHEN population<10000000
   --   			 THEN 'medium'
   --   			 ELSE 'large'
   --		 END
   -- FROM world;
   			

#9. Use CASE to show the name of each teacher followed by 'Sci' if teacher is in dept 1 or 2 and 'Art' otherwise.
   			
SELECT name,
 			CASE WHEN dept=1 or dept=2
 					THEN 'Sci'
 					ELSE 'Art'
 			END
FROM teacher;



#10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. 

SELECT name,
 			CASE WHEN dept=1 or dept=2
 					THEN 'Sci'
 					WHEN dept=3
 					THEN 'Art'
 					ELSE 'None'
 			END
FROM teacher;


 						


