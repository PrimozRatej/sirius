SELECT SYSDATE() as timestamp, 'start currency.sql' as decsription;
CREATE TABLE currency (
  code   VARCHAR(3) PRIMARY KEY,
  name   VARCHAR(20) NOT NULL,
  symbol VARCHAR(5) CHARACTER SET UTF8 NOT NULL 
);

