SELECT SYSDATE() as timestamp, 'start user_v.sql' as decsription;
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (1, 'tleblond0', '5ebe734b817ff20151ed0b3dfbeeb2e9b0f6cc6b7317f317690f1f59efc694ec', 'f507a22905b4a64917887578d74f11f7', 'Teodora', 'Le Blond', 'tleblond0@tinypic.com', 'Female', '164.21.114.217', '2019-12-28 13:09:32', '2019-04-29 16:44:00', FALSE);
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (2, 'gmacalroy1', '076408a260dbbf74082cce97d25e415b516a11619d8d51b5c39d056255792b9c', 'a380bdad9bf58eb5d800329f6b6c10ac', 'Grange', 'MacAlroy', 'gmacalroy1@redcross.org', 'Male', '187.92.104.186', '2020-01-20 19:40:23', '2019-11-05 03:06:15', FALSE);
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (3, 'slundy2', '69c8eeff0bc4d159bb76c1137df6181103dd6e34de539c0440fd8acded368055', '5a674e3d767f9c8f1c5a0c93c0667de5', 'Sib', 'Lundy', 'slundy2@nps.gov', 'Female', '65.200.49.144', '2019-06-11 04:10:17', '2019-11-28 14:53:14', FALSE);
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (4, 'vlamblin3', 'b9763029b5ad1e8ad4c0bee753ed9ee8f61d9ae343892eb262016eca4df5b7f6', '2fe3cb9e21922819e79a2781af74e36d', 'Valry', 'Lamblin', 'vlamblin3@blog.com', 'Female', '242.33.122.31', '2019-09-14 02:15:09', '2019-04-21 07:17:32', FALSE);
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (5, 'zantczak4', '5b462e38fa9bd192e3e26c8ee0c04454b407d161c4021b44f8bb2d89c163ed7b', '23580e2a459f7ea40f9efa148b63cafb', 'Zacharie', 'Antczak', 'zantczak4@opensource.org', 'Male', '128.74.53.9', '2019-04-22 23:51:16', '2020-01-07 00:28:38', FALSE);
insert into user
    (id, username, password_hash, password_salt, first_Name, last_Name, email, gender, ip_address, registered, last_login, isOnline)
values
    (6, 'warehouse1', '5b462e38fa9bd192e3e26c8ee0c04454b407d161c4021b44f8bb2d89c163ed7b', '23580e2a459f7ea40f9efa148b63cafb', 'warehouse1', 'warehouse1', 'warehouse1@shoe-store.com', 'Male', '10.0.1.1', '2010-04-22 23:51:16', '2020-01-07 00:28:38', FALSE);