-- ============================================================
-- Subqueries
-- Questions 46-51
-- ============================================================

-- Q46: Find products priced above the average price.
-- Identify premium products compared to the average market price.
SELECT * FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

-- Q47: Find customers who spend more than the average customer.
-- Identify high-value customers.
SELECT c.CustomerID,
       c.CustomerName,
       SUM(p.PaymentAmount) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Payments p
ON o.OrderID = p.OrderID
GROUP BY c.CustomerID, c.CustomerName
HAVING SUM(p.PaymentAmount) >
(
    SELECT AVG(CustomerTotal)
    FROM
    (
        SELECT SUM(p.PaymentAmount) AS CustomerTotal
        FROM Orders o
        JOIN Payments p
        ON o.OrderID = p.OrderID
        GROUP BY o.CustomerID
    ) avg_table
);

-- Q48: Find the most expensive product.
-- Display the highest-priced product available.
SELECT * FROM Products
WHERE Price =
(
    SELECT MAX(Price)
    FROM Products
);

-- Q49: Find employees handling the maximum number of orders.
-- Identify the busiest employee.
SELECT EmployeeID, COUNT(OrderID) AS Total_Orders
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) =
(
    SELECT MAX(OrderCount)
    FROM
    (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY EmployeeID
    ) t
);

-- Q50: Find customers who purchased products from the Electronics category.
-- Analyze customer buying patterns.
SELECT DISTINCT c.CustomerID,  c.CustomerName
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderItems oi
ON o.OrderID = oi.OrderID
JOIN Products p
ON oi.ProductID = p.ProductID
JOIN Categories cat
ON p.CategoryID = cat.CategoryID
WHERE cat.CategoryName = 'Electronics';

-- Q51: Find products that have never been ordered.
-- Identify products with no sales.
SELECT p.* FROM Products p
LEFT JOIN OrderItems oi
ON p.ProductID = oi.ProductID
WHERE oi.ProductID IS NULL;
