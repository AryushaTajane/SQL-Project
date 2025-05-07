-- 1. List all customers
SELECT * FROM Customers;

-- 2. List all products
SELECT * FROM Products;

-- 3. List all orders
SELECT * FROM Orders;

-- 4. Get customers from 'Mumbai'
SELECT * FROM Customers WHERE City = 'Mumbai';

-- 5. Find products priced above 1000
SELECT * FROM Products WHERE Price > 1000;

-- 6. Get orders made in 2023
SELECT * FROM Orders WHERE YEAR(OrderDate) = 2023;

-- 7. Find total number of customers
SELECT COUNT(*) FROM Customers;

-- 8. List distinct product categories
SELECT DISTINCT Category FROM Products;

-- 9. Find the cheapest product
SELECT * FROM Products ORDER BY Price ASC LIMIT 1;

-- 10. Find the most expensive product
SELECT * FROM Products ORDER BY Price DESC LIMIT 1;

-- 11. Get all orders with quantity more than 2
SELECT * FROM Orders WHERE Quantity > 2;

-- 12. Find customers who joined in 2024
SELECT * FROM Customers WHERE YEAR(JoinDate) = 2024;

-- 13. Get names of customers and their cities
SELECT CustomerName, City FROM Customers;

-- 14. Count orders per product
SELECT ProductID, COUNT(OrderID) AS OrderCount FROM Orders GROUP BY ProductID;

-- 15. Count orders per customer
SELECT CustomerID, COUNT(OrderID) AS TotalOrders FROM Orders GROUP BY CustomerID;

-- 16. Join to get customer name and product ordered
SELECT o.OrderID, c.CustomerName, p.ProductName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID;

-- 17. Find total revenue per customer
SELECT c.CustomerName, SUM(p.Price * o.Quantity) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName;

-- 18. Top 5 customers by spending
SELECT c.CustomerName, SUM(p.Price * o.Quantity) AS Spending
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Spending DESC
LIMIT 5;

-- 19. Orders with customer from Pune
SELECT o.*
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'Pune';

-- 20. Products never ordered
SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM Orders);

-- 21. Average quantity ordered per product
SELECT ProductID, AVG(Quantity) AS AvgQty FROM Orders GROUP BY ProductID;

-- 22. Most frequently ordered product
SELECT ProductID, SUM(Quantity) AS TotalQty
FROM Orders
GROUP BY ProductID
ORDER BY TotalQty DESC
LIMIT 1;

-- 23. Total quantity sold per product category
SELECT p.Category, SUM(o.Quantity) AS TotalQty
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category;

-- 24. Count of customers by city
SELECT City, COUNT(CustomerID) AS TotalCustomers FROM Customers GROUP BY City;

-- 25. Total revenue per product
SELECT p.ProductName, SUM(p.Price * o.Quantity) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 26. Customers with more than 2 orders
SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING COUNT(OrderID) > 2;

-- 27. Last 5 orders placed
SELECT * FROM Orders ORDER BY OrderDate DESC LIMIT 5;

-- 28. Products with name containing "Phone"
SELECT * FROM Products WHERE ProductName LIKE '%Phone%';

-- 29. Customers who ordered 'Smart Watch'
SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.ProductName = 'Smart Watch';

-- 30. Orders placed before June 2023
SELECT * FROM Orders WHERE OrderDate < '2023-06-01';

-- 31. Find repeat customers
SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING COUNT(OrderID) > 1;

-- 32. Segment customers based on order count
SELECT 
    CustomerID,
    COUNT(OrderID) AS TotalOrders,
    CASE 
        WHEN COUNT(OrderID) = 1 THEN 'One-time'
        WHEN COUNT(OrderID) BETWEEN 2 AND 3 THEN 'Repeat'
        ELSE 'Loyal'
    END AS Segment
FROM Orders
GROUP BY CustomerID;

-- 33. Running total of revenue per customer
SELECT 
    CustomerID,
    OrderDate,
    SUM(Quantity * Price) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS RunningRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID;

-- 34. Customer with highest revenue
SELECT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY SUM(p.Price * o.Quantity) DESC
LIMIT 1;

-- 35. Average spending per city
SELECT c.City, ROUND(AVG(p.Price * o.Quantity), 2) AS AvgSpending
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.City;

-- 36. First product ordered by each customer
SELECT CustomerID, 
       FIRST_VALUE(ProductID) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS FirstProduct
FROM Orders;

-- 37. Highest single order value
SELECT o.OrderID, (o.Quantity * p.Price) AS OrderValue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
ORDER BY OrderValue DESC
LIMIT 1;

-- 38. Most recent order per customer
SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn
    FROM Orders
) sub
WHERE rn = 1;

-- 39. Product purchased by most customers
SELECT ProductID, COUNT(DISTINCT CustomerID) AS Buyers
FROM Orders
GROUP BY ProductID
ORDER BY Buyers DESC
LIMIT 1;

-- 40. Customer who ordered most products (variety)
SELECT CustomerID, COUNT(DISTINCT ProductID) AS ProductTypes
FROM Orders
GROUP BY CustomerID
ORDER BY ProductTypes DESC
LIMIT 1;
