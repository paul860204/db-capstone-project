-- Exercise: Create a virtual table to summarize data

-- Task 1: create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM littlelemondb.orders
WHERE Quantity > 2;

SELECT * FROM littlelemondb.OrdersView;


-- Task 2: information from four tables on all customers with orders that cost more than $150.
SELECT 
	c.CustomerID, 
    c.FullName, 
    o.OrderID,
    o.TotalCost,
    m.Cuisine,
    mi.ItemName
FROM littlelemondb.customers AS c
INNER JOIN littlelemondb.orders AS o ON o.CustomerID = c.CustomerID
INNER JOIN littlelemondb.menus AS m ON m.MenuID = o.MenuID
INNER JOIN littlelemondb.menuitems AS mi ON mi.ItemID = m.ItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;


-- Task 3: find all menu items for which more than 2 orders have been placed.and
SELECT DISTINCT Cuisine
FROM littlelemondb.menus
WHERE MenuID = ANY (
	SELECT MenuID
    FROM littlelemondb.orders
    GROUP BY MenuID
    HAVING SUM(Quantity) > 2
);



