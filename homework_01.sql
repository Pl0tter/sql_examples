/*
 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
 Id, ProductName, Manufacturer, ProductCount, Price
 Заполните БД данными.
 */

CREATE DATABASE homework_01;
USE homework_01;
CREATE TABLE Phones (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(10) NOT NULL,
    Manufacturer VARCHAR(10) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price INT
);
INSERT INTO Phones (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price FROM Phones WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM Phones WHERE Manufacturer = 'Samsung';

-- 4. ***С помощью регулярных выражений найти:
-- Товары, в наименовании которых есть упоминание "Iphone"
SELECT * FROM Phones WHERE ProductName LIKE '%Iphone%';
-- Товары, в наименовании которых есть упоминание "Samsung"
SELECT * FROM Phones WHERE ProductName LIKE '%Samsung%';
-- Товары, в наименовании которых есть ЦИФРЫ
SELECT * FROM Phones WHERE ProductName RLIKE '[0-9]';
-- Товары, в наименовании которых есть ЦИФРА "8"
SELECT * FROM Phones WHERE ProductName LIKE '%8%';