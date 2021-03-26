SELECT SYSDATE() as timestamp, 'start user.sql' as decsription;
create table user (
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(64) NOT NULL,
	first_Name VARCHAR(50),
	last_Name VARCHAR(50),
	email VARCHAR(50) NOT NULL,
	gender VARCHAR(10),
	ip_address VARCHAR(20) NOT NULL,
	registered DATETIME NOT NULL,
	last_login DATETIME,
	is_online BOOLEAN NOT NULL,
	picture VARCHAR(250),
	user_type VARCHAR(50),
	verified BOOLEAN,

	CONSTRAINT user_email_unique_params_constraint UNIQUE (email),
	CONSTRAINT user_username_unique_params_constraint UNIQUE (username)
);
