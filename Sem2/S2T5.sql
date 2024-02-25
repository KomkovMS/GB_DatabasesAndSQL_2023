USE LESSON_two;

SELECT
    id as 'номер фильма',
    title as 'название фильма',
    count_min as 'продолжительность фильма',
    IF (count_min < 50, 'Короткометражный фильм',
        IF (count_min BETWEEN 50 AND 100, 'Среднеметражный фильм',
            IF (count_min > 100, 'Полнометражный фильм','Не определено'))) as 'Метраж'
FROM cinema;



#
#         WHEN count_min < 50 THEN 'Короткометражный фильм'
#         WHEN count_min BETWEEN 50 AND 100 THEN 'Среднеметражный фильм'
#         WHEN count_min > 100 THEN 'Полнометражный фильм'
#         ELSE 'Не определеноо'
#     END AS 'Метраж'
# FROM cinema;

