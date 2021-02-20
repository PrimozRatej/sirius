SELECT SYSDATE() as timestamp, 'start filter_v.sql' as decsription;
insert into app_filter (id, app, name, created, created_by_user, is_public, filter_string) 
values (1, 'MOB','Filter test 1', NOW(), 1, true, '?quantityType=kom');