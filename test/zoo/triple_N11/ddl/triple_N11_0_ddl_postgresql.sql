CREATE DATABASE triple_N11;
\c triple_N11;

CREATE TABLE AFFECTER (
  projet VARCHAR(42),
  employe VARCHAR(42),
  site VARCHAR(42),
  PRIMARY KEY (projet, employe)
);

ALTER TABLE AFFECTER ADD CONSTRAINT AFFECTER_u1 UNIQUE (employe, site);
