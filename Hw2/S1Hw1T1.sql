DROP DATABASE IF EXISTS Hw_first;
CREATE DATABASE Hw_first;
USE Hw_first;

CREATE TABLE mobile_phones (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45) NOT NULL,
    product_count INT NOT NULL,
    price INT NOT NULL
);

INSERT INTO mobile_phones (product_name, manufacturer, product_count, price) VALUES
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000)

SELECT EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_name = 'mobile_phones'
);


SELECT * FROM mobile_phones;
