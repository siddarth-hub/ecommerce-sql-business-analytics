-- ============================================================
-- E-Commerce Analytics Project — Seed Data
-- Load after schema.sql
-- ============================================================

-- Categories (10 records)
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1,'Electronics'),
(2,'Fashion'),
(3,'Home & Kitchen'),
(4,'Books'),
(5,'Sports'),
(6,'Beauty'),
(7,'Toys'),
(8,'Groceries'),
(9,'Furniture'),
(10,'Automotive');

-- Suppliers (10 records)
INSERT INTO Suppliers (SupplierID, SupplierName, Country) VALUES
(1,'TechWorld Pvt Ltd','India'),
(2,'Fashion Hub','India'),
(3,'Global Kitchen','USA'),
(4,'Book Planet','UK'),
(5,'Sports Zone','India'),
(6,'Beauty Essentials','South Korea'),
(7,'Toy Universe','China'),
(8,'FreshMart Suppliers','India'),
(9,'WoodCraft Industries','Malaysia'),
(10,'Auto Parts Ltd','Germany');

-- Employees (15 records)
-- ManagerID assigns each department's earliest-hired employee as its
-- manager (NULL = no manager); everyone else in that department reports
-- to them. This supports the employee-manager hierarchy self-join query.
INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, HireDate, ManagerID) VALUES
(101,'Rahul Sharma','Sales',45000,'2021-01-15',NULL),
(102,'Priya Reddy','Sales',47000,'2022-03-20',101),
(103,'Amit Kumar','Support',42000,'2021-08-12',NULL),
(104,'Sneha Patel','Warehouse',40000,'2023-02-01',105),
(105,'Ravi Verma','Warehouse',43000,'2022-11-18',NULL),
(106,'Anjali Gupta','Finance',52000,'2020-09-05',115),
(107,'Kiran Rao','Finance',51000,'2021-12-11',115),
(108,'Suresh Babu','Sales',46000,'2023-04-15',101),
(109,'Meena Nair','Support',44000,'2022-05-10',103),
(110,'Vikram Singh','Operations',55000,'2020-06-08',NULL),
(111,'Divya Joshi','Operations',53000,'2021-07-19',110),
(112,'Arjun Mehta','Warehouse',41000,'2023-01-23',105),
(113,'Neha Agarwal','Support',43500,'2022-10-09',103),
(114,'Manoj Reddy','Sales',48000,'2021-11-30',101),
(115,'Pooja Shah','Finance',52500,'2020-03-14',NULL);

-- Customers (10 records)
INSERT INTO Customers (CustomerID, CustomerName, Gender, Email, City, State, JoinDate) VALUES
(1001,'Rajesh Kumar','Male','rajesh@gmail.com','Hyderabad','Telangana','2023-01-10'),
(1002,'Priya Sharma','Female','priya@gmail.com','Bangalore','Karnataka','2023-02-14'),
(1003,'Amit Verma','Male','amit@gmail.com','Chennai','Tamil Nadu','2023-03-18'),
(1004,'Sneha Reddy','Female','sneha@gmail.com','Hyderabad','Telangana','2023-05-12'),
(1005,'Kiran Rao','Male','kiran@gmail.com','Mumbai','Maharashtra','2023-06-20'),
(1006,'Anjali Gupta','Female','anjali@gmail.com','Pune','Maharashtra','2024-01-15'),
(1007,'Vikram Singh','Male','vikram@gmail.com','Delhi','Delhi','2024-02-11'),
(1008,'Meena Nair','Female','meena@gmail.com','Kochi','Kerala','2024-03-22'),
(1009,'Suresh Babu','Male','suresh@gmail.com','Bangalore','Karnataka','2024-04-17'),
(1010,'Divya Patel','Female','divya@gmail.com','Hyderabad','Telangana','2024-05-30');

-- Products (10 records)
INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, Price, Stock) VALUES
(201,'Samsung Galaxy M35',1,1,18999,50),
(202,'HP Laptop 15s',1,1,58999,20),
(203,'Men''s Denim Jacket',2,2,2499,80),
(204,'Non-Stick Cookware Set',3,3,3999,35),
(205,'The Alchemist',4,4,499,100),
(206,'Cricket Bat',5,5,1999,40),
(207,'Face Wash',6,6,299,120),
(208,'Remote Control Car',7,7,1499,30),
(209,'Office Chair',9,9,6999,15),
(210,'Car Vacuum Cleaner',10,10,2499,25);

-- Orders (30 records)
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, Status) VALUES
(5001,1001,101,'2025-01-05','2025-01-07','Delivered'),
(5002,1002,102,'2025-01-08','2025-01-10','Delivered'),
(5003,1003,103,'2025-01-10','2025-01-13','Delivered'),
(5004,1004,104,'2025-01-12','2025-01-15','Pending'),
(5005,1005,105,'2025-01-15','2025-01-17','Delivered'),
(5006,1006,106,'2025-01-18','2025-01-20','Cancelled'),
(5007,1007,107,'2025-01-21','2025-01-24','Delivered'),
(5008,1008,108,'2025-01-25','2025-01-27','Delivered'),
(5009,1009,109,'2025-01-27','2025-01-30','Pending'),
(5010,1010,110,'2025-02-01','2025-02-03','Delivered'),
(5011,1001,111,'2025-02-04','2025-02-06','Delivered'),
(5012,1002,112,'2025-02-06','2025-02-08','Delivered'),
(5013,1003,113,'2025-02-10','2025-02-13','Pending'),
(5014,1004,114,'2025-02-12','2025-02-15','Delivered'),
(5015,1005,115,'2025-02-15','2025-02-18','Delivered'),
(5016,1006,101,'2025-02-18','2025-02-20','Delivered'),
(5017,1007,102,'2025-02-20','2025-02-23','Cancelled'),
(5018,1008,103,'2025-02-24','2025-02-26','Delivered'),
(5019,1009,104,'2025-02-26','2025-02-28','Delivered'),
(5020,1010,105,'2025-03-01','2025-03-03','Delivered'),
(5021,1001,106,'2025-03-04','2025-03-07','Delivered'),
(5022,1002,107,'2025-03-07','2025-03-09','Pending'),
(5023,1003,108,'2025-03-10','2025-03-12','Delivered'),
(5024,1004,109,'2025-03-12','2025-03-15','Delivered'),
(5025,1005,110,'2025-03-15','2025-03-17','Delivered'),
(5026,1006,111,'2025-03-18','2025-03-20','Pending'),
(5027,1007,112,'2025-03-20','2025-03-23','Delivered'),
(5028,1008,113,'2025-03-23','2025-03-25','Delivered'),
(5029,1009,114,'2025-03-26','2025-03-29','Delivered'),
(5030,1010,115,'2025-03-30','2025-04-02','Delivered');

-- OrderItems (20 records)
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1,5001,201,1,18999),
(2,5002,203,2,2499),
(3,5003,205,3,499),
(4,5004,202,1,58999),
(5,5005,206,1,1999),
(6,5006,207,5,299),
(7,5007,204,1,3999),
(8,5008,208,2,1499),
(9,5009,210,1,2499),
(10,5010,209,1,6999),
(11,5011,201,1,18999),
(12,5012,203,1,2499),
(13,5013,204,2,3999),
(14,5014,205,4,499),
(15,5015,206,2,1999),
(16,5016,202,1,58999),
(17,5017,208,3,1499),
(18,5018,207,4,299),
(19,5019,210,2,2499),
(20,5020,209,1,6999);

-- Payments (15 records)
INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, PaymentAmount, PaymentDate) VALUES
(1,5001,'UPI',18999,'2025-01-05'),
(2,5002,'Credit Card',4998,'2025-01-08'),
(3,5003,'Debit Card',1497,'2025-01-10'),
(4,5004,'Credit Card',58999,'2025-01-12'),
(5,5005,'UPI',1999,'2025-01-15'),
(6,5006,'Cash on Delivery',1495,'2025-01-18'),
(7,5007,'Net Banking',3999,'2025-01-21'),
(8,5008,'UPI',2998,'2025-01-25'),
(9,5009,'Credit Card',2499,'2025-01-27'),
(10,5010,'Debit Card',6999,'2025-02-01'),
(11,5011,'UPI',18999,'2025-02-04'),
(12,5012,'Credit Card',2499,'2025-02-06'),
(13,5013,'UPI',7998,'2025-02-10'),
(14,5014,'Cash on Delivery',1996,'2025-02-12'),
(15,5015,'Net Banking',3998,'2025-02-15');

-- Shippers (8 records)
INSERT INTO Shippers (ShipperID, ShipperName, ContactNo) VALUES
(1,'BlueDart','9876543210'),
(2,'DTDC','9876543211'),
(3,'Delhivery','9876543212'),
(4,'Ekart','9876543213'),
(5,'India Post','9876543214'),
(6,'XpressBees','9876543215'),
(7,'Shadowfax','9876543216'),
(8,'Ecom Express','9876543217');

-- Returns (10 records)
INSERT INTO Returns (ReturnID, OrderID, ProductID, ReturnDate, Reason) VALUES
(1,5002,203,'2025-01-15','Size Issue'),
(2,5004,202,'2025-01-20','Damaged Product'),
(3,5006,207,'2025-01-25','Wrong Item'),
(4,5008,208,'2025-01-30','Quality Issue'),
(5,5010,209,'2025-02-10','Product Defect'),
(6,5012,203,'2025-02-15','Color Mismatch'),
(7,5014,205,'2025-02-20','Late Delivery'),
(8,5016,202,'2025-02-25','No Longer Needed'),
(9,5018,207,'2025-03-02','Expired Product'),
(10,5020,209,'2025-03-10','Received Wrong Product');
