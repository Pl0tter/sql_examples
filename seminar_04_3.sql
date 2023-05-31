USE seminar_04;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NULL,
    pass VARCHAR(255) NULL,
	male TINYINT NULL
);

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NULL,
    pass VARCHAR(255) NULL,
    male TINYINT NULL
);

INSERT INTO users (login, pass, male) VALUES
('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

INSERT INTO clients (login, pass, male) VALUES
('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

-- 1.	Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
SELECT login, pass, male FROM users
UNION SELECT login, pass, male FROM clients;

-- 2.	Получить список пользователей и клиентов. Дубликаты удалять не нужно
SELECT login, pass, male FROM users
UNION ALL SELECT login, pass, male FROM clients;

-- 1. Проверьте, присутствует ли буква “А” в последовательности 'A', 'B', 'C', 'D'
SELECT 'A' IN ('A', 'B', 'C', 'D');

-- 2. Проверьте, присутствует ли буква “Z” в последовательности 'A', 'B', 'C', 'D' 
SELECT CASE
	WHEN 'Z' IN ('A', 'B', 'C', 'D') THEN 'Буква присутствует'
	ELSE 'Буквы нет'
END AS letter_check;

-- 3. Получить столбцы из таблицы “clients” , в которых первое имя является набором значений.
SELECT * FROM clients WHERE login IN ('Tom', 'Masha', 'alex');

-- 4. Выберите все логины из таблицы “users”, кроме “Mikle”.
SELECT login FROM clients WHERE login NOT IN ('Mikle');