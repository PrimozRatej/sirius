SELECT SYSDATE() as timestamp, 'start country.sql' as decsription;
CREATE TABLE country (
  iso CHAR(2) NOT NULL PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  printable_name VARCHAR(80) NOT NULL,
  iso3 CHAR(3),
  numcode SMALLINT
);
