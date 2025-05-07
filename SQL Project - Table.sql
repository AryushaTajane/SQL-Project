CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1, 'Arya Sharma', 'Female', 'Mumbai', '2023-01-15'),
(2, 'Rahul Mehta', 'Male', 'Delhi', '2023-01-20'),
(3, 'Sneha Rao', 'Female', 'Bangalore', '2023-01-25'),
(4, 'Ravi Patil', 'Male', 'Pune', '2023-02-01'),
(5, 'Neha Jain', 'Female', 'Hyderabad', '2023-02-05'),
(6, 'Aman Verma', 'Male', 'Chennai', '2023-02-10'),
(7, 'Divya Kapoor', 'Female', 'Kolkata', '2023-02-15'),
(8, 'Mohit Singh', 'Male', 'Ahmedabad', '2023-02-20'),
(9, 'Pooja Iyer', 'Female', 'Indore', '2023-02-25'),
(10, 'Kunal Desai', 'Male', 'Jaipur', '2023-03-01'),
(11, 'Riya Gupta', 'Female', 'Lucknow', '2023-03-05'),
(12, 'Aakash Thakur', 'Male', 'Bhopal', '2023-03-10'),
(13, 'Meera Das', 'Female', 'Bhubaneswar', '2023-03-15'),
(14, 'Saurabh Yadav', 'Male', 'Kanpur', '2023-03-20'),
(15, 'Anita Joshi', 'Female', 'Nagpur', '2023-03-25'),
(16, 'Nikhil Saxena', 'Male', 'Surat', '2023-03-30'),
(17, 'Kritika Roy', 'Female', 'Varanasi', '2023-04-01'),
(18, 'Anuj Bansal', 'Male', 'Amritsar', '2023-04-05'),
(19, 'Isha Kaur', 'Female', 'Patna', '2023-04-10'),
(20, 'Raghav Chawla', 'Male', 'Chandigarh', '2023-04-15'),
(21, 'Tanvi Nair', 'Female', 'Cochin', '2023-04-20'),
(22, 'Arjun Reddy', 'Male', 'Vizag', '2023-04-25'),
(23, 'Bhavana Rao', 'Female', 'Mysore', '2023-04-30'),
(24, 'Dev Khanna', 'Male', 'Nashik', '2023-05-01'),
(25, 'Tanya Bhatia', 'Female', 'Agra', '2023-05-05'),
(26, 'Kabir Mittal', 'Male', 'Noida', '2023-05-10'),
(27, 'Reena Paul', 'Female', 'Guwahati', '2023-05-15'),
(28, 'Jay Verma', 'Male', 'Jodhpur', '2023-05-20'),
(29, 'Mira Nambiar', 'Female', 'Thane', '2023-05-25'),
(30, 'Vivek Anand', 'Male', 'Ranchi', '2023-05-30');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Tablet', 'Electronics', 18000),
(104, 'Smartwatch', 'Accessories', 5000),
(105, 'Backpack', 'Accessories', 1500),
(106, 'Bluetooth Speaker', 'Accessories', 3500),
(107, 'Keyboard', 'Electronics', 1200),
(108, 'Mouse', 'Electronics', 800),
(109, 'Monitor', 'Electronics', 10000),
(110, 'Headphones', 'Accessories', 2200);

INSERT INTO Orders VALUES
(1001, 1, 101, '2023-02-01', 1),
(1002, 2, 102, '2023-02-05', 1),
(1003, 3, 105, '2023-02-10', 2),
(1004, 4, 110, '2023-02-12', 1),
(1005, 5, 101, '2023-02-15', 1),
(1006, 6, 103, '2023-02-20', 1),
(1007, 7, 109, '2023-02-22', 1),
(1008, 8, 104, '2023-02-25', 1),
(1009, 9, 102, '2023-03-01', 1),
(1010, 10, 107, '2023-03-05', 1),
(1011, 11, 106, '2023-03-10', 1),
(1012, 12, 108, '2023-03-12', 2),
(1013, 13, 110, '2023-03-15', 1),
(1014, 14, 102, '2023-03-18', 1),
(1015, 15, 103, '2023-03-20', 1),
(1016, 16, 105, '2023-03-22', 1),
(1017, 17, 104, '2023-03-25', 1),
(1018, 18, 106, '2023-03-28', 1),
(1019, 19, 101, '2023-04-01', 1),
(1020, 20, 108, '2023-04-04', 1),
(1021, 21, 103, '2023-04-07', 1),
(1022, 22, 107, '2023-04-10', 1),
(1023, 23, 109, '2023-04-13', 1),
(1024, 24, 105, '2023-04-16', 2),
(1025, 25, 110, '2023-04-19', 1),
(1026, 26, 102, '2023-04-22', 1),
(1027, 27, 108, '2023-04-25', 1),
(1028, 28, 101, '2023-04-28', 1),
(1029, 29, 104, '2023-05-01', 1),
(1030, 30, 109, '2023-05-03', 1),
(1031, 1, 102, '2023-05-06', 1),
(1032, 2, 110, '2023-05-09', 1),
(1033, 3, 103, '2023-05-12', 1),
(1034, 4, 104, '2023-05-15', 1),
(1035, 5, 108, '2023-05-18', 1),
(1036, 6, 105, '2023-05-21', 2),
(1037, 7, 102, '2023-05-24', 1),
(1038, 8, 110, '2023-05-27', 1),
(1039, 9, 103, '2023-05-30', 1),
(1040, 10, 109, '2023-06-01', 1);





