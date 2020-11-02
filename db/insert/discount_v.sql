SELECT SYSDATE() as timestamp, 'start discount_v.sql' as decsription;
insert into discount (id, name, description, discount_value, created, valid_from, valid_to) values (1, 'Summer sell', NULL, 50, '2019-05-23 07:25:07', '2019-11-20 23:06:15', '2019-12-20 23:06:15');
insert into discount (id, name, description, discount_value, created, valid_from, valid_to) values (2, 'Black friday', NULL, 75, '2020-03-04 13:14:43', '2019-05-26 04:25:53', '2019-06-26 04:25:53');
insert into discount (id, name, description, discount_value, created, valid_from, valid_to) values (3, 'Employee discount', NULL, 20, '2019-08-07 12:03:45', '2020-02-07 13:35:39', '2020-03-07 13:35:39');
insert into discount (id, name, description, discount_value, created, valid_from, valid_to) values (4, 'New year sell', NULL, 25, '2019-06-24 04:03:29', '2019-08-22 04:47:28', '2019-09-22 04:47:28');
insert into discount (id, name, description, discount_value, created, valid_from, valid_to) values (5, 'Last year items', NULL, 35, '2019-06-24 04:03:29', '2019-08-22 04:47:28', '2019-09-22 04:47:28');
