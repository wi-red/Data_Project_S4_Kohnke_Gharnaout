-- 1_creation.sql
-- Creates the physical data model matching the final Looping diagram

CREATE TABLE Team (
    id_team INT PRIMARY KEY,
    Team_Name VARCHAR(100) NOT NULL,
    Region VARCHAR(50)
);

CREATE TABLE Player (
    id_player INT PRIMARY KEY,
    Alias VARCHAR(50) NOT NULL UNIQUE,
    Real_Name VARCHAR(100),
    id_team INT,
    id_mentor INT, 
    FOREIGN KEY (id_team) REFERENCES Team(id_team) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_mentor) REFERENCES Player(id_player) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Tournament (
    id_tournament INT PRIMARY KEY,
    Tourney_Name VARCHAR(150) NOT NULL,
    Start_Date DATE
);

CREATE TABLE Map (
    id_map INT PRIMARY KEY,
    Map_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Registers_For (
    id_team INT,
    id_tournament INT,
    PRIMARY KEY (id_team, id_tournament),
    FOREIGN KEY (id_team) REFERENCES Team(id_team) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_tournament) REFERENCES Tournament(id_tournament) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Match_Event (
    id_match INT PRIMARY KEY,
    id_tournament INT NOT NULL,
    id_team INT NOT NULL, 
    id_map INT NOT NULL,
    Final_Score INT,
    FOREIGN KEY (id_tournament) REFERENCES Tournament(id_tournament) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_team) REFERENCES Team(id_team) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_map) REFERENCES Map(id_map) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Round_number (
    id_match INT,
    id_round INT,
    Winning_Team_ID INT,
    PRIMARY KEY (id_match, id_round),
    FOREIGN KEY (id_match) REFERENCES Match_Event(id_match) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Winning_Team_ID) REFERENCES Team(id_team) ON DELETE SET NULL ON UPDATE CASCADE
);