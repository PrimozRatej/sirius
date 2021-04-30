SELECT SYSDATE() as timestamp, 'start order_item.sql' as decsription;
create table sirius.order_item (
	id INT PRIMARY KEY,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES sirius.order(id),
    FOREIGN KEY (product_id) REFERENCES sirius.product(id)
);