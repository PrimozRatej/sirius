SELECT SYSDATE() as timestamp, 'start order.sql' as decsription;
create table `order` (
	id INT PRIMARY KEY,
	user_id INT NOT NULL,
	address_id INT NOT NULL,
	discount_id INT,
	order_status_code VARCHAR(3) NOT NULL,
	created DATE NOT NULL,
	modified DATE,
	amount DECIMAL(6,2) NOT NULL,
	currency_code VARCHAR(3) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (discount_id) REFERENCES discount(id),
	FOREIGN KEY (order_status_code) REFERENCES order_status(code),
	FOREIGN KEY (currency_code) REFERENCES currency(code)
);