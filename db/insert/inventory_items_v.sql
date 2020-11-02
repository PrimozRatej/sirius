SELECT SYSDATE() as timestamp, 'start inventory_item_v.sql' as decsription;
insert into inventory_item
    (id, product_id, quantity, warehouse_id)
values
    (1, 1, 250, 1);