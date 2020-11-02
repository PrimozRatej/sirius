SELECT SYSDATE() as timestamp, 'start user.sql' as decsription;
create table user (
	id INT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	password_hash VARCHAR(64) NOT NULL,
	password_salt VARCHAR(32) NOT NULL,
	first_Name VARCHAR(50),
	last_Name VARCHAR(50),
	email VARCHAR(50) NOT NULL,
	gender VARCHAR(10),
	ip_address VARCHAR(20) NOT NULL,
	registered DATETIME NOT NULL,
	last_login DATETIME,
	isOnline BOOLEAN NOT NULL,
	CONSTRAINT user_email_unique_params_constraint UNIQUE (email),
	CONSTRAINT user_username_unique_params_constraint UNIQUE (username)
);
