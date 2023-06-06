CREATE DATABASE seminar_06;
USE seminar_06;

-- Выведите первые N чисел Фибоначчи.
DROP PROCEDURE IF EXISTS fibo;
DELIMITER //
CREATE PROCEDURE fibo (IN n INT)
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE temp INT;
    DECLARE res VARCHAR(100) DEFAULT '0 1';
    IF (n = 1) THEN  
		SELECT CONCAT(n1);
	ELSEIF (n = 2) THEN
		SELECT CONCAT(n1, " ", n2);
    ELSE
		WHILE n > 2 DO
			SET res = CONCAT(res, " ", n2 + n1);
			SET temp = n2;
			SET n2 = n2 + n1;
			SET n1 = temp;
			SET n = n - 1;
        END WHILE;
        SELECT res;
    END IF;
END //
DELIMITER ;

CALL fibo(10);

-- в виде функции
DROP FUNCTION IF EXISTS fibo;
DELIMITER //
CREATE FUNCTION fibo (n INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE temp INT;
    DECLARE res VARCHAR(100) DEFAULT '0 1';
    IF (n = 1) THEN  
		RETURN CONCAT(n1);
	ELSEIF (n = 2) THEN
		RETURN CONCAT(n1, " ", n2);
    ELSE
		WHILE n > 2 DO
			SET res = CONCAT(res, " ", n2 + n1);
			SET temp = n2;
			SET n2 = n2 + n1;
			SET n1 = temp;
			SET n = n - 1;
        END WHILE;
        RETURN res;
    END IF;
END //
DELIMITER ;

SELECT fibo(8);

/* Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер",
с 00:00 до 6:00 — "Доброй ночи". */

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
	DECLARE time_now TIME;
    DECLARE res VARCHAR(15);
    SET time_now = CURTIME();
    IF (time_now BETWEEN '06:00:00' AND '12:00:00') THEN SET res = "Доброе утро";
    ELSEIF (time_now BETWEEN '12:00:00' AND '18:00:00') THEN SET res = "Добрый день";
    ELSEIF (time_now BETWEEN '18:00:00' AND '23:59:59') THEN SET res = "Добрый вечер";
    ELSE SET res = "Доброй ночи";
    END IF;
    RETURN res;    
END //
DELIMITER ;

SET time_zone = '+3:00';
SELECT hello() AS HELLO;