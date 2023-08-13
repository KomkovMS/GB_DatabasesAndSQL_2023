use komkovfirstdb;

SELECT 1, 2 UNION SELECT 'a', 'b';

CREATE TABLE CustomerS_1
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    AccountSum DECIMAL
);

CREATE TABLE Employees
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL
);

INSERT INTO CustomerS_1 (FirstName, LastName, AccountSum)
VALUES
    ('Tom', 'Smith', 2000),
    ('Sam', 'Brown', 3000),
    ('Mark', 'Adams', 2500),
    ('Paul', 'Ins', 4200),
    ('John', 'Smith', 2800),
    ('Tim', 'Cook', 2800),
    ('Tom', 'Smith', 2000),
    ('Sam', 'Brown', 3000),
    ('Mark', 'Adams', 2500),
    ('Paul', 'Ins', 4200),
    ('Tim', 'Cook', 2800),
    ('Tom', 'Smith', 2000),
    ('Sam', 'Brown', 3000),
    ('Mark', 'Adams', 2500),
    ('Paul', 'Ins', 4200),
    ('John', 'Smith', 2800),
    ('Tom', 'Smith', 2800),
    ('Tim', 'Cook', 2800);

INSERT INTO Employees (FirstName, LastName)
VALUES
    ('Tom', 'Smith'),
    ('Sam', 'Brown'),
    ('Mark', 'Adams'),
    ('Paul', 'Ins'),
    ('John', 'Smith'),
    ('Tim', 'Cook'),
    ('Tom', 'Smith'),
    ('Sam', 'Brown'),
    ('Mark', 'Adams'),
    ('Paul', 'Ins'),
    ('Tim', 'Cook'),
    ('Tom', 'Smith'),
    ('Sam', 'Brown'),
    ('Mark', 'Adams'),
    ('Paul', 'Ins'),
    ('John', 'Smith'),
    ('Tom', 'Smith'),
    ('Tim', 'Cook');

SELECT * FROM CustomerS_1;

SELECT * FROM Employees;

# Выберем сразу всех клиентов банка и его сотрудников из обеих таблиц:

SELECT FirstName, LastName
FROM CustomerS_1
UNION SELECT FirstName, LastName FROM Employees;

# UNION и сортировка с помощью ORDER by

SELECT FirstName, LastName
FROM CustomerS_1
UNION SELECT FirstName, LastName
FROM Employees
ORDER BY FirstName DESC;

# UNION ALL (удаление дубликатов не происходит):
SELECT FirstName, LastName
FROM CustomerS_1
UNION ALL SELECT FirstName, LastName
FROM Employees
ORDER BY FirstName;

# Начисление процентов на вклад
SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum
FROM CustomerS_1 WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum
FROM CustomerS_1 WHERE AccountSum >= 3000;

SELECT * FROM products;

CREATE TABLE Customers_2
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL
);

CREATE TABLE Orders_2
(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    CustomerId INT NOT NULL,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price DECIMAL NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE,
    FOREIGN KEY (CustomerId) REFERENCES customers_2(Id) ON DELETE CASCADE
);

SELECT * FROM Orders_2;

# Выберем все заказы и добавим к ним информацию о товарах:
SELECT Orders_2.CreatedAt, Orders_2.ProductCount, products.ProductName
FROM Orders_2
JOIN products ON products.Id = Orders_2.ProductId;
