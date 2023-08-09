USE komkovfirstdb;

CREATE TABLE Salary
(
id INT KEY AUTO_INCREMENT NOT NULL,
name_s VARCHAR(30) NOT NULL,
surname VARCHAR(30) NOT NULL,
specialty VARCHAR(30) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

SELECT * FROM Salary;

INSERT INTO Salary (name_s, surname, specialty, seniority, salary, age)
VALUES
    ('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
    ('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

# Выведите все записи, отсортированные по полю "age" по возрастанию
SELECT  *
FROM Salary
ORDER BY age;

# Выведите все записи, отсортированные по полю "name"
SELECT  *
FROM Salary
ORDER BY name_s;

# Выведите записи полей "name", "surname","age",
# отсортированные по полю "name" в алфавитном порядке по убыванию
SELECT name_s, surname, age
FROM Salary
ORDER BY name_s
DESC;

# Выполните сортировку по полям "name" и "age" по убыванию
SELECT *
FROM Salary
ORDER BY name_s DESC , age DESC;

# Операторы сортировки.
# DISTINCT, LIMIT

# DISTINCT:
# SELECT DISTINCT поле1, поле2, ...
# FROM имя_таблицы;

# LIMIT:
# LIMIT[смещение_относительно_начала,]
# количество_извлекаемых_строк

-- Выведите уникальные (неповторяющиеся) значения полей "name"
SELECT DISTINCT name_s FROM Salary;

-- Выведите первые две первые записи из таблицы
SELECT * FROM Salary LIMIT 2;

-- Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4)
-- и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
SELECT * FROM Salary LIMIT 4, 3;

-- Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие
-- за ними 3 строки (где id=10, id=9, id=8)
SELECT * FROM Salary ORDER BY id DESC
LIMIT 2, 3;



