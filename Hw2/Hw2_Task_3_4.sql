USE komkovfirstdb;

# Задание 3
# Создайте таблицу “orders”, заполните ее значениями.

CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    employeeid VARCHAR(10),
    amount DECIMAL(10, 2),
    orderstatus VARCHAR(20)
);

SELECT * FROM orders;

INSERT INTO orders (orderid, employeeid, amount, orderstatus)
VALUES
    (1, 'e03', 15.00, 'OPEN'),
    (2, 'e01', 25.50, 'OPEN'),
    (3, 'e05', 100.70, 'CLOSED'),
    (4, 'e02', 22.18, 'OPEN'),
    (5, 'e04', 9.50, 'CANCELLED'),
    (6, 'e04', 99.99, 'OPEN');

SELECT * FROM orders;

# Покажите “полный” статус заказа, используя оператор CASE

SELECT
    orderid,
    orderstatus,
    CASE
        WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
        WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
        WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'
        ELSE 'Unknown order status.'
    END AS order_summary
FROM orders;

# Задание 4
# Чем NULL отличается от 0?

/*
У NULL отсутствует значение, он не относится к числовому типу данных, в
отличии от 0, которое является конкретным числовым значением. Из этого следует,
что NULL не относится  к числовому типу данных, а 0 - относится и с ним можно
выполнять математические операции, 0 ведет себя как любое другое число, при
этом, результат операция с NULL всегда NULL.
*/
