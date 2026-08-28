-- ============================================================
-- Set Operations (UNION, INTERSECT, EXCEPT)
-- Questions 58-61
-- ============================================================

-- Q58: Combine customer lists using UNION.
-- Merge customer records from multiple cities without duplicates.
SELECT CustomerName FROM Customers
WHERE City = 'Hyderabad'
UNION
SELECT CustomerName FROM Customers
WHERE City = 'Bangalore';

-- Q59: Combine product lists using UNION ALL.
-- Merge product records while retaining duplicates.
SELECT ProductName FROM Products
WHERE CategoryID = 1
UNION ALL
SELECT ProductName FROM Products
WHERE CategoryID = 2;

-- Q60: Find customers who ordered in both 2024 and 2025 using INTERSECT.
-- Identify repeat customers across years.
SELECT CustomerID FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2024
INTERSECT
SELECT CustomerID FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2025;

-- Q61: Find customers who ordered only in 2025 using EXCEPT.
-- Identify newly active customers.
SELECT CustomerID FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2025
EXCEPT
SELECT CustomerID FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) < 2025;
