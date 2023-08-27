CREATE DATABASE Les5;

USE Les5;

CREATE TABLE sales
(
    sales_employee VARCHAR(50)    NOT NULL,
    fiscal_year    INT            NOT NULL,
    sale           DECIMAL(14, 2) NOT NULL,
    PRIMARY KEY (sales_employee, fiscal_year)
);

INSERT INTO sales (sales_employee, fiscal_year, sale)
VALUES ('Bob', 2016, 100),
       ('Bob', 2017, 150),
       ('Bob', 2018, 200),
       ('Alice', 2016, 150),
       ('Alice', 2017, 100),
       ('Alice', 2018, 200),
       ('John', 2016, 200),
       ('John', 2017, 150),
       ('John', 2018, 2500);

SELECT *
FROM sales;

UPDATE sales
SET `sale` = 250
WHERE sales_employee = 'John';

SELECT *
FROM sales;

SELECT SUM(sale)
FROM sales;

-- Общий объем продаж по финансовым годам:
SELECT sales.fiscal_year, SUM(sales.sale) AS total_sales
FROM sales
GROUP BY sales.fiscal_year;


CREATE TABLE Orders
(
    Date        DATE        NOT NULL,
    Medium      VARCHAR(50) NOT NULL,
    Conversions INTEGER     NOT NULL
);

SELECT *
FROM Orders;

SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions) OVER () AS 'Sum'
FROM Orders;

SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions) OVER (PARTITION BY Date) AS 'Sum'
FROM Orders;

SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions) OVER (PARTITION BY Date ORDER BY Medium) AS 'Sum'
FROM Orders;

SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions)
           OVER (PARTITION BY Date ORDER BY Conversions ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS 'Sum'
FROM Orders;

-- Пример использования агрегатных функций с оконной конструкцией OVER:
SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions)
           OVER (PARTITION BY Date ORDER BY Conversions ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS 'Sum'
FROM Orders;

-- Пример использования агрегатных функций с оконной конструкцией OVER:
SELECT Date,
       Medium,
       Conversions,
       SUM(Conversions) OVER (PARTITION BY Date) AS 'Sum',
       COUNT(Conversions) OVER (PARTITION BY Date) AS 'Count',
       AVG(Conversions) OVER (PARTITION BY Date) AS 'Avg',
       MAX(Conversions) OVER (PARTITION BY Date) AS 'Max',
       MIN(Conversions) OVER (PARTITION BY Date) AS 'Min'
FROM Orders;

SELECT Date,
       Medium,
       Conversions,
       ROW_NUMBER() OVER (PARTITION BY Date ORDER BY Conversions) AS 'ROW_NUMBER',
       RANK() OVER (PARTITION BY Date ORDER BY Conversions) AS 'Rank',
       DENSE_RANK() OVER (PARTITION BY Date ORDER BY Conversions) AS 'Dense_Rank',
       NTILE(3) OVER (PARTITION BY Date ORDER BY Conversions) AS 'Ntile'
FROM Orders;

-- Функции смещения
SELECT
    Date,
    Medium,
    Conversions,
    LAG(Conversions) OVER(PARTITION BY Date ORDER BY Date) AS 'Lag',
    LEAD(Conversions) OVER (PARTITION BY Date ORDER BY Date) AS 'Lead',
    FIRST_VALUE(Conversions) OVER (PARTITION BY Date ORDER BY Date) AS 'Last_Value'
FROM Orders;

USE komkovfirstdb;
SELECT * FROM komkovfirstdb.products;

-- создание представления (например для телефонов марки apple:
CREATE VIEW CopyProducts AS
    SELECT Price, ProductCount, Manufacturer
FROM products
WHERE Manufacturer = "Apple";

-- вывод вертуальной таблицы
SELECT * FROM CopyProducts;

-- удаление вертуальной таблицы
DROP VIEW CopyProducts;

CREATE TABLE Test
(
    id INT,
    Count INT
);

DROP TABLE Test;

-- добавление в таблицу нового поля
ALTER VIEW CopyProducts AS
    SELECT Price, ProductCount, Manufacturer, ProductName
FROM products
WHERE Manufacturer = "Apple";

SELECT * FROM CopyProducts;

ALTER TABLE products ADD COLUMN TestString VARCHAR(40);

SELECT * FROM products;

-- удаление колонки
