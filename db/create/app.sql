SELECT SYSDATE() as timestamp, 'start app.sql' as decsription;
create table app (
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    description VARCHAR(400),
	created DATETIME NOT NULL
);
