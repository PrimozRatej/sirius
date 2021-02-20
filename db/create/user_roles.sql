SELECT SYSDATE() as timestamp, 'start roles.sql' as decsription;
create table sirius.user_roles (
	user_id INT NOT NULL,
    role_id INT NOT NULL,

    PRIMARY KEY (user_id, role_id),
	FOREIGN KEY(user_id) REFERENCES user(id),
	FOREIGN KEY(role_id) REFERENCES roles(id)
);

