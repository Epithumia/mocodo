CREATE DATABASE IF NOT EXISTS alt;
USE alt;

CREATE TABLE CLIENT (
  ref_client VARCHAR(8) NOT NULL,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  adresse VARCHAR(42),
  mail VARCHAR(255),
  PRIMARY KEY (ref_client)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE FOO (
  foo VARCHAR(42) NOT NULL,
  bar VARCHAR(42),
  biz VARCHAR(42),
  buz VARCHAR(42),
  qux VARCHAR(42),
  quux VARCHAR(42),
  PRIMARY KEY (foo)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE UTILISER (
  carnet VARCHAR(42) NOT NULL,
  projet VARCHAR(42) NOT NULL,
  technicien VARCHAR(42),
  PRIMARY KEY (carnet, projet)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE CLIENT ADD CONSTRAINT CLIENT_u1 UNIQUE (nom, prenom);
ALTER TABLE CLIENT ADD CONSTRAINT CLIENT_u2 UNIQUE (mail);
ALTER TABLE FOO ADD CONSTRAINT FOO_u1 UNIQUE (bar, biz, quux);
ALTER TABLE FOO ADD CONSTRAINT FOO_u2 UNIQUE (biz, buz, quux);
ALTER TABLE FOO ADD CONSTRAINT FOO_u3 UNIQUE (qux, quux);
ALTER TABLE UTILISER ADD CONSTRAINT UTILISER_u1 UNIQUE (carnet, technicien);
ALTER TABLE UTILISER ADD CONSTRAINT UTILISER_u2 UNIQUE (projet, technicien);
