-- 1. english players who scored a hat-trick
SELECT Person.Name, Person.Surname
FROM Player
JOIN Person ON Player.Person_ID = Person.Person_ID
WHERE Person.Person_ID IN (
    SELECT Participation.Participant
    FROM Participation
    JOIN Goal ON Participation.Participation_ID = Goal.Scored_Participation
    GROUP BY Participation.Participant, Participation.Play_in_match
    HAVING COUNT(Goal.Goal_ID) >= 3
)
AND Person.Nationality = 'English';


-- 2. players that scored more goals than average scored goals in the league
SELECT Person.Name, Person.Surname, COUNT(Goal.Goal_ID) AS Goals_Scored
FROM Person
JOIN Participation ON Person.Person_ID = Participation.Participant
JOIN Goal ON Participation.Participation_ID = Goal.Scored_Participation
GROUP BY Person.Name, Person.Surname
HAVING COUNT(Goal.Goal_ID) > (
    SELECT AVG(PlayerGoals.Goals_Scored)
    FROM (
        SELECT COUNT(Goal.Goal_ID) AS Goals_Scored
        FROM Goal
        JOIN Participation ON Goal.Scored_Participation = Participation.Participation_ID
        GROUP BY Participation.Participant
    ) AS PlayerGoals
)
ORDER BY Goals_Scored DESC;

-- 3. players who scored goals in their debut
SELECT DISTINCT Person.Name, Person.Surname
FROM Goal
JOIN Participation ON Goal.Scored_Participation = Participation.Participation_ID
JOIN Person ON Participation.Participant = Person.Person_ID
WHERE Participation.Play_in_match IN (
    SELECT MIN(Participation.Play_in_match)
    FROM Participation
    GROUP BY Participation.Participant
);

-- 4. players who have won trophy at least 3 times with 3 different teams
SELECT Person.Name, Person.Surname, COUNT(DISTINCT Team.Team_ID) AS Clubs_Won_With
FROM Person
JOIN Player ON Person.Person_ID = Player.Person_ID
JOIN Contract ON Player.Person_ID = Contract.Member
JOIN Team ON Contract.Squad = Team.Team_ID
JOIN Place ON Team.Team_ID = Place.Team_Result
JOIN Trophy ON Place.Place_in_trophy = Trophy.Trophy_ID
WHERE Place.Place = 1 AND Trophy.Year_Of_Win IS NOT NULL  
GROUP BY Person.Name, Person.Surname
HAVING COUNT(DISTINCT Team.Team_ID) >= 3
ORDER BY Clubs_Won_With DESC, Person.Name ASC, Person.Surname ASC;

-- 5. matches where more than one goal was scored by one player in the match
SELECT Match.Match_ID, Match.Match_date, Stadium.City, Stadium.Street, Person.Name, Person.Surname,  COUNT(Goal.Goal_ID) AS Goals_Scored
FROM Match
JOIN Stadium ON Match.Match_stadium_city = Stadium.City AND Match.Match_stadium_street = Stadium.Street
JOIN Participation ON Match.Match_ID = Participation.Play_in_match
JOIN Goal ON Participation.Participation_ID = Goal.Scored_Participation
JOIN Person ON Participation.Participant = Person.Person_ID
WHERE Match.Match_ID IN (
    SELECT Participation.Play_in_match
    FROM Goal
    JOIN Participation ON Goal.Scored_Participation = Participation.Participation_ID
    GROUP BY Participation.Play_in_match, Participation.Participant
    HAVING COUNT(Goal.Goal_ID) > 1
)
GROUP BY Match.Match_ID, Match.Match_date, Stadium.City, Stadium.Street, Person.Name, Person.Surname
HAVING COUNT(Goal.Goal_ID) > 1
ORDER BY Match.Match_date, Goals_Scored DESC;


-- 6. teams that won the most trophies
SELECT Team.Name, COUNT(Place.Place_in_trophy) AS Number_of_Wins
FROM Team
JOIN Place ON Team.Team_ID = Place.Team_Result
WHERE Place.Place = 1
GROUP BY Team.Name
HAVING COUNT(Place.Place_in_trophy) = (
    SELECT TOP 1 COUNT(Place.Place_in_trophy)
    FROM Team
    JOIN Place ON Team.Team_ID = Place.Team_Result
    WHERE Place.Place = 1
    GROUP BY Team.Name
    ORDER BY COUNT(Place.Place_in_trophy) DESC
)
ORDER BY Number_of_Wins DESC;

-- 7. matches where home team won with at least 3 goals difference
SELECT Match.Match_ID, Match.Match_date, Stadium.City, Stadium.Street, Match.Home_Team_Score, Match.Away_Team_Score, (Match.Home_Team_Score - Match.Away_Team_Score) AS Goal_Difference
FROM Match
JOIN Stadium ON Match.Match_stadium_city = Stadium.City AND Match.Match_stadium_street = Stadium.Street
WHERE Match.Home_Team_Score - Match.Away_Team_Score >= 3;
