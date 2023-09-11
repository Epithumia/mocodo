CREATE DATABASE ternary_unicity;
\c ternary_unicity;

CREATE TABLE DISPONIBILITE (
  semaine VARCHAR(42) NOT NULL,
  voilier VARCHAR(42) NOT NULL,
  PRIMARY KEY (semaine, voilier)
);

CREATE TABLE RESERVATION (
  id_resa VARCHAR(8) NOT NULL,
  num_resa VARCHAR(8),
  arrhes VARCHAR(42),
  date_reservation DATE,
  semaine VARCHAR(42) NOT NULL,
  voilier VARCHAR(42) NOT NULL,
  PRIMARY KEY (id_resa)
);

CREATE TABLE SEMAINE (
  semaine VARCHAR(42) NOT NULL,
  date_debut DATE,
  PRIMARY KEY (semaine)
);

ALTER TABLE DISPONIBILITE ADD FOREIGN KEY (semaine) REFERENCES SEMAINE (semaine);
ALTER TABLE RESERVATION ADD FOREIGN KEY (semaine, voilier) REFERENCES DISPONIBILITE (semaine, voilier);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_u1 UNIQUE (num_resa);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_u2 UNIQUE (semaine, voilier);
ALTER TABLE SEMAINE ADD CONSTRAINT SEMAINE_u1 UNIQUE (date_debut);
