USE komkovfirstdb;

# Задание 1
# Используя операторы языка SQL, создайте таблицу “sales”.
# Заполните ее данными.

CREATE TABLE sales (
    id INT PRIMARY KEY,
    order_date DATE,
    bucket VARCHAR(50)
);

SELECT * FROM sales;

INSERT INTO sales (id, order_date, bucket)
VALUES
    (1, '2021-01-01', '101 to 300'),
    (2, '2021-01-02', '101 to 300'),
    (3, '2021-01-03', 'less than equal to 100'),
    (4, '2021-01-04', '101 to 300'),
    (5, '2021-01-05', 'greater than 300');

SELECT * FROM sales;

# Задание 2
# Разделите  значения поля “bucket” на 3 сегмента: меньше 100(“Маленький
# заказ”), 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)

SELECT
    id,
    order_date,
    bucket,
    CASE
        WHEN bucket = 'less than equal to 100' THEN 'Маленький заказ'
        WHEN bucket = '101 to 300' THEN 'Средний заказ'
        WHEN bucket = 'greater than 300' THEN 'Большой заказ'
        ELSE 'Неизвестный заказ'
    END AS order_segment
FROM sales;



