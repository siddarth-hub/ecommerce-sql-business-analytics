-- ============================================================
-- Data Exploration & Filtering
-- Questions 1-11
-- ============================================================

-- Q1: Display all customers.
-- The management wants to view the complete list of registered customers.
select * from customers;

-- Q2: Display customers from Hyderabad.
-- Find customers located in Hyderabad for a regional marketing campaign.
select * from customers
where city ='Hyderabad';

-- Q3: Display products priced above ₹500.
-- Identify premium products available on the platform.
select * from products
where Price >500;

-- Q4: Find customers who joined after 2024.
-- Analyze newly acquired customers.
select * from customers
where JoinDate > '2024-01-01';

-- Q5: Display orders sorted by the latest order date.
-- Review the most recent customer orders.
select * from orders
order by OrderDate desc;

-- Q6: Display the first 20 products.
-- Quickly preview a limited number of products.
select  * from products
limit 20;

-- Q7: Display unique customer cities.
-- Identify all cities where customers are located.
select distinct (City) from customers;

-- Q8: Find products priced between ₹500 and ₹3,000.
-- Identify products in the mid-price range for promotional offers.
select * from Products
where Price between 500 and 3000;

-- Q9: Find orders placed in January.
-- Analyze sales performance during January.
select * from orders
where extract (Month from OrderDate)=1;

-- Q10: Display customers from Hyderabad or Bangalore.
-- Target customers from selected cities.
select * from customers
where City in ('Hyderabad','Bangalore');

-- Q11: Find products not supplied by Supplier 5.
-- Review products supplied by other vendors.
SELECT * FROM Products
WHERE SupplierID <> 5;
