SELECT SYSDATE() as timestamp, 'start app_v.sql' as decsription;
insert into app (id, name, description, created) 
values (1, 'MOB_WARE','Mobile warehouse stock management.', NOW());
insert into app (id, name, description, created) 
values (2, 'DES_ADMN','Desktop admin management console.', NOW());