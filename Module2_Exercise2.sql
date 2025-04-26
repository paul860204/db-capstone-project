-- Exercise: Create optimized queries to manage and analyze data

-- Task 1: create a procedure that displays the maximum ordered quantity in the Orders table.
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS 'Max Quantity in Order'
    FROM littlelemondb.orders;
END //

DELIMITER ;

CALL GetMaxQuantity();


-- Task 2: create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM littlelemondb.orders
 WHERE CustomerID = ?';

SET @id = 1;

EXECUTE GetOrderDetail USING @id;


-- Task 3: create a stored procedure called CancelOrder. use this stored procedure to delete an order record based on the user input of the order id.
DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
	DELETE FROM littlelemondb.orders WHERE OrderID = order_id;
    SELECT CONCAT('Order ', orderID, ' is cancelled') AS 'Confirmation';
END //

DELIMITER ;

CALL CancelOrder(5);