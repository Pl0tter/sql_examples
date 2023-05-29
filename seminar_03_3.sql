USE seminar_03;

CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    age INT,
    salary INT DEFAULT 0
);

INSERT workers (name, age, salary) VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 25, 2000);

-- 1.	Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы  найдите суммарную зарплату 
SELECT age, SUM(salary) FROM workers GROUP BY age;

-- 2.	Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
SELECT age, MAX(salary) FROM workers GROUP BY age;

-- 3.	Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы
SELECT age, MIN(salary) FROM workers GROUP BY age;

-- 1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000
SELECT age, SUM(salary) AS summary_salary
FROM workers
GROUP BY age
HAVING summary_salary >= 1000;

-- 2. 	Выведите только те группы, в которых количество строк меньше или равно двум
SELECT age, COUNT(*) AS count_rows
FROM workers
GROUP BY age
HAVING count_rows <= 2;

-- 3.	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”
SELECT age, COUNT(*) AS count_rows
FROM workers
GROUP BY age
HAVING count_rows BETWEEN 0 AND 2;

-- 4.*	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”
SELECT age, COUNT(*) AS count_rows
FROM workers
GROUP BY age
HAVING count_rows IN(0,1,2);