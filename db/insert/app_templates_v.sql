SELECT SYSDATE() as timestamp, 'start app_templates_v.sql' as decsription;
insert into app_templates
    (id, app_id, obj_id, name, file_extension, file_data, description)
values
    (1, 1, 1, 'Test template products', 'docx', 'some file data', 'Template for dev testing.');