SELECT SYSDATE() as timestamp, 'start filter_v.sql' as decsription;

insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (1, 1,'Filter test 1', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (2, 1,'Filter test 2', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (3, 1,'Filter test 2', NOW(), 2, false, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (4, 1,'Filter test 2', NOW(), 2, false, '?quantityType=kom&skuExact=1&quantityType1=kom&skuExact1=1');

insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (5, 2,'All users with friends', NOW(), 2, false, '?quantityType=kom');

insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (6, 1,'Filter test 1', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (7, 1,'Filter test 2', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (8, 1,'Filter test 3', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (9, 1,'Filter test 4', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (10, 1,'Filter test 5', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (11, 1,'Filter test 6', NOW(), 1, true, '?quantityType=kom');
insert into app_filter (id, app_object_id, name, created, created_by_user, is_public, filter_string) 
values (12, 1,'Filter test 7', NOW(), 1, true, '?quantityType=kom');