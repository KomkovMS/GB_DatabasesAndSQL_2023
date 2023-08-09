use komkovfirstdb;

CREATE TABLE Salespeople
(
    snum INT NOT NULL,
    sname VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    comm VARCHAR(10)
);

CREATE TABLE Customers
(
    cnum INT NOT NULL,
    cname VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL
);

CREATE TABLE ORDERS_TAB
(
    onum INT NOT NULL,
    amt DECIMAL NOT NULL,
    odate VARCHAR(20) NOT NULL,
    cnum INT NOT NULL,
    snum INT NOT NULL
);

SELECT * FROM Salespeople, Customers, ORDERS_TAB;

INSERT INTO Salespeople (snum, sname, city, comm)
VALUES
    (1001, 'Peel', 'London', '.12'),
    (1002, 'Serres', 'San Jose', '.13'),
    (1004, 'Motika', 'London', '.11'),
    (1007, 'Rifkin', 'Barselona', '.15'),
    (1003, 'Axelrod', 'New York', '.10');

INSERT INTO Customers (cnum, cname, city, rating, snum)
VALUES
    (2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'San Jose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'San Jose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);

INSERT INTO ORDERS_TAB (onum, amt, odate, cnum, snum)
VALUES
    (3001, 18.69, '10/03/1990', 2008, 1007),
    (3003, 767.19, '10/03/1990', 2001, 1001),
    (3002, 1900.10, '10/03/1990', 2007, 1004),
    (3005, 5160.45, '10/03/1990', 2003, 1002),
    (3006, 1098.16, '10/03/1990', 2008, 1007),
    (3009, 1713.23, '10/04/1990', 2002, 1003),
    (3007, 75.75, '10/04/1990', 2004, 1002),
    (3008, 4723.00, '10/05/1990', 2006, 1001),
    (3010, 1309.95, '10/06/1990', 2004, 1002),
    (3011, 9891.88, '10/06/1990', 2006, 1001);

SELECT * FROM Salespeople;
SELECT * FROM Customers;
SELECT * FROM ORDERS_TAB;

# Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
# city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm
FROM Salespeople;

# Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую
# именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating, cname
FROM Customers
WHERE city = 'San Jose';

# Напишите запрос, который вывел бы значения snum всех продавцов из таблицы
# заказов без каких бы то ни было повторений. (уникальные значения в  “snum“
# “Продавцы”)
SELECT DISTINCT snum
FROM ORDERS_TAB;

# Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы
# G. Используется оператор "LIKE": (“заказчики”)
# https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
SELECT *
FROM Customers
WHERE cname LIKE 'G%';

# Напишите запрос, который может дать вам все заказы со значениями суммы выше
# чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT *
FROM ORDERS_TAB
WHERE amt > 1000;

# Напишите запрос который выбрал бы наименьшую сумму заказа.
#  (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) AS min_order_amount
FROM ORDERS_TAB;

# Напишите запрос к таблице “Заказчики”, который может показать всех
# заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT *
FROM Customers
WHERE rating > 100 AND city <> 'Rome';

