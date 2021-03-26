SELECT SYSDATE() as timestamp, 'start app_filter.sql' as decsription;
create table app_filter (
	id INT PRIMARY KEY,
	app_object_id INT,
	name VARCHAR(50) NOT NULL,
	created DATETIME NOT NULL,
    created_by_user INT,
	is_public BOOLEAN NOT NULL,
    filter_string VARCHAR(2500) NOT NULL,
	
    FOREIGN KEY (app_object_id) REFERENCES app_object(id),
	FOREIGN KEY (created_by_user) REFERENCES user(id)
);
