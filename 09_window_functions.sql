-- ============================================================
-- Window Functions
-- Questions 62-70
-- ============================================================

-- Q62: Rank products based on total sales.
-- Identify the best-selling products.
SELECT p.ProductID,
       p.ProductName,
       SUM(oi.Quantity * oi.UnitPrice) AS TotalSales,
       RANK() OVER (
           ORDER BY SUM(oi.Quantity * oi.UnitPrice) DESC
       ) AS ProductRank
FROM Products p
JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName;

-- Q63: Rank customers based on total spending.
-- Identify the most valuable customers.
SELECT c.CustomerID,
       c.CustomerName,
       SUM(pay.PaymentAmount) AS TotalSpent,
       RANK() OVER (
           ORDER BY SUM(pay.PaymentAmount) DESC
       ) AS CustomerRank
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Payments pay
ON o.OrderID = pay.OrderID
GROUP BY c.CustomerID, c.CustomerName;

-- Q64: Assign row numbers to all orders.
-- Generate sequential numbering for reporting.
SELECT ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNum,
       OrderID,
       CustomerID,
       OrderDate
FROM Orders;

-- Q65: Calculate the running total of sales.
-- Monitor cumulative sales growth over time.
SELECT PaymentDate,PaymentAmount,SUM(PaymentAmount) OVER (
           ORDER BY PaymentDate
       ) AS RunningTotal
FROM Payments;

-- Q66: Display the previous order amount for each customer.
-- Compare each purchase with the customer's previous purchase.
SELECT o.CustomerID,
       o.OrderID,
       pay.PaymentAmount,
       LAG(pay.PaymentAmount)
       OVER (
           PARTITION BY o.CustomerID
           ORDER BY o.OrderDate
       ) AS PreviousOrderAmount
FROM Orders o
JOIN Payments pay
ON o.OrderID = pay.OrderID;

-- Q67: Display the next order amount for each customer.
-- Compare each purchase with the customer's next purchase.
SELECT o.CustomerID,
       o.OrderID,
       pay.PaymentAmount,
       LEAD(pay.PaymentAmount)
       OVER (
           PARTITION BY o.CustomerID
           ORDER BY o.OrderDate
       ) AS NextOrderAmount
FROM Orders o
JOIN Payments pay
ON o.OrderID = pay.OrderID;

-- Q68: Calculate the moving average of sales.
-- Analyze short-term sales trends.
SELECT PaymentDate,
       PaymentAmount,
       AVG(PaymentAmount)
       OVER (
           ORDER BY PaymentDate
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS MovingAverage
FROM Payments;

-- Q69: Find the top three selling products in each category.
-- Identify the best-performing products within every category.
SELECT * FROM
(
    SELECT c.CategoryName,
           p.ProductName,
           SUM(oi.Quantity) AS TotalSold,
           RANK() OVER
           (
               PARTITION BY c.CategoryName
               ORDER BY SUM(oi.Quantity) DESC
           ) AS RankNo
    FROM Categories c
    JOIN Products p
    ON c.CategoryID = p.CategoryID
    JOIN OrderItems oi
    ON p.ProductID = oi.ProductID
    GROUP BY c.CategoryName, p.ProductName
) t
WHERE RankNo <= 3;

-- Q70: Divide customers into four spending groups using NTILE(4).
-- Segment customers into spending tiers for targeted marketing.
SELECT c.CustomerID,
       c.CustomerName,
       SUM(pay.PaymentAmount) AS TotalSpent,
       NTILE(4) OVER (
           ORDER BY SUM(pay.PaymentAmount) DESC
       ) AS SpendingGroup
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Payments pay
ON o.OrderID = pay.OrderID
GROUP BY c.CustomerID, c.CustomerName;
