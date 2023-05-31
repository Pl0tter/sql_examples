USE homework_03;

-- Копирование таблицы из другой базы. Первый запрос создает таблицу со всеми свойствами исходной. Второй копирует данные.
-- CREATE TABLE employee LIKE seminar_03.employee;
-- INSERT INTO employee SELECT * FROM seminar_03.employee;

CREATE TABLE employee (
    id INT,
    name VARCHAR(100),
    surname VARCHAR(100),
    specialty VARCHAR(100),
    seniority INT,
    salary INT,
    age INT
);

INSERT employee (id, name, surname, specialty, seniority, salary, age) VALUES
(1,'Вася', 'Васькин', 'начальник', 40, 100000, 60),
(2,'Петя', 'Петькин', 'начальник', 8, 70000, 30),
(3,'Катя', 'Каткина', 'инженер', 2, 70000, 25),
(4,'Саша', 'Сашкин', 'инженер', 12, 50000, 35),
(5,'Иван', 'Иванов', 'рабочий', 40, 30000, 59),
(6,'Петр', 'Петров', 'рабочий', 20, 25000, 40),
(7,'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
(8,'Антон', 'Антонов', 'рабочий', 8, 19000, 28),
(9,'Юра', 'Юркин', 'рабочий', 5, 15000, 25),
(10,'Максим', 'Воронин', 'рабочий', 2, 11000, 22),
(11,'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
(12,'Люся', 'Люськина', 'уборщик', 10, 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY salary;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT *
FROM (
	SELECT * FROM employee ORDER BY salary DESC LIMIT 5) AS temp_table
ORDER BY salary;

-- 3. Выполните группировку всех сотрудников по специальности, суммарная зарплата которых превышает 100000
SELECT specialty, SUM(salary) AS salary_sum
FROM employee
GROUP BY specialty
HAVING salary_sum > 100000;