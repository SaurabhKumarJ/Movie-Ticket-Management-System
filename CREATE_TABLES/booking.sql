CREATE Table Booking(
Booking_ID varchar(10),
No_of_Tickets int NOT NULL,
Total_Cost int NOT NULL,
Card_Number varchar(19),
Name_on_card varchar(21),
User_ID varchar(5),
Show_ID varchar(10),
Foreign Key (User_ID) REFERENCES Web_User (Web_User_ID) ON
DELETE CASCADE ON UPDATE CASCADE,
Foreign Key (Show_ID) REFERENCES Shows(Show_ID) ON DELETE
CASCADE ON UPDATE CASCADE,
Primary Key(Booking_ID));
