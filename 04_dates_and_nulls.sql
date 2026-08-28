-- ============================================================
-- Date Functions & NULL Handling
-- Questions 30-35
-- ============================================================

-- Q30: Calculate monthly sales.
-- Track revenue generated each month.
SELECT EXTRACT(MONTH FROM PaymentDate) AS Month,SUM(PaymentAmount) AS Monthly_Sales
FROM Payments
GROUP BY EXTRACT(MONTH FROM PaymentDate)
ORDER BY Month;

-- Q31: Calculate yearly sales.
-- Compare business performance across years.
SELECT EXTRACT(YEAR FROM PaymentDate) AS Year,
     SUM(PaymentAmount) AS Yearly_Sales
FROM Payments
GROUP BY EXTRACT(YEAR FROM PaymentDate)
ORDER BY Year;

-- Q32: Display orders placed in the current month.
-- Review recent customer orders.
SELECT * FROM Orders
WHERE EXTRACT(MONTH FROM OrderDate) = EXTRACT(MONTH FROM CURRENT_DATE)
AND EXTRACT(YEAR FROM OrderDate) = EXTRACT(YEAR FROM CURRENT_DATE);

-- Q33: Calculate the number of days taken for shipping.
-- Measure delivery performance.
SELECT OrderID, ShipDate - OrderDate AS Shipping_Days
FROM Orders;

-- Q34: Display products with no supplier assigned.
-- Identify incomplete product records.
SELECT * FROM Products
WHERE SupplierID IS NULL;

-- Q35: Replace NULL stock values with zero.
-- Improve inventory reporting.
SELECT ProductID,ProductName,COALESCE(Stock, 0) AS Stock
FROM Products;
