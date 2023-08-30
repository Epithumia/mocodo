CREATE DATABASE IF NOT EXISTS drain;
USE drain;

CREATE TABLE ENTREPRISE (
  nom_entreprise VARCHAR(255),
  adresse VARCHAR(42),
  telephone VARCHAR(20),
  PRIMARY KEY (nom_entreprise)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE ETUDIANT (
  num_etudiant VARCHAR(8),
  nom VARCHAR(255),
  num_stage VARCHAR(8),
  date_signature BINARY(64),
  date DATE,
  note_stage TEXT,
  PRIMARY KEY (num_etudiant)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE STAGE (
  num_stage VARCHAR(8),
  sujet VARCHAR(42),
  nom_entreprise VARCHAR(255),
  date_proposition DATE,
  PRIMARY KEY (num_stage)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE ETUDIANT ADD FOREIGN KEY (num_stage) REFERENCES STAGE (num_stage);
ALTER TABLE STAGE ADD FOREIGN KEY (nom_entreprise) REFERENCES ENTREPRISE (nom_entreprise);
