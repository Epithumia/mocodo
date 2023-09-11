.open triple_N11;

CREATE TABLE AFFECTER (
  projet VARCHAR(42) NOT NULL,
  employe VARCHAR(42) NOT NULL,
  site VARCHAR(42) NOT NULL,
  PRIMARY KEY (projet, employe)
  FOREIGN KEY (projet) REFERENCES PROJET (projet),
  FOREIGN KEY (employe) REFERENCES EMPLOYE (employe),
  FOREIGN KEY (site) REFERENCES SITE (site)
);

CREATE TABLE EMPLOYE (
  employe VARCHAR(42) NOT NULL,
  nom_employe VARCHAR(255),
  PRIMARY KEY (employe)
);

CREATE TABLE PROJET (
  projet VARCHAR(42) NOT NULL,
  libelle VARCHAR(50),
  PRIMARY KEY (projet)
);

CREATE TABLE SITE (
  site VARCHAR(42) NOT NULL,
  position POINT,
  PRIMARY KEY (site)
);

CREATE UNIQUE INDEX AFFECTER_u1 ON AFFECTER (employe, site);
