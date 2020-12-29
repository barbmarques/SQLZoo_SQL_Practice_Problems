#1.  What join statement would you use to find the stadium where Dimitris Salpingidis scored?

FROM game JOIN goal ON (game.id=goal.matchid)

#2 Indicate the list of column names that may be used in the SELECT line if you JOIN tables goal and eteam.

# matchid, teamid, player, gtime, id, teamname, coach

#3 Show players, their team and the amount of goals they scored against Greece(GRE)

SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON (game.matchid = goal.id)
WHERE (team1 = "GRE" OR team2 = "GRE")
AND teamid != 'GRE'
GROUP BY player, teamid;
 
 #5. Show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
 
SELECT DISTINCT player, teamid
FROM game JOIN goal ON (game.matchid=goal.id)
WHERE stadium = 'National Stadium, Warsaw'
AND (team1='POL' OR team2='POL')
AND teamid != 'POL';


#6. Show the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).

SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON (game.matchid=goal.id)
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND ((teamid = team2 AND team1 != 'ITA') OR (teamid = team1 AND team2 != 'ITA'));

#7

SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid=id
GROUP BY teamname
HAVING COUNT (*) < 3;

