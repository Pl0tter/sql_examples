CREATE DATABASE IF NOT EXISTS homework_05;
USE homework_05;

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(10),
    Cost INT
);

INSERT Cars (Name, Cost) VALUES
	('Audi', 52642),
    ('Mercedes', 57127),
    ('Skoda', 9000),
    ('Volvo', 29000),
    ('Bentley', 350000),
    ('Citroen', 21000),
    ('Hummer', 41400),
    ('Volkswagen', 21600);

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW low_price AS
	SELECT * FROM Cars WHERE Cost < 25000;

SELECT * FROM low_price;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW low_price AS
	SELECT * FROM Cars WHERE Cost < 30000;

SELECT * FROM low_price;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW skoda_audi AS
	SELECT * FROM Cars WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM skoda_audi;