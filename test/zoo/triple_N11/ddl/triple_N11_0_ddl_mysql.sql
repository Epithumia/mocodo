CREATE DATABASE IF NOT EXISTS triple_N11;
USE triple_N11;

CREATE TABLE AFFECTER (
  projet VARCHAR(42) NOT NULL,
  employe VARCHAR(42) NOT NULL,
  site VARCHAR(42) NOT NULL,
  PRIMARY KEY (projet, employe)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE AFFECTER ADD CONSTRAINT AFFECTER_u1 UNIQUE (employe, site);
