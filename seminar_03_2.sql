USE seminar_03;
CREATE TABLE employee_tbl (id INT, name VARCHAR(100), work_date DATE, daily_typing_pages INT);

INSERT employee_tbl VALUES
(1, "John", "2007-01-24", 250),
(2, "Ram", "2007-05-27", 220),
(3, "Jack", "2007-05-06", 170),
(3, "Jack", "2007-04-06", 100),
(4, "Jill", "2007-04-06", 220),
(5, "Zara", "2007-06-06", 300),
(5, "Zara", "2007-02-06", 350);

SELECT * FROM employee_tbl;

-- 1.	Рассчитайте общее количество всех страниц daily_typing_pages
SELECT SUM(daily_typing_pages) AS summary_typing_pages
FROM employee_tbl;

-- 2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  
SELECT id, name, SUM(daily_typing_pages) AS summary_typing_pages
FROM employee_tbl
GROUP BY id, name;

-- 3.	Посчитайте количество записей в таблице
SELECT COUNT(*) as count_rows FROM employee_tbl;

-- 4.	Выведите количество имен, которые являются уникальными 
SELECT COUNT(DISTINCT name) AS "unique names" FROM employee_tbl;

-- 5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
SELECT
	AVG(daily_typing_pages) AS average_typing_pages,
	SUM(daily_typing_pages) AS summary_typing_pages,
    COUNT(*) AS count_rows,
    SUM(daily_typing_pages)/COUNT(*) AS test_average_typing_pages
FROM employee_tbl;
