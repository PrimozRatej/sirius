DROP DATABASE sirius;
CREATE DATABASE sirius;
USE sirius;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'user'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'user';

GRANT ALL PRIVILEGES ON sirius.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, DELETE ON sirius.* TO user@'localhost';

source /home/primoz/siriusLoc/sirius/db/wUser.sql;


source /home/primoz/siriusLoc/sirius/db/ALTER.sql;
