SELECT SYSDATE() as timestamp, 'start product_details.sql' as decsription;
create table product_details
(
	id INT PRIMARY KEY,
	product_id INT NOT NULL,
	company VARCHAR(2048) NOT NULL,
	model VARCHAR(2048) NOT NULL,
	release_date DATE,
	color VARCHAR(200) NOT NULL,
	img_url VARCHAR(2048) NOT NULL,
	img_url2 VARCHAR(2048),
	img_url3 VARCHAR(2048),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

