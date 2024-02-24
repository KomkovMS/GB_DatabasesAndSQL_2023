DROP DATABASE IF EXISTS LESSON_first;
CREATE DATABASE LESSON_first;
USE LESSON_first;

CREATE TABLE students (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_student VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number BIGINT
);

CREATE TABLE teachers (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_teacher VARCHAR(45) NOT NULL,
    post VARCHAR(100)
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name_courses VARCHAR(100) NOT NULL,
    name_student VARCHAR(45),
    name_teacher VARCHAR(45)
);

INSERT INTO students (name_student, email, phone_number) VALUES
('Миша', 'misha@gmail.com', 89044563432),
('Маша', 'masha@gmail.com', 89074563432),
('Антон', 'anton@gmail.com', 88004563432),
('Сергей', 'serj@gmail.com', 89074678432),
('Павел', 'pav@gmail.com', 89832563432);

SELECT * FROM students;

INSERT INTO teachers (name_teacher, post) VALUES
('Иванов', 'Профессор'),
('Петров', 'Профессор'),
('Антонов', 'Доцент'),
('Сергеев', 'Ассистент'),
('Павлов', 'Лаборант');

SELECT * FROM teachers;

INSERT INTO courses (name_courses, name_student, name_teacher) VALUES
('Базы данных и SQL', 'Миша', 'Иванов'),
('Аналитика', 'Сергей', 'Петров'),
('Python', 'Павел', 'Сергеев');

SELECT * FROM courses;

/*

 1. Получить список с информацией обо всех
студентах
 2. Получить список всех студентов с именем
“Антон”(или любого существующего студента)
 3. Вывести имя и почту из таблички
"Студент"
 4.Выбрать студентов, фамилии которых
начинаются с буквы «М».

 */

SELECT name_student, email, phone_number FROM students;

SELECT name_student, email, phone_number
FROM students
WHERE name_student='Сергей';

SELECT name_student, email FROM students;

SELECT name_student
FROM students
WHERE name_student LIKE 'М%';

SELECT name_student
FROM students
WHERE name_student LIKE '%ш%';

/*
Задание 2.
 */

DROP TABLE IF EXISTS workers;
CREATE TABLE workers (
id INT NOT NULL PRIMARY KEY,
name_worker VARCHAR(45),
dept VARCHAR(100) COMMENT 'Подразделение', -- COMMENT на случай, если имя неочевидное,
salary INT
);

INSERT INTO workers (id, name_worker, dept, salary)
VALUES
(100, 'AndreyEx', 'Sales', 5000),
(200, 'Boris', 'IT', 5500),
(300, 'Anna', 'IT', 7000),
(400, 'Anton', 'Marketing', 9500),
(500, 'Dima', 'IT', 6000),
(501, 'Maxs', 'Accounting', NULL);

SELECT * FROM workers;

/*

1. Выбрать всех сотрудников,у которых зарплата
больше 6000
2. Покажите всех сотрудников, которые
принадлежат к отделу IT.
3. Отобразите всех сотрудников, который НЕ
принадлежат к отделу IT

 */

SELECT id, name_worker, dept, salary
FROM workers
WHERE salary > 6000;

SELECT id, name_worker, dept, salary
FROM workers
WHERE dept='IT';

SELECT id, name_worker, dept, salary
FROM workers
WHERE dept!='IT';
