CREATE DATABASE IF NOT EXISTS homework_05;
USE homework_05;

DROP TABLE IF EXISTS Groups_Analysis, Analysis, Orders;
CREATE TABLE Groups_Analysis (
    gr_id INT PRIMARY KEY AUTO_INCREMENT,
    gr_name VARCHAR(25),
    gr_temp INT
);

CREATE TABLE Analysis (
    an_id INT PRIMARY KEY AUTO_INCREMENT,
    an_name VARCHAR(10),
    an_cost INT,
    an_price INT,
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES Groups_Analysis(gr_id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    ord_id INT PRIMARY KEY AUTO_INCREMENT,
    ord_datetime DATETIME,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id) ON DELETE CASCADE
);

INSERT Groups_Analysis(gr_name, gr_temp) VALUES
	('Группа анализов №1', FLOOR(5 + (RAND() * 21))),
    ('Группа анализов №2', FLOOR(5 + (RAND() * 21))),
    ('Группа анализов №3', FLOOR(5 + (RAND() * 21)));

INSERT Analysis(an_name, an_cost, an_price, an_group) VALUES
	('Анализ №1', 1000, 1100, FLOOR(1 + (RAND() * 3))),
    ('Анализ №2', 2000, 2200, FLOOR(1 + (RAND() * 3))),
    ('Анализ №3', 3000, 3300, FLOOR(1 + (RAND() * 3))),
    ('Анализ №4', 4000, 4400, FLOOR(1 + (RAND() * 3))),
    ('Анализ №5', 5000, 5500, FLOOR(1 + (RAND() * 3))),
    ('Анализ №6', 6000, 6600, FLOOR(1 + (RAND() * 3)));

INSERT Orders(ord_datetime, ord_an) VALUES
	(DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6))),
    (DATE_ADD('2020-02-01', INTERVAL FLOOR(RAND() * 20) DAY), FLOOR(1 + (RAND() * 6)));

SELECT * FROM Orders ORDER BY ord_datetime;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SELECT an_name, an_price FROM Analysis WHERE an_id IN (
	SELECT ord_an FROM Orders
    WHERE ord_datetime = '2020-02-05' OR ord_datetime BETWEEN '2020-02-10' AND '2020-02-16'
);

WITH cte AS (
	SELECT * FROM Orders
    WHERE ord_datetime = '2020-02-05' OR ord_datetime BETWEEN '2020-02-10' AND '2020-02-16'
)
SELECT ord_id, ord_datetime, an_name, an_price FROM cte
JOIN Analysis ON an_id=ord_an
ORDER BY ord_datetime;
