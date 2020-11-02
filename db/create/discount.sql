SELECT SYSDATE() as timestamp, 'start discount.sql' as decsription;
create table discount (
	id INT PRIMARY KEY,
	name VARCHAR(250) NOT NULL, 
	description MEDIUMTEXT,
	discount_value INT(100) NOT NULL,
	created DATE NOT NULL,
	valid_from DATE,
	valid_to DATE
);

