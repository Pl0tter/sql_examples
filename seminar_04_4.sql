USE seminar_04;

-- Задание на EXISTS
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Department VARCHAR(45) NOT NULL,
    Salary FLOAT NOT NULL,
    Gender VARCHAR(45) NOT NULL,
    Age INT NOT NULL,
    City VARCHAR(45) NOT NULL
);
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES
(1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London'),
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London'),
(1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London'),
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London'),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London'),
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai'),
(1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai'),
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai'),
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai'),
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');

CREATE TABLE Projects (
    ProjectId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
    EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME
);
INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

-- 1. Получите из таблицы "Сотрудники" только тех сотрудников, которые в данный момент работают над любым из активных проектов.
SELECT * FROM Employee E WHERE EXISTS (
SELECT * FROM Projects P WHERE P.EmployeeId = E.Id);

SELECT * FROM Employee WHERE Id IN (
SELECT EmployeeId FROM Projects);

SELECT E.* FROM Employee E
JOIN Projects P ON E.Id=P.EmployeeId;

-- 2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.
SELECT * FROM Employee WHERE Id = 1004;

SELECT IF (1004 IN (SELECT Id FROM Employee), 'Сотрудник существует', 'Такого сотрудника нет') AS emp_check;