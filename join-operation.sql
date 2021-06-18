# JOIN allows you to use data from two or more tables T
#

#1.  Show the matchid and player name for all goals scored by Germany.  (The * is used to indicate all columns).

SELECT matchid, player
FROM goal
WHERE teamid = 'GER';


#2.  Show the two teams and location for game 1012.

SELECT id, stadium, team1, team1
FROM game
WHERE id = 1012;


# Table game: id, mdate, stadium, team1, team2
# Table goal: matchid, teamid, player, gtime
# Table eteam: id, teamname, coach

# Combine the above two queries (from two tables) into one single query using join's

-- SELECT *
-- FROM game JOIN goal ON (id=matchid)

# FROM - says to merge the data in "game" and "goal"
# ON - says which rows in "game" go with which rows in "goal"

			-- we could be more specific and say:
			-- ON (game.id=goal.matchid)
			
			
#3. Show the player, team id, stadium and mdate for every German goal. 

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER';

#4.  Show the team1, team2 and player for every goal scored by a player called Mario. 

SELECT team1,team2, player
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%';

#5 The table "eteam" gives deails of every national team including the coach.  Show player, team, coach and goal time for all goals scored in the first 10 minutes.

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid=eteam.id)
WHERE gtime <=10;

#6. List the dates of matches and name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1=eteam.id)
WHERE coach = 'Fernando Santos';

#7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.

SELECT player
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE stadium='National Stadium, Warsaw';


#8. Show the name of all players who scored a goal against Germany

SELECT DISTINCT player
FROM game JOIN goal ON(game.id=goal.matchid)
WHERE teamid != 'GER' 
AND
(team1 = 'GER' or team2 = 'GER');


#9 Show teamname and total number of goals scored. (COUNT and GROUP BY)

SELECT teamname, COUNT(gtime) as Goals_Scored
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
GROUP BY teamname;

#10 Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(gtime) as Goals_Scored
FROM game JOIN goal ON(game.id=goal.matchid)
GROUP BY stadium;

#11 For every match involving 'POL' show the matchid, date, and number of goals scored

SELECT matchid, mdate, COUNT(gtime) as Goals_Scored
FROM game JOIN goal ON(game.id=goal.matchid)
WHERE (team1='POL' OR team2='POL')
GROUP BY matchid, mdate;

#12 For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(gtime) as Goals_Scored
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;


#13 List every match by match date with the goals scored by each team.  This will use "CASE WHEN" 

SELECT mdate,team1,
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1, 
  team2, 
  CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2
  FROM game JOIN goal ON matchid = id

