INSERT INTO Stadium (City, Street, Capacity)
VALUES 
('London', 'Fulham Road', 20000),
('Liverpool', 'Anfield Road', 54000),
('Manchester', 'Sir Matt Busby Way', 75000),
('London', 'Highbury Hill', 60000);


INSERT INTO Team (Home_stadium_city, Home_stadium_street, Name)
VALUES
('London', 'Fulham Road', 'Chelsea F.C.'),
('Liverpool', 'Anfield Road', 'Liverpool F.C.'),
('Manchester', 'Sir Matt Busby Way', 'Manchester United F.C.'),
('London', 'Highbury Hill', 'Arsenal F.C.');


INSERT INTO Trophy (Year_Of_Win)
VALUES
(2022), 
(2023),
(2024);

INSERT INTO Match (Match_Date, Match_stadium_city, Match_stadium_street, Away_Team_Score, Home_Team_Score, Away_Team, Home_Team, Trophy_match)
VALUES
('2022-10-06', 'London', 'Fulham Road', 2, 0, 2, 1, 1),
('2022-10-07', 'Manchester', 'Sir Matt Busby Way', 1, 1, 4, 3, 1),
('2022-11-08', 'Liverpool', 'Anfield Road', 3, 1, 3, 2, 1),
('2022-11-09', 'London', 'Highbury Hill', 0, 4, 1, 4, 1),
('2022-12-10', 'London', 'Fulham Road', 0, 2, 3, 1, 1),
('2022-12-11', 'Manchester', 'Sir Matt Busby Way', 2, 2, 2, 3, 1),
('2023-06-06', 'London', 'Fulham Road', 2, 0, 2, 1, 2),
('2023-06-07', 'Manchester', 'Sir Matt Busby Way', 1, 0, 4, 3, 2),
('2023-07-08', 'Liverpool', 'Anfield Road', 0, 0, 3, 2, 2),
('2023-07-09', 'London', 'Highbury Hill', 5, 1, 1, 4, 2),
('2023-08-10', 'London', 'Fulham Road', 3, 2, 3, 1, 2),
('2023-08-11', 'Manchester', 'Sir Matt Busby Way', 2, 3, 2, 3, 2);


INSERT INTO Person (Name, Surname, Date_Of_Birth, Nationality)
VALUES
('Harry', 'Kane', '1993-07-28', 'English'),
('Mohamed', 'Salah', '1992-06-15', 'Egyptian'),
('Kevin', 'De Bruyne', '1991-06-28', 'Belgian'),
('Marcus', 'Rashford', '1997-10-31', 'English'),
('Erling', 'Haaland', '2000-07-21', 'Norwegian'),
('Bukayo', 'Saka', '2001-09-05', 'English'),
('Declan', 'Rice', '1999-01-14', 'English'),
('Son', 'Heung-min', '1992-07-08', 'South Korean'),
('Virgil', 'Van Dijk', '1991-07-08', 'Dutch'),
('James', 'Maddison', '1996-11-23', 'English'),
('Pep', 'Guardiola', '1971-01-18', 'Spanish'),
('Jurgen', 'Klopp', '1967-06-16', 'German');

INSERT INTO Player (Person_ID, Position, Height)
VALUES
(1, 'Forward', 188),      
(2, 'Forward', 175),      
(3, 'Midfielder', 181),   
(4, 'Forward', 185),      
(5, 'Forward', 195),      
(6, 'Midfielder', 178),   
(7, 'Midfielder', 185),   
(8, 'Forward', 183),      
(9, 'Defender', 193),     
(10, 'Midfielder', 175);  

INSERT INTO Coach (Person_ID, Tactical_style, Start_of_career)
VALUES
(11, 'Tiki-taka', 2008),   
(12, 'Gegenpressing', 2001);

INSERT INTO Contract (Start_Date, End_Date, Member, Squad)
VALUES
('2021-07-01', '2022-06-30', 1, 1),
('2022-07-01', '2023-06-30', 1, 2),
('2023-07-01', '2024-06-30', 1, 4),
('2021-07-01', '2024-06-30', 2, 2),
('2020-07-01', '2023-06-30', 3, 3),
('2019-07-01', '2022-06-30', 4, 4),
('2023-07-01', '2026-06-30', 5, 1),
('2023-01-01', '2027-01-01', 6, 2),
('2022-01-01', '2025-01-01', 7, 3),
('2021-01-01', '2024-01-01', 8, 4),
('2024-01-01', '2027-01-01', 9, 1),
('2025-01-01', '2028-01-01', 10, 2),
('2025-01-01', '2028-01-01', 11, 1),
('2025-01-01', '2028-01-01', 12, 2);

INSERT INTO Participation (From_Time, To_Time, Substitution, Participant, Play_in_match)
VALUES
(0, 45, 5, 1, 1),
(45, 90, NULL, 2, 2),
(0, 30, 7, 3, 3),
(30, 90, NULL, 4, 4),
(0, 60, 9, 5, 5),
(60, 90, NULL, 6, 6),
(0, 45, 8, 4, 7),
(45, 90, NULL, 8, 8),
(0, 90, NULL, 9, 1),
(0, 90, NULL, 10, 2);

INSERT INTO Goal (Minute, Score, Scored_Participation)
VALUES
(5, '1:0', 1),
(15, '2:0', 1),
(16, '3:0', 1),
(20, '1:1', 3),
(45, '2:1', 3),
(50, '3:1', 4),
(70, '3:2', 5),
(80, '3:3', 6),
(85, '4:3', 7),
(90, '4:4', 8),
(90, '5:4', 9);

INSERT INTO Penalty_card (Minute, Color, Type_Of_Foul, Committed_Participation)
VALUES
(25, 'Yellow', 'Handball', 1),
(35, 'Red', 'Violent Conduct', 2),
(40, 'Second yellow', 'Repeated fouls', 3),
(55, 'Yellow', 'Diving', 4),
(60, 'Yellow', 'Time wasting', 5),
(65, 'Red', 'Serious foul play', 6),
(70, 'Yellow', 'Persistent infringement', 7),
(75, 'Yellow', 'Foul language', 8),
(80, 'Red', 'Denial of goal scoring opportunity', 9),
(85, 'Second yellow', 'Reckless tackle', 10);
 

INSERT INTO Place (Season, Place, Team_Result, Place_in_trophy)
VALUES
(2022, 1, 1, 1), 
(2022, 2, 4, 1), 
(2022, 3, 3, 1),
(2023, 1, 2, 2), 
(2023, 2, 1, 2), 
(2023, 3, 3, 2),
(2024, 1, 4, 3), 
(2024, 2, 3, 3), 
(2024, 3, 2, 3);


