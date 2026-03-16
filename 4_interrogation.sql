-- 4_interrogation.sql
-- Usage Scenario: Esports Data Analyst querying tournament and player stats.

-- ==========================================
-- PROJECTIONS AND SELECTIONS
-- ==========================================

SELECT * FROM Team WHERE Region IN ('NA', 'EMEA');

SELECT Tourney_Name FROM Tournament WHERE Start_Date BETWEEN '2023-01-01' AND '2024-12-31';

SELECT DISTINCT Map_Name FROM Map ORDER BY Map_Name ASC;

SELECT Alias FROM Player WHERE Alias LIKE 'S%';

SELECT id_match, Final_Score FROM Match_Event WHERE Final_Score >= 10 ORDER BY Final_Score DESC;

-- ==========================================
-- AGGREGATION FUNCTIONS (GROUP BY, HAVING)
-- ==========================================

SELECT id_team, COUNT(id_player) AS Total_Players FROM Player GROUP BY id_team;

SELECT Winning_Team_ID, COUNT(id_round) AS Rounds_Won FROM Round_number GROUP BY Winning_Team_ID HAVING COUNT(id_round) > 5;

SELECT id_map, AVG(Final_Score) AS Avg_Score FROM Match_Event GROUP BY id_map;

SELECT id_tournament, COUNT(id_team) AS Team_Count FROM Registers_For GROUP BY id_tournament HAVING COUNT(id_team) > 2;

SELECT id_team, MAX(Final_Score) AS Highest_Score FROM Match_Event GROUP BY id_team;

-- ==========================================
-- JOINS
-- ==========================================

SELECT p.Alias, t.Team_Name FROM Player p INNER JOIN Team t ON p.id_team = t.id_team;

SELECT m.id_match, t.Tourney_Name, map.Map_Name 
FROM Match_Event m 
JOIN Tournament t ON m.id_tournament = t.id_tournament 
JOIN Map map ON m.id_map = map.id_map;

SELECT p1.Alias AS Rookie, p2.Alias AS Mentor 
FROM Player p1 LEFT JOIN Player p2 ON p1.id_mentor = p2.id_player;

SELECT m.id_match, m.Final_Score 
FROM Match_Event m 
JOIN Team t ON m.id_team = t.id_team 
WHERE t.Team_Name = 'Fnatic';

SELECT r.id_round, t.Team_Name 
FROM Round_number r 
JOIN Team t ON r.Winning_Team_ID = t.id_team 
WHERE r.id_match = 1001 AND r.id_round = 1;

-- ==========================================
-- NESTED QUERIES
-- ==========================================

SELECT Alias FROM Player WHERE id_team IN (SELECT id_team FROM Registers_For WHERE id_tournament = 10);

SELECT Team_Name FROM Team t WHERE NOT EXISTS (SELECT 1 FROM Match_Event m WHERE m.id_team = t.id_team);

SELECT id_match, Final_Score FROM Match_Event WHERE Final_Score > ANY (SELECT Final_Score FROM Match_Event WHERE id_team = 2);

SELECT id_match, Final_Score FROM Match_Event WHERE Final_Score >= ALL (SELECT Final_Score FROM Match_Event);

SELECT Team_Name, (SELECT COUNT(*) FROM Match_Event m WHERE m.id_team = t.id_team) AS Total_Matches FROM Team t;