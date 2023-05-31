USE seminar_04;

-- Создание таблицы с товарами
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category INT NULL,
	product_name VARCHAR(100) NOT NULL
);

-- Создание таблицы с категориями
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL
);

INSERT INTO products(category, product_name) VALUES
(1, 'Системный блок'),
(1, 'Монитор'),
(2, 'Холодильник'),
(2, 'Телевизор'),
(NULL, 'Операционная система');

INSERT INTO categories (category_name) VALUES
('Комплектующие компьютера'),
('Бытовая техника'),
('Мобильные устройства');

-- INNER JOIN
SELECT product_id, product_name, category_name FROM products P JOIN categories C ON P.category = C.category_id;

-- LEFT JOIN
SELECT product_id, product_name, category_name FROM products P LEFT JOIN categories C ON P.category = C.category_id;

-- RIGHT JOIN
SELECT product_id, product_name, category_name FROM products P RIGHT JOIN categories C ON P.category = C.category_id;

-- LEFT JOIN с заполнением отсутствующих значений заглушкой
SELECT product_id, product_name, IF (category_name IS NULL, 'КАТЕГОРИЯ НЕ НАЙДЕНА', category_name)
FROM products AS P
LEFT JOIN categories AS C ON P.category = C.category_id;

-- RIGHT JOIN с заполнением отсутствующих значений заглушкой
SELECT product_id, COALESCE(product_name, 'ПРОДУКТ НЕ НАЙДЕН') AS product_name, category_name
FROM products AS P
RIGHT JOIN categories AS C ON P.category = C.category_id;

-- FULL JOIN - UNION
SELECT product_id, product_name, category_name FROM products P LEFT JOIN categories C ON P.category = C.category_id
UNION
SELECT product_id, product_name, category_name FROM products P RIGHT JOIN categories C ON P.category = C.category_id;

-- FULL JOIN - UNION ALL
SELECT product_id, product_name, category_name FROM products P LEFT JOIN categories C ON P.category = C.category_id
UNION ALL
SELECT product_id, product_name, category_name FROM products P RIGHT JOIN categories C ON P.category = C.category_id
WHERE P.category IS NULL;