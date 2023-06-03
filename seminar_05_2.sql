USE seminar_05;

CREATE TABLE T (
    TB VARCHAR(1),
    ID_CLIENT INT,
    ID_DOG INT,
    OSZ INT,
    PROCENT_RATE INT,
    RATING INT,
    SEGMENT VARCHAR(10)
);

INSERT T VALUES 
	('A', 1, 111, 100, 6, 10, 'SREDN'),
    ('A', 1, 222, 150, 6, 10, 'SREDN'),
    ('A', 2, 333, 50, 9, 15, 'MMB'),
    ('B', 1, 444, 200, 7, 10, 'SREDN'),
    ('B', 3, 555, 1000,5, 16, 'CIB'),
    ('B', 4, 666, 500, 10, 20, 'CIB'),
    ('B', 4, 777, 10, 12, 17, 'MMB'),
    ('C', 5, 888, 20, 11, 21, 'MMB'),
    ('C', 5, 999, 200, 9, 13, 'SREDN');

/* Собрать дэшборд, в котором содержится информация о максимальной задолженности в каждом банке,
а также средний размер процентной ставки в каждом банке в зависимости от сегмента
и количество договоров всего всем банкам
*/
SELECT *,
	MAX(OSZ) OVER(PARTITION BY TB) AS MAX_DEPT,
	AVG(PROCENT_RATE) OVER(PARTITION BY TB, SEGMENT) AS AVG_PROCENT_SEGMENT,
	COUNT(*) OVER() AS TOTAL_OFFERS
FROM T;

SELECT *,
	ROW_NUMBER() OVER(ORDER BY OSZ) AS 'ROW_NUMBER',
	RANK() OVER(ORDER BY OSZ) AS 'RANK',
	DENSE_RANK() OVER(ORDER BY OSZ) AS 'DENSE_RANK'
FROM T;

WITH all_contracts AS (
SELECT *,
	RANK() OVER(PARTITION BY TB ORDER BY OSZ DESC) AS rn
FROM T
)
SELECT * FROM all_contracts
WHERE rn = 2;
