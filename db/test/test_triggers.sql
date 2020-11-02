# trg_before_insert_orders_addressExistsInUser
INSERT INTO sirius.orders(id, user_id, address_id, discount_id, order_status_code, currency_code, created, modified, amount) 
VALUES(1,1,2,null,'AFF','ALL',SYSDATE(), SYSDATE(), 1);

# trg_before_insert_user_registeredIsLessThanLastLogin
insert into user (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline) 
values (6, 'zantczak46', '5b462e38fa9bd192e3e26c8ee0c04454b407d161c4021b44f8bb2d89c163ed7b','23580e2a459f7ea40f9efa148b63cafb', 'Zacharie', 'Antczak', 'zantczak44@opensource.org', 'Male', '128.74.53.9', '2021-04-22 23:51:16', '2020-01-07 00:28:38', FALSE);

# trg_before_update_user_registeredIsLessThanLastLogin
update user SET last_login = '2018-01-07 00:28:38' WHERE user.id = 5;

# trg_before_update_user_registeredIsLessThanLastLogin
update user SET registered = '2019-05-22 23:51:16'WHERE user.id = 5;

# trg_before_update_user_idCantUpdate
update user SET id = 6 WHERE user.id = 5;

insert into user (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline) 
values (6, 'zantczak4', '5b462e38fa9bd192e3e26c8ee0c04454b407d161c4021b44f8bb2d89c163ed7b','23580e2a459f7ea40f9efa148b63cafb', 'Zacharie', 'Antczak', 'zantczak44@opensource.org', 'Male', '128.74.53.9', '2019-04-22 23:51:16', '2020-01-07 00:28:38', FALSE);

# trg_before_update_user_idCantUpdate
update address SET id = 6 WHERE address.id = 5;