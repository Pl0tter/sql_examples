CREATE DATABASE seminar_03;
USE seminar_03;

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

SELECT * FROM employee;

-- 1.	Выведите все записи, отсортированные по полю "age" по возрастанию
SELECT * FROM employee ORDER BY age;
-- 2.	Выведите все записи, отсортированные по полю "name"
SELECT * FROM employee ORDER BY name DESC;
-- 3.	Выведите записи полей "name", "surname","age", отсортированные по полю "name" в алфавитном порядке по убыванию
SELECT name, surname, age FROM employee ORDER BY name;
-- 4.	Выполните сортировку по полям "name" и "age" по убыванию
SELECT * FROM employee ORDER BY name DESC, age DESC;

-- 1.	Выведите уникальные (неповторяющиеся) значения полей "name"
SELECT DISTINCT name FROM employee ORDER BY name DESC;
-- 2.	Выведите первые две первые записи из таблицы
SELECT * FROM employee ORDER BY id LIMIT 2;
-- 3.	Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
SELECT * FROM employee ORDER BY id LIMIT 4, 3;
-- 4*. 	Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за ними 3 строки (где id=10, id=9, id=8)
SELECT *
FROM (
SELECT *
FROM employee
ORDER BY id DESC
LIMIT 2, 3) AS temp
ORDER BY id;