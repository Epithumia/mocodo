CREATE DATABASE IF NOT EXISTS weak;
USE weak;

CREATE TABLE EXEMPLAIRE (
  oeuvre VARCHAR(42),
  exemplaire VARCHAR(42),
  foobar VARCHAR(42),
  PRIMARY KEY (oeuvre, exemplaire)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
