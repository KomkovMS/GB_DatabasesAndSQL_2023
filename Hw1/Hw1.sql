USE komkovfirstdb;

# Задание 1
CREATE TABLE ProdPhone
(
Id INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price DECIMAL
);

SELECT * FROM ProdPhone;

INSERT INTO ProdPhone (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxv S9', 'Samsung', 2, 66000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000),
('iPhone 12', 'Apple', 4, 92000),
('Galaxy S21', 'Samsung', 8, 65000),
('Pixel 5', 'Google', 8, 63000),
('9 Pro', 'OnePlus', 12, 48000),
('Mi 11', 'Xiaomi', 4, 33000);

SELECT * FROM ProdPhone;

# Задание 2
SELECT ProductName, Manufacturer, Price
FROM ProdPhone
WHERE Manufacturer = 2;

# Задание 3
SELECT *
FROM ProdPhone
WHERE Manufacturer = 'Samsung';

# Задание 4
# 4.1 Товары, в которых есть упоминание "Iphone":
SELECT * FROM ProdPhone
WHERE ProductName LIKE '%Iphone%';

# 4.2 Товары, в которых есть упоминание "Samsung":
SELECT * FROM ProdPhone
WHERE Manufacturer LIKE '%Samsung%';

# 4.3 Товары, в которых есть ЦИФРЫ:
# SELECT * FROM ProdPhone
# WHERE ProductName LIKE '%[0-9]%'; ??????

SELECT * FROM ProdPhone
WHERE ProductName REGEXP '0|1|2|3|4|5|6|7|8|9';

SELECT * FROM ProdPhone
WHERE ProductName REGEXP '[[:digit:]]';

# 4.4 Товары, в которых есть ЦИФРА "8"
SELECT * FROM ProdPhone
WHERE ProductName LIKE '%8%';
