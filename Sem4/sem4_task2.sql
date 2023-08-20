USE komkovfirstdb;

CREATE TABLE tableB(
    id int,
    name varchar(30)
);

SELECT * FROM tableB;


CREATE TABLE tableА(
    id int,
    name varchar(30)
);

SELECT * FROM tableА;

SELECT * FROM tableА
INNER JOIN tableB ON tableА.name = tableB.name;

