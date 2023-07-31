/*
Задача 3. В зависимости от поля “grade”, установите еще один столбец с именем
class в зависимости от значений:
A++ – DISTINCTION,
A+ – FIRST CLASS,
A – ECOND CLASS,
B+ – SECOND CLASS,
C+ – THIRD CLASS,
ALL OTHERS – FAIL
*/

USE komkovfirstdb;

CREATE DATABASE Sem2Task2;

CREATE TABLE student_grades
(
stud_id INT,
total_marks INT,
grade VARCHAR(10)
);

SELECT * FROM student_grades;

# CASE улучшенная вариация IF
# sg.* - альяс

SELECT sg.*, CASE
    WHEN grade = 'A++' THEN 'DISTINCTION'
    WHEN grade = 'A+' THEN 'FIRST CLASS'
    WHEN grade = 'A' THEN 'SECOND CLASS'
    WHEN grade = 'B+' THEN 'SECOND CLASS'
    WHEN grade = 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL' END AS class_grade
FROM student_grades sg;

ALTER TABLE student_grades
ADD COLUMN class VARCHAR(50);

SELECT sg.*, CASE
    WHEN grade = 'A++' THEN 'DISTINCTION'
    WHEN grade = 'A+' THEN 'FIRST CLASS'
    WHEN grade = 'A' THEN 'SECOND CLASS'
    WHEN grade = 'B+' THEN 'SECOND CLASS'
    WHEN grade = 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL' END AS class_grade
FROM student_grades sg;

UPDATE student_grades
SET class = CASE
    WHEN grade = 'A++' THEN 'DISTINCTION'
    WHEN grade = 'A+' THEN 'FIRST CLASS'
    WHEN grade = 'A' THEN 'SECOND CLASS'
    WHEN grade = 'B+' THEN 'SECOND CLASS'
    WHEN grade = 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL' END

SELECT * FROM student_grades;
