use komkovfirstdb;

CREATE TABLE name_age_salary
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name_n VARCHAR(10) NOT NULL,
    age_name VARCHAR(10) NOT NULL,
    salary_name INT NOT NULL
);

SELECT * FROM name_age_salary;

INSERT INTO name_age_salary (name_n, age_name, salary_name)
VALUES
    ('Дима', 23, 100),
    ('Петя', 23, 200),
    ('Вася', 23, 300),
    ('Коля', 24, 1000),
    ('Иван', 24, 2000);

SELECT * FROM name_age_salary;

# Сгруппируйте поля по возрасту (будет 2 группы - 23 года, 24 года ).
# Для каждой группы  найдите суммарную зарплату
SELECT age_name, SUM(salary_name) AS total_salary
FROM name_age_salary
GROUP BY age_name;

# Сгруппируйте поля по возрасту (будет 2 группы - 23 года, 24 года).
# Найдите максимальную заработную плату внутри группы
SELECT age_name, MAX(salary_name) AS max_salary
FROM name_age_salary
GROUP BY age_name;

# Сгруппируйте поля по возрасту (будет 2 группы - 23 года, 24 года).
# Найдите минимальную заработную плату внутри группы
SELECT age_name, MIN(salary_name) AS min_salary
FROM name_age_salary
GROUP BY age_name;

# Выведите  только те строки, в которых суммарная зарплата больше или равна
# 1000
SELECT age_name, SUM(salary_name) AS total_salary1000
FROM name_age_salary
GROUP BY age_name
HAVING total_salary1000 >= 1000;

# Выведите только те группы, в которых количество строк меньше или равно двум
SELECT age_name, COUNT(*) AS total_str
FROM name_age_salary
GROUP BY age_name
HAVING total_str <= 2;

# Выведите только те группы, в которых количество строк меньше или равно двум.
# Для решения используйте оператор “BETWEEN”
SELECT age_name, COUNT(*) AS row_count
FROM name_age_salary
GROUP BY age_name
HAVING row_count BETWEEN 1 AND 2;

# Выведите только те группы, в которых количество строк меньше или равно двум.
# Для решения используйте оператор “IN”
-- Выполняем подзапрос для получения возрастов с количеством строк меньше или равно двум
SELECT age_name
FROM name_age_salary
GROUP BY age_name
HAVING COUNT(*) <= 2;

-- Затем используем оператор IN для вывода только групп с выбранными возрастами
SELECT age_name, COUNT(*) AS row_count
FROM name_age_salary
WHERE age_name IN (
    SELECT age_name
    FROM name_age_salary
    GROUP BY age_name
    HAVING COUNT(*) <= 2
)
GROUP BY age_name;

# или (решение на семинаре)
SELECT age_name, COUNT(*) AS row_count
FROM name_age_salary
GROUP BY age_name
HAVING COUNT(*) IN (1, 2);


