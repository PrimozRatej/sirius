SELECT SYSDATE() as timestamp, 'start address.sql' as decsription;
create table address (
	id INT PRIMARY KEY,
	user_id INT,
	address VARCHAR(120) NOT NULL,
	city VARCHAR(50) NOT NULL,
	country_code_iso VARCHAR(2) NOT NULL,
	phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (country_code_iso) REFERENCES country(iso)
);
