DROP DATABASE sirius;
CREATE DATABASE sirius;
USE sirius;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'user'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'user';

GRANT ALL PRIVILEGES ON sirius.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, DELETE ON sirius.* TO user@'localhost';


#create
SELECT SYSDATE() as timestamp, 'Start CREATE' as decsription;
source /home/primoz/siriusLoc/sirius/db/create/user.sql;
source /home/primoz/siriusLoc/sirius/db/create/country.sql;
source /home/primoz/siriusLoc/sirius/db/create/address.sql;
source /home/primoz/siriusLoc/sirius/db/create/discount.sql;
source /home/primoz/siriusLoc/sirius/db/create/order_status.sql;
source /home/primoz/siriusLoc/sirius/db/create/currency.sql;
source /home/primoz/siriusLoc/sirius/db/create/order.sql;
source /home/primoz/siriusLoc/sirius/db/create/category.sql;
source /home/primoz/siriusLoc/sirius/db/create/product.sql;
source /home/primoz/siriusLoc/sirius/db/create/tag.sql;
source /home/primoz/siriusLoc/sirius/db/create/product_details.sql;
source /home/primoz/siriusLoc/sirius/db/create/cart_item.sql;
source /home/primoz/siriusLoc/sirius/db/create/order_item.sql;
source /home/primoz/siriusLoc/sirius/db/create/warehouse.sql;
source /home/primoz/siriusLoc/sirius/db/create/inventory_items.sql;

#insert
SELECT SYSDATE() as timestamp, 'Start INSERT' as decsription;
source /home/primoz/siriusLoc/sirius/db/insert/user_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/country_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/address_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/discount_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/order_status_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/currency_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/order_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/category_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/product_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/tag_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/product_details_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/cart_item_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/order_item_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/warehouse_v.sql;
source /home/primoz/siriusLoc/sirius/db/insert/inventory_items_v.sql;

#alter
SELECT SYSDATE() as timestamp, 'Start ALTER' as decsription;
source /home/primoz/siriusLoc/sirius/db/alter/alter_triggers.sql;

#test
SELECT SYSDATE() as timestamp, 'Start TEST' as decsription;
source /home/primoz/siriusLoc/sirius/db/test/test_triggers.sql;
