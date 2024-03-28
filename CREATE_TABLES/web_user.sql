CREATE Table Web_user(
Web_User_ID varchar(5),
First_Name varchar(15),
Last_Name varchar(20),
Email_ID varchar(30),
Age int,
Phone_Number varchar(10) NOT NULL,
Primary Key(Web_User_ID));
Create Table Theatre(
Theatre_ID varchar(5),
Name_of_Theatre varchar(30) NOT NULL,
No_of_Screens int,
Area varchar(30),
Primary Key(Theatre_ID));
