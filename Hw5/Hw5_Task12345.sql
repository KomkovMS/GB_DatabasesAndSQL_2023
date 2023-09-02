CREATE DATABASE KomkovMS_Hw5;

USE KomkovMS_Hw5;

create table Cars
(
    Id  int primary key,
    Name varchar(30),
    Cost  INT
);

INSERT INTO Cars (Id, Name, Cost)
VALUES (1, 'Audi', 52642),
       (2, 'Mercedes', 57127),
       (3, 'Skoda', 9000),
       (4, 'Volvo', 29000),
       (5, 'Bentley', 350000),
       (6, 'Citroen', 21000),
       (7, 'Hummer', 41400),
       (8, 'Volkswagen', 21600);

SELECT * FROM Cars;

-- SQL – оконные функции
# 1. Создайте представление, в которое попадут автомобили стоимостью
# до 25 000 долларов

CREATE VIEW CarsUnder25000 AS
SELECT Id, Name, Cost
FROM Cars
WHERE Cost <= 25000;

SELECT * FROM CarsUnder25000;

# 2. Изменить в существующем представлении порог для стоимости: пусть цена будет
# до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW CarsUnder25000 AS
SELECT Id, Name, Cost
FROM Cars
WHERE Cost <= 30000;

SELECT * FROM CarsUnder25000;

# 3. Создайте представление, в котором будут только автомобили марки
# “Шкода” и “Ауди”

CREATE VIEW SkodaAudiCars AS
SELECT Id, Name, Cost
FROM Cars
WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM SkodaAudiCars;

# 4. Вывести название и цену для всех анализов, которые продавались
# 5 февраля 2020 и всю следующую неделю.
#
# Есть таблица анализов Analysis:
# an_id — ID анализа;
# an_name — название анализа;
# an_cost — себестоимость анализа;
# an_price — розничная цена анализа;
# an_group — группа анализов.
# Есть таблица групп анализов Groups:
# gr_id — ID группы;
# gr_name — название группы;
# gr_temp — температурный режим хранения.
# Есть таблица заказов Orders:
# ord_id — ID заказа;
# ord_datetime — дата и время заказа;
# ord_an — ID анализа.

CREATE TABLE AnalysisGroups (
    gr_id INT PRIMARY KEY,
    gr_name VARCHAR(255),
    gr_temp VARCHAR(255)
);

INSERT INTO AnalysisGroups (gr_id, gr_name, gr_temp)
VALUES
    (1, 'Группа 1', 'Температурный режим 1'),
    (2, 'Группа 2', 'Температурный режим 2'),
    (3, 'Группа 3', 'Температурный режим 3');

CREATE TABLE Analysis (
    an_id INT PRIMARY KEY,
    an_name VARCHAR(255),
    an_cost DECIMAL(10, 2),
    an_price DECIMAL(10, 2),
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES AnalysisGroups(gr_id)
);

INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES
    (1, 'Анализ 1', 50.00, 100.00, 1),
    (2, 'Анализ 2', 60.00, 120.00, 1),
    (3, 'Анализ 3', 45.00, 90.00, 2),
    (4, 'Анализ 4', 55.00, 110.00, 2),
    (5, 'Анализ 5', 70.00, 140.00, 3);

CREATE TABLE Orders (
    ord_id INT PRIMARY KEY,
    ord_datetime DATETIME,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
    (1, '2023-09-01 10:00:00', 1),
    (2, '2023-09-01 11:30:00', 3),
    (3, '2023-09-02 09:15:00', 2),
    (4, '2023-09-02 14:45:00', 4),
    (5, '2023-09-03 16:20:00', 5);

SELECT * FROM Orders;

# INSERT INTO Orders (ord_id, ord_datetime, ord_an)
# VALUES
#     (6, '2020-02-05 10:00:00', 1),
#     (7, '2020-02-06 12:30:00', 2),
#     (8, '2020-02-07 14:15:00', 3),
#     (9, '2020-02-08 09:45:00', 4),
#     (10, '2020-02-09 16:30:00', 5);
# INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
# VALUES
#     (6, 'Анализ 6', 55.00, 110.00, 3),
#     (7, 'Анализ 7', 65.00, 120.00, 1),
#     (8, 'Анализ 8', 65.00, 98.00, 3),
#     (9, 'Анализ 9', 54.00, 119.00, 1),
#     (10, 'Анализ 10', 78.00, 140.00, 2);
# UPDATE Orders
# SET ord_an = CASE
#     WHEN ord_id = 6 THEN 6
#     WHEN ord_id = 7 THEN 7
#     WHEN ord_id = 8 THEN 8
#     WHEN ord_id = 9 THEN 9
#     WHEN ord_id = 10 THEN 10
#     ELSE ord_an
# END
# WHERE ord_id IN (6, 7, 8, 9, 10);

SELECT A.an_name, A.an_price
FROM Analysis A
INNER JOIN Orders O ON A.an_id = O.ord_an
WHERE DATE(O.ord_datetime) BETWEEN
    '2020-02-05' AND DATE_ADD('2020-02-05', INTERVAL 7 DAY);

# 5. Добавьте новый столбец под названием «время до следующей станции».
# Чтобы получить это значение, мы вычитаем время станций для пар смежных
# станций.
#
# Мы можем вычислить это значение без использования оконной функции SQL, но
# это может быть очень сложно. Проще это сделать с помощью оконной функции
# LEAD . Эта функция сравнивает значения из одной строки со следующей строкой,
# чтобы получить результат. В этом случае функция сравнивает значения в
# столбце «время» для станции со станцией сразу после нее.

CREATE TABLE station (
    train_id INT,
    station VARCHAR(20),
    station_time DATETIME,
    time_to_next_station TIME
);

INSERT INTO station (train_id, station, station_time, time_to_next_station)
VALUES
    (110, 'San Francisco', '2023-09-02 10:00:00', '00:54:00'),
    (110, 'Redwood City', '2023-09-02 10:54:00', '00:08:00'),
    (110, 'Palo Alto', '2023-09-02 11:02:00', '01:33:00'),
    (110, 'San Jose', '2023-09-02 12:35:00', NULL),
    (120, 'San Francisco', '2023-09-02 11:00:00', '01:49:00'),
    (120, 'Palo Alto', '2023-09-02 12:49:00', '00:41:00'),
    (120, 'San Jose', '2023-09-02 13:30:00', NULL);

SELECT * FROM station;

ALTER TABLE station
ADD COLUMN time_to_next_station_interval TIME;

SELECT * FROM station;

UPDATE station AS s
JOIN (
    SELECT train_id, station_time,
           LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time) AS next_station_time
    FROM station
) AS lead_data ON s.train_id = lead_data.train_id AND s.station_time = lead_data.station_time
SET s.time_to_next_station_interval = TIMEDIFF(lead_data.next_station_time, s.station_time);

SELECT * FROM station;



