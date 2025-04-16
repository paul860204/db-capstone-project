-- show all your databases in MySQL server
SHOW DATABASES;


-- Choose the database LittleLemonDB
USE littlelemondb;


-- Create MenuItems table
INSERT INTO littlelemondb.menuitems (ItemID, ItemName, Type, Price)
VALUES
(1, 'Olives', 'Starters', 5),
(2, 'Flatbread', 'Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread', 'Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt', 'Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Italian Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);

-- Check MenuItems table
SELECT COUNT(*) FROM littlelemondb.menuitems;


-- Create Menus table
INSERT INTO littlelemondb.menus (MenuID, ItemID, Cuisine)
VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');

-- Check Menus table
SELECT COUNT(*) FROM littlelemondb.menus;


-- Create Customers table
INSERT INTO littlelemondb.customers (CustomerID, FullName, PhoneNumber)
VALUES 
(1, 'Vanessa McCarthy', 0757536378),
(2, 'Marcos Romero', 0757536379),
(3, 'Hiroki Yamane', 0757536376),
(4, 'Anna Iversen', 0757536375),
(5, 'iana Pinto', 0757536374),
(6, 'Altay Ayhan', 0757636378),
(7, 'Jane Murphy', 0753536379),
(8, 'Laurina Delgado', 0754536376),
(9, 'Mike Edwards', 0757236375),
(10, 'Karl Pederson', 0757936374);

-- Check Customers table
SELECT COUNT(*) FROM littlelemondb.customers;


-- Create Employees table
INSERT INTO littlelemondb.employees (EmployeeID, EmployeeName, Role, Salary)
VALUES
(01, 'Mario Gollini', 'Manager', 70000),
(02, 'Adrian Gollini', 'Assistant Manager', 65000),
(03, 'Giorgos Dioudis', 'Head Chef', 50000),
(04, 'Fatma Kaya', 'Assistant Chef', 45000),
(05, 'Elena Salvai', 'Head Waiter', 40000),
(06, 'John Millar', 'Receptionist', 35000);

-- Check Employees table
SELECT COUNT(*) FROM littlelemondb.employees;


-- Create Bookings table
INSERT INTO littlelemondb.bookings (BookingID, BookingDate, TableNo, CustomerID, EmployeeID)
VALUES
(1, '2021-11-10', 12, 4, 1),
(2, '2021-11-10', 12, 6, 1),
(3, '2021-11-10', 19, 1, 3),
(4, '2021-11-11', 15, 2, 4),
(5, '2021-11-11', 5, 3, 2),
(6, '2021-11-11', 8, 5, 5);

-- Check Bookings table
SELECT COUNT(*) FROM littlelemondb.bookings;


-- Create OrderDeliveryStatus table
INSERT INTO littlelemondb.orderdeliverystatus (StatusID, DeliveryDate, Status)
VALUES
(1, '2021-11-17', 'Delivered'),
(2, '2021-11-20', 'In progress'),
(3, '2021-11-22', 'Delivered'),
(4, '2021-11-25', 'In progress'),
(5, '2021-11-27', 'In progress');

-- Check OrderDeliveryStatus table
SELECT COUNT(*) FROM littlelemondb.orderdeliverystatus;


-- Create Orders table
INSERT INTO littlelemondb.orders (OrderID, OrderDate, Quantity, TotalCost, MenuID, CustomerID, StatusID)
VALUES
(1, '2021-11-17', 2, 80, 3, 4, 1),
(2, '2021-11-20', 1, 37, 2, 1, 2),
(3, '2021-11-22', 1, 37, 2, 2, 3),
(4, '2021-11-25', 1, 40, 3, 3, 4),
(5, '2021-11-27', 1, 52, 1, 5, 5);

-- Check Orders table
SELECT COUNT(*) FROM littlelemondb.orders;