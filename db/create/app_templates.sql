SELECT SYSDATE() as timestamp, 'start app_templates.sql' as decsription;
create table app_templates (
	id INT AUTO_INCREMENT,
    app_id INT,
    obj_id INT,
	name VARCHAR(50) NOT NULL UNIQUE,
    file_extension VARCHAR(20),
    file_data TEXT,
    description VARCHAR(400),
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (obj_id) REFERENCES app_object(id)
);
