USE LESSON_two;

/*
 Задача 3
 Вывести id, название фильма и категорию фильма, согласно следующего перечня:
 Д - Детская, П - подростковая, В - взрослая, Не указана
 см скрин
*/

ALTER TABLE cinema
ADD COLUMN category CHAR(1);

UPDATE cinema SET category = 'П' WHERE id = 1;
SELECT * FROM cinema;
UPDATE cinema SET category = 'Д' WHERE id = 4;
UPDATE cinema SET category = 'В' WHERE id = 5;

SELECT
    id as 'номер фильма',
    title as 'название фильма',
    CASE category
        WHEN 'П' THEN 'Подростковая'
        WHEN 'Д' THEN 'Детская'
        WHEN 'В' THEN 'Взрослая'
        ELSE 'Не указано'
    END AS 'Категория'
FROM cinema;
