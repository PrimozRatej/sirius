SELECT SYSDATE() as timestamp, 'start inventory_item_v.sql' as decsription;
insert into inventory_item
    (id, product_id, quantity, quantity_type, warehouse_id)
values
    (1, 1, 250, "kom", 1);

    insert into inventory_item
    (id, product_id, quantity, quantity_type, warehouse_id)
values
    (2, 2, 150, "kom", 1);

insert into inventory_item
    (id, product_id, quantity, quantity_type, warehouse_id)
values
    (3, 3, 90, "pair", 1);