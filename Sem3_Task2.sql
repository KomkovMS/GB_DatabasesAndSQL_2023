use komkovfirstdb;

# Агрегатные функции. Таблица для работы

CREATE TABLE employee_tbl
(
    id INT NOT NULL,
    name_e VARCHAR(10) NOT NULL,
    work_date DATE NOT NULL,
    daily_typing_pages INT NOT NULL
);

SELECT * FROM employee_tbl;

INSERT INTO employee_tbl (id, name_e, work_date, daily_typing_pages)
VALUES
    (1, 'John', '2007-01-24', 250),
    (2, 'Ram', '2007-05-27', 220),
    (3, 'Jack', '2007-05-06', 170),
    (3, 'Jack', '2007-04-06', 100),
    (4, 'Jill', '2007-04-06', 220),
    (5, 'Zara', '2007-06-06', 300),
    (5, 'Zara', '2007-02-06', 350);

SELECT * FROM employee_tbl;

# Рассчитайте общее количество всех страниц dialy_typing_pages
SELECT SUM(daily_typing_pages) FROM employee_tbl;

# Выведите общее количество напечатанных страниц каждым человеком
# (с помощью предложения GROUP BY)
SELECT name_e, SUM(daily_typing_pages) FROM employee_tbl GROUP BY name_e;

# Посчитайте количество записей в таблице
SELECT COUNT(*) FROM employee_tbl;

# Выведите имена, которые являются уникальными
SELECT DISTINCT name_e FROM employee_tbl;

# Выведите количество имен, которые являются уникальными
SELECT COUNT(DISTINCT name_e) FROM employee_tbl;

# Найдите среднее арифметическое по количеству ежедневных страниц для набора
# (daily_typing_pages)
SELECT AVG(daily_typing_pages) FROM employee_tbl;