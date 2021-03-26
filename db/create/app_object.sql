SELECT SYSDATE() as timestamp, 'start app_object.sql' as decsription;
create table app_object (
	id INT AUTO_INCREMENT,
    app_id INT,
	name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(400),
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);
