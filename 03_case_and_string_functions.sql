-- ============================================================
-- CASE Logic & String Functions
-- Questions 24-29
-- ============================================================

-- Q24: Categorize orders based on their status.
-- Classify orders as Delivered, Pending, or Cancelled.
SELECT OrderID,
       Status,
       CASE
           WHEN Status = 'Delivered' THEN 'Delivered'
           WHEN Status = 'Pending' THEN 'Pending'
           WHEN Status = 'Cancelled' THEN 'Cancelled'
           ELSE 'Unknown'
       END AS Order_Category
FROM Orders;

-- Q25: Categorize products based on price.
-- Label products as Budget, Medium, Premium, or Luxury.
SELECT ProductName,
       Price,
       CASE
           WHEN Price < 1000 THEN 'Budget'
           WHEN Price BETWEEN 1000 AND 5000 THEN 'Medium'
           WHEN Price BETWEEN 5001 AND 20000 THEN 'Premium'
           ELSE 'Luxury'
       END AS Price_Category
FROM Products;

-- Q26: Display customer names in uppercase.
-- Standardize customer names for reporting.
SELECT UPPER(CustomerName) AS Customer_Name
FROM Customers;

-- Q27: Display the first three letters of customer names.
-- Generate customer name abbreviations.
SELECT SUBSTRING(CustomerName, 1, 3) AS First_Three_Letters
FROM Customers;

-- Q28: Find the length of each customer name.
-- Analyze customer name lengths.
SELECT CustomerName, LENGTH(CustomerName) AS Name_Length
FROM Customers;

-- Q29: Replace 'Electronics' with 'Electronic Goods'.
-- Improve category naming in reports.
SELECT REPLACE(CategoryName, 'Electronics', 'Electronic Goods') AS Category_Name
FROM Categories;
