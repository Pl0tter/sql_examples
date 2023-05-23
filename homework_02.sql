-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE homework_02;
USE homework_02;

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    bucket INT UNSIGNED NOT NULL
);
INSERT sales(order_date, bucket) VALUES
("2021-01-01", FLOOR(101 + (RAND() * 200))), -- случайное значение 101 <= N <= 300
("2021-01-02", FLOOR(101 + (RAND() * 200))),
("2021-01-03", FLOOR(0 + (RAND() * 101))),
("2021-01-04", FLOOR(101 + (RAND() * 200))),
("2021-01-05", FLOOR(301 + (RAND() * 699)));

SELECT * FROM sales;

-- 2. Сгруппируйте значения количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT *,
CASE
	WHEN bucket > 300 THEN "Большой заказ"
	WHEN bucket >= 100 THEN "Средний заказ"
	ELSE "Маленький заказ"
END AS result
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(3) NOT NULL,
    amount DECIMAL(6,2) DEFAULT 0.00,
    orderstatus VARCHAR(9)
);

INSERT orders (employeeid, amount, orderstatus) VALUES
("e03",15.00,"OPEN"),
("e01",25.50,"OPEN"),
("e05",100.70,"CLOSED"),
("e02",22.18,"OPEN"),
("e04",9.50,"CANCELLED"),
("e04",99.99,"OPEN");

SELECT *,
CASE
	WHEN orderstatus = "OPEN" THEN "Order is in open state."
    WHEN orderstatus = "CLOSED" THEN "Order is closed."
    WHEN orderstatus = "CANCELLED" THEN "Order is canselled."
	ELSE "Undefined state"
END AS order_summary
FROM orders;

/* Чем NULL отличается от 0?
NULL - это пустое значение (незаполненная ячейка), а 0 - это целое число, которое при присваивании занимает ячейку. 
*/