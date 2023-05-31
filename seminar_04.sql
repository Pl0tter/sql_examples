CREATE DATABASE seminar_04;
USE seminar_04;

DROP TABLE IF EXISTS tableA;
CREATE TABLE tableA (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR (10)
);

DROP TABLE IF EXISTS tableB;
CREATE TABLE tableB LIKE tableA;

INSERT tableA(name) VALUES ('Яблоко'), ('Ананас'), ('Банан'), ('Груша');
INSERT tableB(name) VALUES ('Тыква'), ('Яблоко'), ('Дыня'), ('Банан');

-- INNER JOIN
SELECT * FROM tableA JOIN tableB ON tableA.name = tableB.name;

-- LEFT JOIN
SELECT * FROM tableA LEFT JOIN tableB ON tableA.name = tableB.name;

-- RIGHT JOIN
SELECT * FROM tableA RIGHT JOIN tableB ON tableA.name = tableB.name;

-- Выведите участников, которые также являются членами комитета, используйте INNER JOIN (пересечение 2 таблиц по имени);
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher (
    id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher VALUES
(1,"Авдеев", 17000),
(2,"Гущенко",27000),
(3,"Пчелкин",32000),
(4,"Питошин",15000),
(5,"Вебов",45000),
(6,"Шарпов",30000),
(7,"Шарпов",40000),
(8,"Питошин",30000);
    
DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher (id)
);

INSERT INTO lesson(course, teacher_id) VALUES
("Знакомство с веб-технологиями",1),
("Знакомство с веб-технологиями",2),
("Знакомство с языками программирования",3),
("Базы данных и SQL",4),
("Нейронные сети", NULL); -- Учитель, который ведет данный предмет, временно отстутствует

SELECT t.*, course FROM teacher AS t JOIN lesson AS l on l.teacher_id=t.id;
