-- ============================================================
-- Joins (Inner, Left, Cross, Self)
-- Questions 36-45
-- ============================================================

-- Q36: Display customers along with their orders.
-- View customer purchase history.
SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Q37: Display orders along with product details.
-- Show the products included in every order.
SELECT o.OrderID, p.ProductName,oi.Quantity,oi.UnitPrice
FROM Orders o
JOIN OrderItems oi
ON o.OrderID = oi.OrderID
JOIN Products p
ON oi.ProductID = p.ProductID;

-- Q38: Display products along with their category names.
-- Organize products by category.
SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID;

-- Q39: Display orders along with payment details.
-- Analyze payment information for each order.
SELECT o.OrderID,o.OrderDate,p.PaymentMethod,p.PaymentAmount
FROM Orders o
JOIN Payments p
ON o.OrderID = p.OrderID;

-- Q40: Display employees along with the orders they handled.
-- Track employee performance.
SELECT e.EmployeeName,o.OrderID, o.OrderDate
FROM Employees e
JOIN Orders o
ON e.EmployeeID = o.EmployeeID;

-- Q41: Find customers who never placed an order.
-- Identify inactive customers.
SELECT c.*FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Q42: Find products that were never sold.
-- Identify slow-moving inventory.
SELECT p.* FROM Products p
LEFT JOIN OrderItems oi
ON p.ProductID = oi.ProductID
WHERE oi.OrderID IS NULL;

-- Q43: Find suppliers who do not supply any products.
-- Identify inactive suppliers.
SELECT s.* FROM Suppliers s
LEFT JOIN Products p
ON s.SupplierID = p.SupplierID
WHERE p.ProductID IS NULL;

-- Q44: Generate all possible employee and shipper combinations.
-- Explore all potential shipping assignments.
SELECT e.EmployeeName,s.ShipperName
FROM Employees e
CROSS JOIN Shippers s;

-- Q45: Display the employee-manager hierarchy.
-- Show reporting relationships within the organization.
SELECT e.EmployeeName AS Employee,
       m.EmployeeName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;
