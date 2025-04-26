-- Exercise: Create SQL queries to check available bookings based on user input


-- Task 1: replicate the list of records in the following table by adding them to the Little Lemon booking table.
INSERT INTO littlelemondb.bookings (BookingID, BookingDate, TableNo, CustomerID, EmployeeID)
VALUES
(11, '2022-10-10', 5, 1, 1),
(12, '2022-11-12', 3, 3, 2),
(13, '2022-10-11', 2, 2, 3),
(14, '2022-10-13', 2, 1, 4);

SELECT * FROM littlelemondb.bookings;


-- Task 2: create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked.
DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE booking_status INT;
    
    SELECT COUNT(*) INTO booking_status 
    FROM Bookings 
    WHERE BookingDate = booking_date AND TableNo = table_number;

	IF booking_status > 0 THEN
		SELECT CONCAT('Table ', table_number, ' is already booked') AS 'Booking Status';
	ELSE
		SELECT CONCAT('Table ', table_number, ' is available') AS 'Booking Status';
	END IF;
END //

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);


-- Task 3: new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE booking_status INT;
    
    START TRANSACTION;
    
    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO booking_status 
    FROM Bookings 
    WHERE BookingDate = booking_date AND TableNo = table_number;
    
    -- If the table is already booked, rollback the transaction
    IF booking_status > 0 THEN
		ROLLBACK;
        SELECT CONCAT('Table ', table_number, ' is already booked - booking cancelled') AS 'Booking Status';
	
    -- If the table is available, insert the new booking and commit the transaction
    ELSE
		INSERT INTO Bookings (BookingID, BookingDate, TableNo, CustomerID, EmployeeID)
        VALUES (15, booking_date, table_number, 4, 5); -- Assuming BookingID is 15, CustomerID is 4 and EmployeeID is 5 for example
        COMMIT;
        SELECT CONCAT('Table ', table_number, ' is booked successfully') AS 'Booking Status';
        END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-11-12', 3);