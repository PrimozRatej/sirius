SELECT
    SYSDATE() as timestamp,
    'start roles_v.sql' as decsription;

insert into
    roles (id, name)
values
    (1, "GUEST_USER");

insert into
    roles (id, name)
values
    (2, "USER_LV_1");

insert into
    roles (id, name)
values
    (3, "USER_LV_2");

insert into
    roles (id, name)
values
    (4, "USER_LV_3");

insert into
    roles (id, name)
values
    (5, "ADMIN_LV_1");

insert into
    roles (id, name)
values
    (6, "ADMIN_LV_2");