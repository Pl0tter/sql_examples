CREATE DATABASE homework_04;
USE homework_04;

CREATE TABLE AUTO (
    REGNUM VARCHAR(10) PRIMARY KEY,
    MARK VARCHAR(10),
    COLOR VARCHAR(15),
    RELEASEDT DATE,
    PHONENUM VARCHAR(15)
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
    
-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT MARK, COLOR, COUNT(*) AS TOTAL
FROM AUTO
WHERE MARK IN ("BMW", "LADA")
GROUP BY MARK, COLOR
ORDER BY MARK;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT DISTINCT MARK AS ORIGIN_MARK, (
	SELECT COUNT(*) FROM AUTO WHERE MARK != ORIGIN_MARK) AS ANOTHER_MARK
FROM AUTO;

-- -------------------------------------
CREATE TABLE test_a (id DECIMAL, data VARCHAR(1));
CREATE TABLE test_b (id DECIMAL);
INSERT test_a(id, data) VALUES
	(10, 'A'),
	(20, 'A'),
	(30, 'F'),
	(40, 'D'),
	(50, 'C');
INSERT test_b(id) VALUES
	(10),
	(30),
	(50);

-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT A.* FROM test_a A
LEFT JOIN test_b B ON B.id = A.id
WHERE B.Id IS NULL;