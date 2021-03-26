SELECT SYSDATE() as timestamp, 'start app_object.sql' as decsription;

insert into app_object (id, app_id, name, description) 
values (1, 1,'prod', 'Object for products in mobile app.');
insert into app_object (id, app_id, name, description) 
values (2, 1,'usrs', 'Object for users in mobile app.');