-- Собеседования
DROP TABLE IF EXISTS AUTO, CITY, MAN;

CREATE TABLE AUTO (
    REGNUM VARCHAR(10) PRIMARY KEY,
    MARK VARCHAR(10),
    COLOR VARCHAR(15),
    RELEASEDT DATE,
    PHONENUM VARCHAR(15)
);

CREATE TABLE CITY (
    CITYCODE INT PRIMARY KEY,
    CITYNAME VARCHAR(50),
    PEOPLES INT
);

CREATE TABLE MAN (
    PHONENUM VARCHAR(15) PRIMARY KEY,
    FIRSTNAME VARCHAR(50),
    LASTNAME VARCHAR(50),
    CITYCODE INT,
    YEAROLD INT
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM ) VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', NULL),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', NULL),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

INSERT INTO CITY (CITYCODE, CITYNAME, PEOPLES) VALUES
(1,'Москва', 10000000),
(2,'Владимир', 500000),
(3, 'Орел', 300000),
(4,'Курск', 200000),
(5, 'Казань', 2000000),
(7, 'Котлас', 110000),
(8, 'Мурманск', 400000),
(9, 'Ярославль', 500000);

INSERT INTO MAN (PHONENUM, FIRSTNAME, LASTNAME, CITYCODE, YEAROLD) VALUES
('9152222221','Андрей','Николаев', 1, 22),
('9152222222','Максим','Москитов', 1, 31),
('9153333333','Олег','Денисов', 3, 34),
('9173333334','Алиса','Никина', 4, 31),
('9173333335','Таня','Иванова', 4, 31),
('9213333336','Алексей','Иванов', 7, 25),
('9213333331','Андрей','Некрасов', 2, 27),
('9213333332','Миша','Рогозин', 2, 21),
('9214444444','Алексей','Галкин', 1, 38);

-- 1.	Выбрать код, название города и популяцию, код, города и популяцию где код города больше текущего кода города на 2
SELECT C1.*, C2.* FROM CITY AS C1
JOIN CITY AS C2 ON C2.CITYCODE = C1.CITYCODE + 2;

SELECT C1.*, C2.* FROM CITY AS C1
LEFT JOIN CITY AS C2 ON C2.CITYCODE = C1.CITYCODE + 2;

-- 2.	Вывести марку авто - а так же сколько авто такой марки в таблице, вывести записи где количество авто такой марки больше 2, записи на должны дублироваться
SELECT DISTINCT * FROM AUTO
WHERE MARK IN (
	SELECT MARK FROM AUTO
	GROUP BY MARK HAVING COUNT(*) > 2);

-- 3.	Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, которые живут в городе с населением больше 1 млн человек.
SELECT MARK, COLOR, FIRSTNAME, LASTNAME FROM AUTO A
JOIN MAN M ON M.PHONENUM = A.PHONENUM WHERE M.PHONENUM IN (
	SELECT PHONENUM FROM MAN M
	JOIN CITY C ON C.CITYCODE = M.CITYCODE WHERE PEOPLES > 1000000);

-- 4.	Вывести на экран людей которые живут в городах с населением больше 1000000 , если людей с таким же именем нет в таблице MAN
SELECT M.* FROM MAN M
JOIN CITY C ON C.CITYCODE = M.CITYCODE WHERE PEOPLES > 1000000 AND FIRSTNAME IN (
	SELECT FIRSTNAME FROM MAN
	GROUP BY FIRSTNAME
	HAVING COUNT(*) = 1);