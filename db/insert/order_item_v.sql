SELECT SYSDATE() as timestamp, 'start order_item_v.sql' as decsription;
insert into order_item (id, order_id, product_id, quantity) values (1, 1, 1, 14);
insert into order_item (id, order_id, product_id, quantity) values (2, 1, 1, 7);


insert into order_item (id, order_id, product_id, quantity) values (3, 1, 2, 14);
insert into order_item (id, order_id, product_id, quantity) values (4, 1, 2, 7);