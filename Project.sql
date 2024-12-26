CREATE DATABASE Sports_Teams;
USE Sports_Teams;

CREATE TABLE Leagues (
  league_id INT PRIMARY KEY,
  league_name VARCHAR(255) NOT NULL,
  league_type VARCHAR(20) NOT NULL CHECK (league_type IN ('International', 'Domestic'))
);

CREATE TABLE Teams (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(100) NOT NULL,
  team_abbreviation VARCHAR(100) NOT NULL,
  league_id INT,
  FOREIGN KEY(league_id) REFERENCES Leagues(league_id),
  coach VARCHAR(100),
  home_stadium VARCHAR(100),
  tournament VARCHAR(100)
);

CREATE TABLE Players (
  player_id INT PRIMARY KEY,
  player_name VARCHAR(50) NOT NULL,
  jersey_no SMALLINT,
  age SMALLINT,
  player_role VARCHAR(20),
  team_id INT,
  FOREIGN KEY(team_id) REFERENCES Teams(team_id),
  matches_played VARCHAR(200)
);

CREATE TABLE Matches (
  match_id INT PRIMARY KEY,
  match_date DATE NOT NULL,
  team1_id INT NOT NULL,
  team2_id INT NOT NULL,
  match_type VARCHAR(20) NOT NULL CHECK (match_type IN ('Test', 'ODI', 'T20'))
);

CREATE TABLE Scores (
  player_name VARCHAR(200),
  test_runs INT,
  ODI_runs INT,
  T20_runs INT,
  international_runs INT,
  wickets INT
);


INSERT INTO Leagues (league_id,league_name,league_type) VALUES
(101,"ICC Cricket World Cup","International"),
(102,"ICC T20 World Cup","International"),
(103,"Asia Cup","International"),
(104,"Ashes Series","International"),
(105,"Champions Trophy","International"),
(106,"Big Bash League (BBL)","Domestic"),
(107,"Pakistan Super League (PSL)","Domestic"),
(108,"Caribbean Premier League (CPL)","Domestic"),
(109,"Bangladesh Premier League (BPL)","Domestic"),
(701,"Indian Premier League (IPL)","Domestic"),
(111,"SA20","Domestic"),
(112,"Lanka Premier League (LPL)","Domestic"),
(113,"Super Smash","Domestic"),
(114,"T20 Blast","Domestic"),
(115,"Ranji Trophy","Domestic");

INSERT INTO Teams (team_id, team_name, team_abbreviation, league_id, coach, home_stadium, tournament) VALUES
(1, 'Board of Control for Cricket in India', 'BCCI', 101, 'Ravi Shastri', 'Narendra Modi Stadium - Ahmedabad, Gujarat', 'International'),
(2, 'Cricket Australia', 'CA', 102, 'Andrew McDonald', 'Melbourne Cricket Ground - Melbourne', 'International'),
(3, 'Afghanistan Cricket Board', 'ACB', 103, 'Jonathan Trott', 'Kabul International Cricket Stadium - Kabul', 'International'),
(4, 'England and Wales Cricket Board', 'ECB', 104, 'Matthew Mott', 'Lord\'s Cricket Ground - London NW8', 'International'),
(5, 'Bangladesh Cricket Board', 'BCB', 105, 'Phil Simmons', 'Sher-e-Bangla National Cricket Stadium - Dhaka, Bangladesh', 'International'),
(6, 'New Zealand Cricket', 'NZC', 106, 'Gary Stead', 'Auckland - New Zealand', 'International'),
(7, 'Pakistan Cricket Board', 'PCB', 103, 'Gary Kirsten', 'National Stadium - Karachi', 'International'),
(8, 'Cricket South Africa', 'CSA', 103, 'Rob Walter', 'SuperSport Park - South Africa', 'International'),
(9, 'Sri Lanka Cricket', 'SLC', 103, 'Sanath Jayasuriya', 'Pallekele International Cricket Stadium - Kandy', 'International'),
(10, 'Cricket West Indies', 'CWI', 103, 'Daren Sammy', 'Kensington Oval - Barbados', 'International'),
(11, 'Chennai Super Kings', 'CSK', 701, 'Stephen Fleming', 'M.A. Chidambaram Stadium, Chennai', 'IPL'),
(12, 'Delhi Capitals', 'DC', 701, 'Hemang Badani', 'Arun Jaitley Cricket Stadium, Delhi', 'IPL'),
(13, 'Gujarat Titans', 'GT', 701, 'Ashish Nehra', 'Narendra Modi Stadium, Motera, Ahmedabad', 'IPL'),
(14, 'Kolkata Knight Riders', 'KKR', 701, 'Chandrakant Pandit', 'Eden Gardens, Kolkata', 'IPL'),
(15, 'Lucknow Super Giants', 'LSG', 701, 'Justin Langer', 'Ekana Cricket Stadium, Lucknow', 'IPL'),
(16, 'Mumbai Indians', 'MI', 701, 'Mahela Jayawardene', 'Wankhede Stadium, Mumbai', 'IPL'),
(17, 'Punjab Kings', 'PBKS', 701, 'Ricky Ponting', 'Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur', 'IPL'),
(18, 'Rajasthan Royals', 'RR', 701, 'Rahul Dravid', 'Sawai Mansingh Stadium, Jaipur', 'IPL'),
(19, 'Royal Challengers Bangaluru', 'RCB', 701, 'Andy Flower', 'M. Chinnaswamy Stadium, Bengaluru', 'IPL'),
(20, 'Sunrisers Hyderabad', 'SRH', 701, 'Daniel Vettori', 'Rajiv Gandhi International Cricket Stadium, Hyderabad', 'IPL');

INSERT INTO Players (player_id,player_name,jersey_no,age,player_role,team_id,matches_played) VALUES
(3051,"Shikhar Dhawan",42,39,"Batsman",01,"269 international matches"),
(3052,"Rohit Sharma",45,37,"Batsman",16,"257 IPL matches"),
(3053,"Virat Kohli",18,36,"Batsman",01,"539 international matches"),
(3054,"Shreyas Iyer",41,29,"Batsman",14,"116 IPL matches"),
(3055,"KL Rahul",01,32,"Batsman",15,"132 IPL matches"),
(3056,"Rishabh Pant",17,26,"WK-Batsman",01," 146 international matches"),
(3057,"MS Dhoni",7,43,"WK-Batsman",11,"264 IPL matches"),
(3058,"Hardik Pandya",33,31,"Batting Allrounder",01,"215 international matches"),
(3059,"Ravindra Jadeja",8,35,"Bowling Allrounder",11,"240 IPL matches"),
(3060,"Bhuvineshvar Kumar",15,34,"Bowler",01,"229 international matches"),
(3061,"Jasprit Bumrah",93,30,"Bowler",01,"196 international matches"),
(3062,"Yuzivendra Chahal",3,34,"Bowler",18,"160 IPL matches"),
(3063,"Mohammed Shami",11,34,"Bowler",01,"188 international matches");

INSERT INTO Matches (match_id,match_date,team1_id,team2_id,match_type) VALUES
(201, "2024-01-15", 1, 8, "Test"),
(202, "2024-02-10", 3, 9, "ODI"),
(203, "2024-03-05", 6, 3, "T20"),
(204, "2024-03-20", 4, 2, "Test"),
(205, "2024-04-01", 1, 5, "ODI"),
(206, "2024-05-15", 16, 12, "T20"),
(207, "2024-05-17", 13, 18, "T20"),
(208, "2024-05-19", 15, 13, "T20"),
(209, "2024-05-20", 12, 14, "T20"),
(210, "2024-05-22", 11, 17, "T20");

INSERT INTO Scores (player_name,test_runs,ODI_runs,T20_runs,international_runs,wickets) VALUES 
("Virat Kohli", 8676, 13100, 4508, 26284, 8),
("Joe Root", 11612, 6207, 893, 18712, 33),
("Steve Smith", 9168, 4939, 804, 14911, 29),
("Kane Williamson", 8124, 6550, 2502, 17176, 37),
("David Warner", 8181, 6300, 3000, 17481, 4),
("Babar Azam", 4250, 5600, 3484, 13334, 0),
("Ben Stokes", 5835, 2924, 358, 9117, 198),
("Rohit Sharma", 3500, 10500, 4000, 18000, 8),
("Shakib Al Hasan", 4500, 7400, 2500, 14400, 450),
("Rashid Khan", 120, 1300, 2100, 3520, 510),
("Quinton de Kock", 4000, 6000, 2200, 12200, 5),
("Travis Head", 4700, 2600, 750, 8050, 15),
("Shubman Gill", 1800, 2000, 900, 4700, 2),
("Mohammad Rizwan", 1500, 3000, 3300, 7800, 2),
("Jos Buttler", 3000, 4000, 3100, 10100, 10),
("Marnus Labuschagne", 4600, 1000, 100, 5700, 5),
("Jasprit Bumrah", 50, 150, 65, 265, 350),
("Pat Cummins", 1000, 400, 200, 1600, 400),
("Shaheen Afridi", 150, 300, 50, 500, 250),
("Trent Boult", 900, 1000, 500, 2400, 600);

DELIMITER //
CREATE PROCEDURE GetTeamsByLeagues(IN L_league_type VARCHAR(100))
BEGIN
	SELECT  league_name,league_type,team_id,team_name,team_abbreviation,tournament
	FROM Leagues 
	INNER JOIN Teams
	ON Leagues.league_id = Teams.league_id
	WHERE Leagues.league_type = L_league_type;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetplayersByteamname(IN t_team_name VARCHAR(200))
BEGIN
	SELECT player_name 
	FROM Players
	JOIN Teams 
	ON Players.team_id = teams.team_id
	WHERE teams.team_name = t_team_name;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetScoresByplayername(IN s_player_name VARCHAR(200))
BEGIN
	SELECT player_name, 
	(test_runs + ODI_runs + T20_runs) AS total_runs 
	FROM Scores 
	WHERE Scores.player_name = s_player_name;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetTeamsByleagueid(IN t_league_id INT)
BEGIN
	SELECT team_name 
	FROM Teams 
	WHERE Teams.league_id = t_league_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetmatchesByteamname(IN team1 VARCHAR(100),team2 VARCHAR(100))
BEGIN
	SELECT match_id, match_date,t1.team_name AS team1_name,t2.team_name AS team2_name
	FROM Matches m
	JOIN Teams t1 ON m.team1_id = t1.team_id 
	JOIN Teams t2 ON m.team2_id = t2.team_id
	WHERE t1.team_name = team1 OR t2.team_name = team2;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetplayersByage(IN P_age INT)
BEGIN
	SELECT p.player_name, p.age, t.team_name 
	FROM Players p
	JOIN Teams t ON p.team_id = t.team_id
	WHERE p.age < P_age;
END ;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetTotalplayers(IN t_team_name VARCHAR(200))
BEGIN
	SELECT COUNT(*) AS total_players 
	FROM Players p
	JOIN Teams t ON p.team_id = t.team_id
	WHERE t.team_name = t_team_name;
END ;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetHighestrunscorer(IN p_scores INT)
BEGIN
	SELECT player_name, 
       (test_runs + ODI_runs + T20_runs) AS total_runs 
	FROM Scores 
	ORDER BY total_runs DESC 
	LIMIT p_scores;
END ;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetcoachByteams(IN T_coach VARCHAR(100))
BEGIN
	SELECT coach, team_name 
	FROM Teams 
	WHERE coach = T_coach;
END ;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GettoatlBymatches(IN m_type VARCHAR(200))
BEGIN
	SELECT match_type, COUNT(*) AS total_matches
	FROM Matches
	WHERE match_type = m_type
	GROUP BY match_type;
END ;
//
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE GetTotalwicketstaken(IN s_player VARCHAR(200))
BEGIN
	SELECT player_name, wickets 
	FROM Scores 
	WHERE player_name = s_player;
END;
//
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE Getplayerteamleague(IN l_league_id INT)
BEGIN
	SELECT p.player_name, t.team_name, l.league_name 
	FROM Players p
	JOIN Teams t ON p.team_id = t.team_id
	JOIN Leagues l ON t.league_id = l.league_id
    WHERE l.league_id = l_league_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetRunsscoredineachformat()
BEGIN
	SELECT player_name, test_runs, ODI_runs, T20_runs 
	FROM Scores;
END ;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Get100internationalruns(IN s_international_runs INT)
BEGIN
	SELECT player_name,international_runs 
	FROM Scores s
    WHERE s.international_runs > s_international_runs;
END ;
//
DELIMITER ;

CALL GetTeamsByLeagues('International');
CALL GetplayersByteamname("chennai super kings");
CALL GetScoresByplayername('Virat kohli');
CALL GetteamsByleagueid(101);
CALL GetmatchesByteamname('Board of Control for Cricket in India','Delhi Capitals');
CALL GetplayersByage(30);
CALL GetTotalplayers('Board of Control for Cricket in India');
CALL GetHighestrunscorer(5);
CALL GetcoachByteams('Ravi Shastri');
CALL GettoatlBymatches('T20');
CALL GetTotalwicketstaken('Jasprit Bumrah');
CALL Getplayerteamleague(701);
CALL GetRunsscoredineachformat();
CALL Get100internationalruns(10000);


drop database Sports_Teams;

