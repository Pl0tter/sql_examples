CREATE DATABASE seminar_02;
USE seminar_02;
-- Создать таблицу с подборкой фильмов. Связать с произвольной табличкой ключом
CREATE TABLE movie (
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    movie_name VARCHAR(30) NOT NULL,
    movie_year INT NOT NULL,
    duration INT NOT NULL,
    movie_Description VARCHAR(100) NOT NULL
);
-- Заполните табличку тестовыми данными, используя оператор INSERT INTO
INSERT movie (movie_name, movie_year, duration, movie_Description) VALUES
("Harry Potter", 2001, 152, "Movie about Harry Potter"),
("The Green Mile", 1999, 188, "Green Mil"),
("Forres Gump", 1994, 142, "Movie");
SELECT * FROM movie;

-- Переименование таблицы и столбца
RENAME TABLE movie TO cinema;
ALTER TABLE cinema RENAME COLUMN duration TO movie_duration;

-- Добавление столбца
ALTER TABLE cinema ADD movie_language VARCHAR(50) DEFAULT "", ADD rating FLOAT AFTER movie_duration;
SELECT * FROM cinema;
-- Удаление столбца
ALTER TABLE cinema DROP COLUMN movie_language, DROP COLUMN rating;
SELECT * FROM cinema;
-- Очистка таблицы
TRUNCATE TABLE cinema;
-- Удаление таблицы
DROP TABLE cinema;