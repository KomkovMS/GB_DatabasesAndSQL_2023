USE komkovfirstdb;


# Расставим студентам классы в зависимости от оценок
# Total_marks > 450 – «ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ»
# Total_marks от 400 до 450 – «ПЕРВЫЙ КЛАСС»
# Total_marks от 350 до 400 – «ВТОРОЙ КЛАСС»
# Total_marks от 300 до 350 – «ТРЕТИЙ КЛАСС»
# В противном случае - НЕУДАЧА

CREATE TABLE school_students
(
school_students_id INT,
total_marks INT,
grade VARCHAR(10),
class VARCHAR(100),
class_grade VARCHAR(100)
);

SELECT * FROM school_students;

SELECT ss.*, CASE
    WHEN total_marks > 450 THEN 'FIRST CLASS DISTINCTION'
    WHEN total_marks BETWEEN 400 AND 450 THEN 'FIRST CLASS'
    WHEN total_marks BETWEEN 350 AND 400 THEN 'SECOND CLASS'
    WHEN total_marks BETWEEN 300 AND 350 THEN 'THIRD CLASS'
    WHEN total_marks = 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL' END AS class_grade
FROM school_students ss;

SELECT * FROM school_students;

UPDATE school_students
SET class = CASE
    WHEN total_marks > 450 THEN 'FIRST CLASS DISTINCTION'
    WHEN total_marks BETWEEN 400 AND 450 THEN 'FIRST CLASS'
    WHEN total_marks BETWEEN 350 AND 400 THEN 'SECOND CLASS'
    WHEN total_marks BETWEEN 300 AND 350 THEN 'THIRD CLASS'
    WHEN total_marks = 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL' END;

SELECT * FROM school_students;

UPDATE school_students
SET class =
    CASE
        WHEN Total_marks > 450 THEN 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
        WHEN Total_marks BETWEEN 400 AND 450 THEN 'ПЕРВЫЙ КЛАСС'
        WHEN Total_marks BETWEEN 350 AND 400 THEN 'ВТОРОЙ КЛАСС'
        WHEN Total_marks BETWEEN 300 AND 350 THEN 'ТРЕТИЙ КЛАСС'
        ELSE 'НЕУДАЧА'
    END;


SELECT * FROM school_students;
