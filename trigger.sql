-- To prevent delete of booking of today's shows: 

DELIMITER //
CREATE TRIGGER cancel_booking
BEFORE DELETE ON Booking
FOR EACH ROW
BEGIN
DECLARE cur_date DATE;
DECLARE booking_date DATE;
SET cur_date = NOW();
SELECT Show_Date INTO booking_date
FROM Shows
WHERE Show_ID = OLD.Show_ID;
IF booking_date = CURDATE() THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cannot delete bookings for the current day.';
END IF;
END //
DELIMITER ;
