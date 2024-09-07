/*1. A query to retrieve distinct movie names from the database where the show time is 
‘07:30:00’ and the show date is ‘2024-04-04’ */

Select distinct Name from Shows, Movie where Shows.Movie_id = Movie.Movie_id and Shows.Show_Time = '07:30:00' and Show_Date = '2024-04-04';


/*2. Show users who booked more than 3 tickets */

Select First_Name, Last_Name from Web_User 
where Web_User_ID IN 
	(Select distinct User_ID from Booking where No_of_Tickets > 3);


/*3. Show the total number of tickets purchased by a user */

select w.first_name,w.last_name,count(t.ticket_id) as no_of_tickets_bought
from web_user w,ticket t,booking b
where w.web_user_id=b.user_id and b.booking_id=t.booking_id
group by w.first_name,w.last_name;


/*4. Show those shows where total remaining seats is greater than 30% of the 
total seats for the show */

drop view total;
create view total as select (no_of_seats_gold + no_of_seats_silver) as total_seats, show_id 
from screen, shows where shows.screen_id = screen.screen_id;
drop view booked;
create view booked as select (seats_remaining_gold + seats_remaining_silver) as total_remaining, show_id from shows;
select * from total natural join booked where total_remaining > 0.3 * total_seats;
