SELECT SYSDATE() as timestamp, 'start inventory_item.sql' as decsription;
create table inventory_item
(
    id INT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    quantity_type VARCHAR(50) NOT NULL, 
    warehouse_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);