#Test trg_before_orders_addressExistsInUser
INSERT INTO sirius.orders(id, user_id, address_id, discount_id, order_status_code, currency_code, created, modified, amount) 
VALUES(1,1,2,null,'AFF','ALL',SYSDATE(), SYSDATE(), 1);