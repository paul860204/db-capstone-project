-- Exercise: Create SQL queries to add and update bookings


-- Task 1: create a new procedure called AddBooking to add a new table booking record.
DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN booking_date DATE, IN table_number INT, IN customer_id INT, employee_id INT)
BEGIN
	INSERT INTO littlelemondb.bookings(BookingID, BookingDate, TableNo, CustomerID, EmployeeID)
    VALUES (booking_id, booking_date, table_number, customer_id, employee_id);
    
    SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;

CALL AddBooking(9, '2022-12-30', 4, 3, 4);


-- Task 2: create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE littlelemondb.bookings
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;
    
    SELECT CONCAT('Booking ', booking_id, ' updated') AS 'Confirmation';
END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');


-- Task 3: create a new procedure called CancelBooking that they can use to cancel or remove a booking.
DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DELETE FROM littlelemondb.bookings WHERE BookingID = booking_id;
    
    SELECT CONCAT('Booking ', booking_id, ' cancelled') AS 'Confirmation';
END //

DELIMITER ;

CALL CancelBooking(9);