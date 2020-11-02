SELECT SYSDATE() as timestamp, 'start order_status.sql' as decsription;
create table order_status (
	code VARCHAR(3) PRIMARY KEY, 
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL
);
