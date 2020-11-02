SELECT SYSDATE() as timestamp, 'start cart_item.sql' as decsription;
create table cart_item (
	id INT PRIMARY KEY,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	saved_for_later BOOLEAN NOT NULL,
	quantity INT  NOT NULL,
	time_added DATE  NOT NULL,
	time_modified DATE  NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
