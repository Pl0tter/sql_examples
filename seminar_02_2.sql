-- Задача 3. В зависимости от поля “grade”, установите еще один столбец с именем class в зависимости от значений
CREATE TABLE students (
    stud_id INT PRIMARY KEY AUTO_INCREMENT,
    total_marks INT,
    grade VARCHAR(3)
);

INSERT students (total_marks, grade) VALUES
(450, "A"),
(480, "A+"),
(490, "A++"),
(440, "B+"),
(400, "C+"),
(380, "C"),
(250, "D"),
(200, "E");

SELECT *,
CASE
	WHEN grade="A++" THEN "DISTINCTION"
	WHEN grade="A+" THEN "FIRST CLASS"
	WHEN grade="A" THEN "SECOND CLASS"
	WHEN grade="B+" THEN "SECOND CLASS"
	WHEN grade="C+" THEN "THIRD CLASS" 
	ELSE "FAIL"
END AS class
FROM students;

ALTER TABLE students ADD COLUMN class VARCHAR(30);
UPDATE students SET class =
CASE
	WHEN grade = 'A++' THEN 'DISTINCTION'
	WHEN grade = 'A+' THEN 'FIRST CLASS'
	WHEN grade = 'A' THEN 'SECOND CLASS'
	WHEN grade = 'B+' THEN 'SECOND CLASS'
	WHEN grade = 'C+' THEN 'THIRD CLASS'
	ELSE 'FAIL'
END
WHERE stud_id != NULL; -- SET SQL_SAFE_UPDATES = 0;
SELECT * FROM students;

-- Расставим студентам классы в зависимости от оценок
UPDATE students SET class=
CASE
	WHEN total_marks > 450 THEN "ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ"
	WHEN total_marks > 399 THEN "ПЕРВЫЙ КЛАСС"
	WHEN total_marks > 349 THEN "ВТОРОЙ КЛАСС"
	WHEN total_marks > 299 THEN "ТРЕТИЙ КЛАСС"
	ELSE "НЕУДАЧА"
END
WHERE stud_id != NULL;
SELECT * FROM students;

-- Проверьте истинность выражения, используя оператор "IF"
-- Если 100<200, то печатаем 'yes'; иначе - 'no'
SELECT IF(100 < 200, 'yes', 'no') AS Result;

-- В зависимости от общего количество баллов, укажите статус ученика в табеле успеваемости: если суммарное количество баллов больше 450, то студент закончил на “Отлично”; иначе - “Хорошо”
SELECT total_marks, IF (total_marks > 450, 'Отлично', 'Хорошо') AS Stat FROM students;