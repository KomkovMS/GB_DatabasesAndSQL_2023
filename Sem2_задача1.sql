/*
Базы данных и SQL (семинары)
Урок 2. SQL – создание объектов, простые запросы выборки
*/

# Создать таблицу с подборкой фильмов. Связать с произвольной табличкой ключом
# Например, в таблице создаются следующие столбцы:
# 1. уникальный идентификатор фильма,
# 2. название фильма
# 3. год выхода
# 4. длительность фильма в минутах
# 5. сюжетная линия, небольшое описание фильма
# Все поля имеют ограничение NOT NULL. Первичный ключ PRIMARY KEY – поле id.


USE komkovfirstdb;
CREATE DATABASE movies;

CREATE TABLE Movies
(
Id INT PRIMARY KEY,
Title VARCHAR(200) NOT NULL,
Year INT NOT NULL,
Running_time_min INT NOT NULL,
Storyline VARCHAR(512) NOT NULL
);

# Создаем дополнительные таблицы для связи по ключам:

CREATE TABLE genres(    # genres - жанры
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE movie_genre(
    genre_id INT NOT NULL,
    movie_id INT NOT NULL,
    PRIMARY KEY (genre_id, movie_id)
);

SELECT * FROM movie_genre;

# Заполните табличку тестовыми данными, используя оператор INSERT INTO

INSERT INTO Movies
    (Id, Title, Year, Running_time_min, Storyline)
VALUES
    (1, 'Harry Potter and the Philosophers Stone', 2001, 152, 'An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terhble evil that haunts the magical world'),
    (2, 'Harry Potter and he Chamber of Secrets', 2002, 162, 'An ancient prophecy seems to be coming true when a mysterious presence begins stalking the corridors of a school of magic and leaving its victims paralyzed.'),
    (3, 'The Green Mile', 1999, 188, 'Death Row guards at a penitentiary, in the 1930s, have a moral dilemma with their job when they discover one of their prisoners, a convicted murderer, has a special gift.'),
    (4, 'Forrest Gump', 1994, 142, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.'),
    (5, 'Cast Away', 2000, 143, 'A FedEx executive undergoes a physical and emotional transformation after crash landing on a deserted island.');

SELECT * FROM Movies;

# Переименование делается с помощью команды RENAME TABLE.
# RENAME TABLE old_name TO new_name;


# RENAME TABLE films to Movies;

SELECT * FROM Movies;

# Для добавления нового столбца нам понадобится команда ADD
# ALTER TABLE cinema
# ADD Language VARCHAR(50) NULL;

ALTER TABLE Movies
ADD Language VARCHAR(50) NULL;

SELECT * FROM Movies;

# Чтобы удалить столбец в MySQL используется ALTER TABLE с DROP COLUMN:
# ALTER TABLE cinema
# DROP COLUMN Language;

ALTER TABLE Movies
DROP COLUMN Language;

# DDL: create, alter, drop --- table, database, column

# DML: select, insert, update, delete --- table

# С помощью DROP TABLE можно полностью удалить таблицу из базы данных:
# DROP TABLE cinema;

# Для добавления  внешнего ключа воспользуемся уже знакомой нам командой ADD:
# ALTER TABLE cinema
# ADD FOREIGN KEY(producer_id) REFERENCES producer(Id);

# Если надо очистить таблицу от данных используется команда TRUNCATE TABLE:
# TRUNCATE TABLE cinema;

