SELECT * FROM komkovfirstdb.products
ORDER BY Price;

SELECT ProductName, ProductCount * Price AS TotalSum
FROM products
ORDER BY TotalSum;

SELECT * FROM komkovfirstdb.products
LIMIT 3;

# Или выберем три строчки, начиная со 2 позиции:

SELECT * FROM komkovfirstdb.products
LIMIT 2, 3;

SELECT DISTINCT Manufacturer FROM products;

SELECT DISTINCT Manufacturer, ProductCount FROM products;

SELECT  Manufacturer, COUNT(*) AS ModelsCount
FROM products
GROUP BY Manufacturer;

-- На этапе выборки можно применять фильтрацию. Например, найти среднюю
-- цену для товаров определенного производителя:
SELECT AVG(Price) AS Average_Price FROM products;

-- Определить, сколько строчек в таблице
SELECT COUNT(*) FROM products;

-- Найдем минимальную и максимальную цену
SELECT MIN(Price), MAX(Price) FROM products;

-- Найдем все группы товаров по производителям, для которых определено
-- более 1 модели
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM products
GROUP BY Manufacturer
HAVING COUNT(*) > 1;

-- С начало выберем те товары, общая стоимость которых больше 80000.
-- Затем выбранные товары сгруппируем по производителям.
-- Далее отфильтруем сами группы - выберем те группы, которые содержат больше
-- 1 модели.
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING COUNT(*) > 1;

SELECT * FROM products;

INSERT INTO products (ProductName, Manufacturer, ProductCount, Price)
VALUES
    ('iPhone 7', 'Apple', 5, 32000),
    ('Honor 10', 'Huawei', 5, 28000),
    ('Nokia 8', 'HMD Global', 6, 38000);

SELECT * FROM products;

-- Выберем всех производителей, кол-во моделей, и найдем сумму всех единиц
-- товара заданной марки (например, Apple)
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING SUM(ProductCount) > 2
ORDER BY Units DESC;

-- Напишем запрос, который отсортирует цену по возрастанию (от меньшего)
-- ASC (по умолчанию не указываем)
SELECT  *
FROM products
ORDER BY Price;

-- Напишем запрос, который отсортирует цену по убыванию (от большего) DESC
SELECT  *
FROM products
ORDER BY Price DESC;

-- Получение записей из таблицы COUNT
-- Получим содержимое таблицы products (узнаем сколько там столбцов)
SELECT COUNT(*)
FROM products;

SELECT COUNT(*) As Sum
FROM products;

-- TOP (в MySQL LIMIT) с одним параметром
-- Выберем первые 5 строк таблицы
SELECT * FROM products
LIMIT 5;

-- с двумя параметрами (1 - пропуск строчек, 2 - с какой строки выводим
-- итоговый результат
SELECT * FROM products
LIMIT 2,3;

-- SUM, получим стоимость все телефонов
SELECT SUM(Price) AS TotalSum FROM products;

-- Min, Max
-- Найдем минимальную сумму по производителю Apple и минимальную по
-- производителю Huawei
SELECT MIN(Price)
FROM products
WHERE Manufacturer = 'Apple';

SELECT MAX(Price)
FROM products
WHERE Manufacturer = 'Huawei';

-- Получим статистику по смартфонам Samsung (минимальную, максимальнуи и
-- среднюю цену)
SELECT MIN(Price), MAX(Price), AVG(Price)
FROM products
WHERE Manufacturer = 'Samsung';

-- Контрольная
SELECT Manufacturer, COUNT(*)
FROM products
WHERE Price > 40000
GROUP BY Manufacturer;

