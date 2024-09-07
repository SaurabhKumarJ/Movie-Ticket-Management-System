-- Procedure: 
 
-- To check for the empty number of seats in the show: 

DELIMITER //
CREATE PROCEDURE CheckEmptySeats(IN show_id VARCHAR(10))
BEGIN
    DECLARE gold_seat_var INT;
    DECLARE silver_seat_var INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE c CURSOR FOR
    SELECT Seats_Remaining_Gold, Seats_Remaining_Silver 
    FROM Shows
    WHERE Shows.Show_ID = show_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN c;
    read_loop:LOOP
    FETCH c INTO gold_seat_var,silver_seat_var;
    IF done THEN
    LEAVE read_loop;
    END IF;
    SELECT CONCAT(gold_seat_var,' ', silver_seat_var) AS Remaining_Seats_Gold_And_Silver;
    END LOOP;
    CLOSE c;
END //
DELIMITER ;
