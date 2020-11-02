SELECT SYSDATE() as timestamp, 'start tag.sql' as decsription;
create table tag (
	id INT PRIMARY KEY,
	product_id INT,
	tag VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(id)
);