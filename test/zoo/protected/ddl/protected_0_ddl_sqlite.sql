.open protected;

CREATE TABLE AGENCE (
  id_agence VARCHAR(8) NOT NULL,
  nom_agence VARCHAR(255),
  PRIMARY KEY (id_agence)
);

CREATE TABLE DIRECTION_REGIONALE (
  id_dir VARCHAR(8) NOT NULL,
  nom_dir VARCHAR(255),
  PRIMARY KEY (id_dir)
);

CREATE TABLE SUPERVISER (
  id_agence VARCHAR(8) NOT NULL,
  id_dir VARCHAR(8) NOT NULL,
  PRIMARY KEY (id_agence)
  FOREIGN KEY (id_agence) REFERENCES AGENCE (id_agence),
  FOREIGN KEY (id_dir) REFERENCES DIRECTION_REGIONALE (id_dir)
);
