SELECT SYSDATE() as timestamp, 'start category.sql' as decsription;
create table category (
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description TEXT
);
