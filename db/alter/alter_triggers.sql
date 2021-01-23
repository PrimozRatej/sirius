DELIMITER $$
CREATE TRIGGER trg_before_insert_order_addressExistsInUser 
BEFORE INSERT 
ON sirius.order FOR EACH ROW
BEGIN
   IF (NEW.address_id NOT IN (SELECT ad.id FROM address ad WHERE ad.user_id = NEW.user_id )) THEN
      signal sqlstate '45000' set message_text = 'Address like this dont exist for this user';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_insert_user_registeredIsLessThanLastLogin
BEFORE INSERT
ON sirius.user FOR EACH ROW
BEGIN
   IF (NEW.registered > NEW.last_login) THEN
      signal sqlstate '45000' set message_text = 'Registered date is grater than last login date';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_update_user_registeredIsLessThanLastLogin
BEFORE UPDATE
ON sirius.user FOR EACH ROW
BEGIN
   IF (NEW.registered > NEW.last_login) THEN
      signal sqlstate '45000' set message_text = 'Registered date is grater than last login date';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_update_user_registeredCantUpdate
BEFORE UPDATE
ON sirius.user FOR EACH ROW
BEGIN
   IF (NEW.registered <> (SELECT u.registered FROM user u WHERE u.id = NEW.id)) THEN
      signal sqlstate '45000' set message_text = 'Registered date can\'t be changed once after registration.';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_update_user_idCantUpdate
BEFORE UPDATE
ON sirius.user FOR EACH ROW
BEGIN
   IF ((SELECT u.id FROM user u WHERE u.id = NEW.id) IS NULL) THEN
      signal sqlstate '45000' set message_text = 'User id can\'t be changed.';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_update_address_idCantUpdate
BEFORE UPDATE
ON sirius.address FOR EACH ROW
BEGIN
   IF ((SELECT u.id FROM address u WHERE u.id = NEW.id) IS NULL) THEN
      signal sqlstate '45000' set message_text = 'Address id can\'t be changed.';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_update__idCantUpdate
BEFORE UPDATE
ON sirius.order FOR EACH ROW
BEGIN
   IF ((SELECT u.id FROM sirius.order u WHERE u.id = NEW.id) IS NULL) THEN
      signal sqlstate '45000' set message_text = 'Order id can\'t be changed.';
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_before_cart_item_idCantUpdate
BEFORE UPDATE
ON sirius.cart_item FOR EACH ROW
BEGIN
   IF ((SELECT u.id FROM cart_item u WHERE u.id = NEW.id) IS NULL) THEN
      signal sqlstate '45000' set message_text = 'Cart item id can\'t be changed.';
    END IF;
END$$    
DELIMITER ;