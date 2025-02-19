CREATE TABLE Stadium(
      City varchar(50) NOT NULL,
      Street varchar(50) NOT NULL,
      Capacity integer NOT NULL,
      PRIMARY KEY(City,Street)
);

CREATE TABLE Team(
      Team_ID int identity PRIMARY KEY, 
	  Home_stadium_city varchar(50) NOT NULL,
	  Home_stadium_street varchar(50) NOT NULL,
      Name varchar(50) NOT NULL,
	  FOREIGN KEY (Home_stadium_City, Home_stadium_Street) REFERENCES Stadium(City, Street)
);

CREATE TABLE Trophy(
	Trophy_ID int identity PRIMARY KEY,
	Year_Of_Win smallint CHECK (Year_Of_Win BETWEEN 1900 AND 2500)
);

CREATE TABLE Match(
      Match_ID int identity PRIMARY KEY,
      Match_date date NOT NULL,
      Match_stadium_city varchar(50) NOT NULL,
	  Match_stadium_street varchar(50) NOT NULL,
      Away_Team_Score integer NOT NULL,
      Home_Team_Score integer NOT NULL,
	  Away_Team integer NOT NULL,
	  Home_Team integer NOT NULL,
	  Trophy_match integer NOT NULL,
	  FOREIGN KEY (Trophy_match) REFERENCES Trophy(Trophy_ID),
	  FOREIGN KEY (Away_Team) REFERENCES Team(Team_ID),
	  FOREIGN KEY (Home_Team) REFERENCES Team(Team_ID),
	  FOREIGN KEY (Match_stadium_City, Match_stadium_Street) REFERENCES Stadium(City, Street)
);

CREATE TABLE Person(
      Person_ID int identity PRIMARY KEY,
      Name varchar(50) CHECK (ASCII(LEFT(Name,1)) BETWEEN 65 AND 90) NOT NULL,
      Surname varchar(50) CHECK (ASCII(LEFT(Surname,1)) BETWEEN 65 AND 90) NOT NULL,
      Date_Of_Birth date NOT NULL,
      Nationality varchar(50) CHECK (ASCII(LEFT(Nationality,1)) BETWEEN 65 AND 90)
);

CREATE TABLE Participation(
      Participation_ID int identity PRIMARY KEY,
      From_Time tinyint CHECK (From_Time BETWEEN 0 AND 130),
      To_Time tinyint CHECK (To_Time BETWEEN 0 AND 150),
      Substitution integer,
	  Participant integer NOT NULL,
	  Play_in_match integer NOT NULL,
	  FOREIGN KEY (Substitution) REFERENCES Participation(Participation_ID),
	  FOREIGN KEY (Participant) REFERENCES Person(Person_ID),
	  FOREIGN KEY (Play_in_match) REFERENCES Match(Match_ID)
);

CREATE TABLE Goal(
      Goal_ID int identity PRIMARY KEY,
      Minute tinyint CHECK (Minute BETWEEN 0 AND 130),
      Score varchar(5) CHECK (Score LIKE '[0-9]%:[0-9]%'),
	  Scored_Participation integer NOT NULL,
	  FOREIGN KEY (Scored_Participation) REFERENCES Participation(Participation_ID)
);

CREATE TABLE Penalty_card(
      Penalty_ID int identity PRIMARY KEY,
      Minute tinyint CHECK (Minute BETWEEN 0 AND 130),
      Color varchar(13) CHECK (Color IN ('Yellow', 'Red', 'Second yellow')),
      Type_Of_Foul varchar(200),
	  Committed_Participation integer NOT NULL,
	  FOREIGN KEY (Committed_Participation) REFERENCES Participation(Participation_ID)
);


CREATE TABLE Player(
	Person_ID int NOT NULL,
	Position varchar(10) CHECK (Position IN('Goalkeeper', 'Defender',  'Midfielder', 'Forward')),
	Height tinyint CHECK (Height BETWEEN 100 AND 300),
	FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
	PRIMARY KEY (Person_ID)
);

CREATE TABLE Coach(
	Person_ID int NOT NULL,
	Tactical_style varchar(50) CHECK(Tactical_style IN ('The chain', 'Counter play',  'Gegenpressing', 'Tiki-taka')),
	Start_of_career smallint CHECK (Start_of_career BETWEEN 1900 AND 9999),
	FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
	PRIMARY KEY (Person_ID)
);

CREATE TABLE Contract(
      Contract_ID int identity PRIMARY KEY,
      Start_Date date NOT NULL,
	  End_Date date NOT NULL,
	  Member integer NOT NULL,
	  Squad integer NOT NULL,
	  FOREIGN KEY (Member) REFERENCES Person(Person_ID),
      FOREIGN KEY (Squad) REFERENCES Team(Team_ID)
);


CREATE TABLE Place(
	Place_ID int identity PRIMARY KEY,
	Season smallint CHECK (Season BETWEEN 1900 AND 9999),
	Place tinyint NOT NULL,
	Team_Result integer NOT NULL,
	Place_in_trophy integer,
	FOREIGN KEY (Team_Result) REFERENCES Team(Team_ID),
	FOREIGN KEY (Place_in_trophy) REFERENCES Trophy(Trophy_ID)
);


