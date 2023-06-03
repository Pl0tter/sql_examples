USE seminar_05;

CREATE TABLE Table_Rev (
    tb VARCHAR(1),
    dep VARCHAR(5),
    count_revisions INT
);

INSERT Table_Rev VALUES
	('A', 'Corp', 100), ('A', 'Rozn', 47), ('A', 'IT', 86),
	('B', 'Corp', 70), ('B', 'Rozn', 65), ('B', 'IT', 58),
	('C', 'Corp', 42), ('C', 'Rozn', 40), ('C', 'IT', 63),
	('D', 'Corp', 95), ('D', 'Rozn', 120), ('D', 'IT', 85),
	('E', 'Corp', 70), ('E', 'Rozn', 72), ('E', 'IT', 80),
	('F', 'Corp', 66), ('F', 'Rozn', 111), ('F', 'IT', 33);

-- Проранжируйте таблицу по убыванию количества ревизий
SELECT *,
	ROW_NUMBER() OVER(ORDER BY count_revisions DESC) AS 'row_number',
	RANK() OVER(ORDER BY count_revisions DESC) AS 'rank',
	DENSE_RANK() OVER(ORDER BY count_revisions DESC) AS 'dense_rank',
	NTILE(3) OVER(ORDER BY count_revisions DESC) AS 'ntile',
    RANK() OVER(PARTITION BY tb ORDER BY count_revisions DESC) AS 'bank_rank'
FROM Table_Rev;

-- Найти второй отдел во всех банках по количеству ревизий.
WITH bank_rank AS
(
	SELECT *,
		RANK() OVER(PARTITION BY tb ORDER BY count_revisions DESC) AS br
	FROM Table_Rev
)
SELECT * FROM bank_rank
WHERE br = 2;
