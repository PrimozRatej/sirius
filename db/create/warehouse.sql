SELECT SYSDATE() as timestamp, 'start warehouse.sql' as decsription;
create table warehouse
(
    id INT PRIMARY KEY,
    address_id INT NOT NULL,
    warehouse_name VARCHAR(250) NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(id)
);