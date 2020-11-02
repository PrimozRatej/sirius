SELECT SYSDATE() as timestamp, 'start product.sql' as decsription;
create table product
(
	id INT PRIMARY KEY,
	barcode_num INTEGER,
	barcode_url VARCHAR(2048),
	category_id INT NOT NULL,
	name VARCHAR(250) NOT NULL,
	description TEXT NOT NULL,
	image_url VARCHAR(2048),
	video_url_yt VARCHAR(2048),
	price DECIMAL(6,2) NOT NULL,
	currency_code VARCHAR(3) NOT NULL,
	FOREIGN KEY (currency_code) REFERENCES currency(code),
	FOREIGN KEY (category_id) REFERENCES category(id)
);

