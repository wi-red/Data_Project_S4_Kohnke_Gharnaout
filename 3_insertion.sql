-- 3_insertion.sql
-- Generated via AI prompt for Esports Database

INSERT INTO Team (id_team, Team_Name, Region) VALUES
(1, 'Fnatic', 'EMEA'), 
(2, 'Sentinels', 'NA'), 
(3, 'Paper Rex', 'APAC');

INSERT INTO Player (id_player, Alias, Real_Name, id_team, id_mentor) VALUES
(101, 'Boaster', 'Jake Howlett', 1, NULL),
(102, 'TenZ', 'Tyson Ngo', 2, NULL),
(103, 'something', 'Ilya Petrov', 3, 101);

INSERT INTO Tournament (id_tournament, Tourney_Name, Start_Date) VALUES
(10, 'Champions 2024', '2024-08-01'), 
(11, 'Masters Madrid', '2024-03-14');

INSERT INTO Map (id_map, Map_Name) VALUES
(1, 'Ascent'), 
(2, 'Bind'), 
(3, 'Lotus');

INSERT INTO Registers_For (id_team, id_tournament) VALUES
(1, 10), 
(2, 10), 
(3, 11);

INSERT INTO Match_Event (id_match, id_tournament, id_team, id_map, Final_Score) VALUES
(1001, 10, 1, 1, 13), 
(1002, 10, 2, 2, 11);

INSERT INTO Round_number (id_match, id_round, Winning_Team_ID) VALUES
(1001, 1, 1), 
(1001, 2, 1), 
(1002, 1, 2);