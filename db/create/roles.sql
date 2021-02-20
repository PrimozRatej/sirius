SELECT SYSDATE() as timestamp, 'start roles.sql' as decsription;
create table roles (
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
