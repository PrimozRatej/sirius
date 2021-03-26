SELECT fil.id,
fil.app_object_id,
(SELECT app.name FROM sirius.app app WHERE app.id = fil.app_object_id LIMIT 1) as app,
fil.name,
fil.created,
fil.created_by_user,
fil.is_public,
fil.filter_string,
(SELECT usr.username FROM sirius.user usr WHERE usr.id = fil.created_by_user LIMIT 1) as username,
(SELECT obj.name FROM sirius.app_object obj WHERE obj.id = fil.app_object_id LIMIT 1) as obj_name
FROM sirius.app_filter fil
WHERE (fil.is_public IS TRUE
OR fil.created_by_user = <<user_id>>)
AND fil.app_object_id = (SELECT obj.id
						FROM sirius.app_object obj
						WHERE obj.name = "<<obj_name>>" LIMIT 1);