SELECT SYSDATE() as timestamp, 'start order_v.sql' as decsription;
insert into sirius.order (id, user_id, address_id, discount_id, created, modified, order_status_code, amount, currency_code) 
values (1, 1, 1, NULL, '2019-08-18 00:11:38', '2019-08-18 00:15:38', 'PDG', '228.82', 'EUR');