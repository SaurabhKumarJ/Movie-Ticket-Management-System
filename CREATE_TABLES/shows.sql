CREATE Table Shows(
Show_ID varchar(10),
Show_Time time NOT NULL,
Show_Date date NOT NULL,
Seats_Remaining_Gold int NOT NULL CHECK (Seats_Remaining_Gold >= 0),
Seats_Remaining_Silver int NOT NULL CHECK
(Seats_Remaining_Silver >= 0),
Class_Cost_Gold int NOT NULL,
Class_Cost_Silver int NOT NULL,
Screen_ID varchar(5) NOT NULL,
Movie_ID varchar(5) NOT NULL,
Primary Key(Show_ID),
Foreign Key (Screen_ID) REFERENCES Screen(Screen_ID) ON DELETE
CASCADE ON UPDATE CASCADE,
Foreign Key (Movie_ID) REFERENCES Movie(Movie_ID) ON DELETE CASCADE ON UPDATE CASCADE);
