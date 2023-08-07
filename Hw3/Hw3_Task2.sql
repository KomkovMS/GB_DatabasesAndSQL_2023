use komkovfirstdb;

# Таблица для работы (из классной работы)

/*
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

 */

SELECT * FROM Salary;

# Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM Salary
ORDER BY salary DESC;

SELECT * FROM Salary
ORDER BY salary;

# ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с
# наибольшей заработной платой (возможен подзапрос)
SELECT * FROM Salary
ORDER BY salary ASC
LIMIT 5;
SELECT * FROM Salary
WHERE salary >= (
    SELECT DISTINCT salary FROM Salary ORDER BY salary DESC LIMIT 1 OFFSET 3
)
ORDER BY salary ASC;

# Выполните группировку всех сотрудников по специальности , суммарная зарплата
# которых превышает 100000
SELECT specialty, SUM(salary) as total_salary
FROM Salary
GROUP BY specialty
HAVING total_salary > 100000;
