DROP DATABASE sirius;
CREATE DATABASE sirius;
USE sirius;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'user'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'user';

GRANT ALL PRIVILEGES ON sirius.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, DELETE ON sirius.* TO user@'localhost';

source /home/primoz/siriusLoc/sirius/db/user.sql;
source /home/primoz/siriusLoc/sirius/db/address.sql;
source /home/primoz/siriusLoc/sirius/db/discount.sql;
source /home/primoz/siriusLoc/sirius/db/order.sql;
source /home/primoz/siriusLoc/sirius/db/category.sql;
source /home/primoz/siriusLoc/sirius/db/product.sql;
source /home/primoz/siriusLoc/sirius/db/tag.sql;
source /home/primoz/siriusLoc/sirius/db/product_details.sql;
source /home/primoz/siriusLoc/sirius/db/cart_item.sql;
source /home/primoz/siriusLoc/sirius/db/order_item.sql;