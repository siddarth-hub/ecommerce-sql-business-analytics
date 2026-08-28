-- ============================================================
-- CTEs & Views
-- Questions 52-57
-- ============================================================

-- Q52: Create a CTE to calculate monthly sales.
-- Build a reusable monthly sales report.
WITH MonthlySales AS
(
    SELECT EXTRACT(MONTH FROM PaymentDate) AS Month,
           SUM(PaymentAmount) AS TotalSales
    FROM Payments
    GROUP BY EXTRACT(MONTH FROM PaymentDate)
)
SELECT * FROM MonthlySales;

-- Q53: Create a CTE to identify top customers.
-- Simplify customer ranking analysis.
WITH CustomerSales AS
(
    SELECT c.CustomerID,
           c.CustomerName,
           SUM(p.PaymentAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o
    ON c.CustomerID = o.CustomerID
    JOIN Payments p
    ON o.OrderID = p.OrderID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT * FROM CustomerSales ORDER BY TotalSpent DESC;

-- Q54: Create a CTE to calculate category-wise revenue.
-- Generate reusable revenue summaries.
WITH CategoryRevenue AS
(
    SELECT c.CategoryName,
           SUM(oi.Quantity * oi.UnitPrice) AS Revenue
    FROM Categories c
    JOIN Products p
    ON c.CategoryID = p.CategoryID
    JOIN OrderItems oi
    ON p.ProductID = oi.ProductID
    GROUP BY c.CategoryName
)
SELECT * FROM CategoryRevenue;

-- Q55: Create a view named vw_OrderSummary.
-- Provide a reusable summary of customer orders.
CREATE VIEW vw_OrderSummary AS
SELECT o.OrderID,
       c.CustomerName,
       o.OrderDate,
       o.Status
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID;

-- Q56: Create a view named vw_ProductSales.
-- Create a reusable report showing product sales.
CREATE VIEW vw_ProductSales AS
SELECT p.ProductID,
       p.ProductName,
       SUM(oi.Quantity) AS TotalQuantitySold,
       SUM(oi.Quantity * oi.UnitPrice) AS TotalSales
FROM Products p
JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName;

-- Q57: Create a view named vw_CustomerPurchase.
-- Display complete customer purchase history.
CREATE VIEW vw_CustomerPurchase AS
SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate,
       p.PaymentAmount
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Payments p
ON o.OrderID = p.OrderID;
