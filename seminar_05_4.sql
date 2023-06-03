USE seminar_05;

CREATE TABLE shedule (
	id_task INT,
	event VARCHAR(10),
	date_event DATE
);

INSERT shedule VALUES
	(1, 'Open', '2020-02-01'),
	(1, 'To_1_Line', '2020-02-02'),
	(1, 'To_2_Line', '2020-02-03'),
	(1, 'Successful', '2020-02-04'),
    (1, 'CLose', '2020-02-05'),
	(2, 'Open', '2020-03-01'),
	(2, 'To_1_Line', '2020-03-02'),
	(2, 'Denied', '2020-03-03'),
	(3, 'Open', '2020-04-01'),
	(3, 'To_1_Line', '2020-04-02'),
	(3, 'To_2_Line', '2020-04-03');
    
SELECT *,
	LEAD(event, 1, 'end') OVER(PARTITION BY id_task) AS 'next_event',
	LEAD(date_event, 1, '2099-01-01') OVER(PARTITION BY id_task) AS 'next_date'
FROM shedule;
