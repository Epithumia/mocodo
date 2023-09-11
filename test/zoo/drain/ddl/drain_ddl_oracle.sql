CREATE TABLE ENTREPRISE (
  nom_entreprise VARCHAR(255) NOT NULL,
  adresse VARCHAR(42),
  telephone VARCHAR(20),
  PRIMARY KEY (nom_entreprise)
);

CREATE TABLE ETUDIANT (
  num_etudiant VARCHAR(8) NOT NULL,
  nom VARCHAR(255),
  num_stage VARCHAR(8) NOT NULL,
  date_signature BINARY(64),
  date DATE NULL,
  note_stage TEXT,
  PRIMARY KEY (num_etudiant)
);

CREATE TABLE STAGE (
  num_stage VARCHAR(8) NOT NULL,
  sujet VARCHAR(42),
  nom_entreprise VARCHAR(255) NOT NULL,
  date_proposition DATE,
  PRIMARY KEY (num_stage)
);

ALTER TABLE ETUDIANT ADD FOREIGN KEY (num_stage) REFERENCES STAGE (num_stage);
ALTER TABLE STAGE ADD FOREIGN KEY (nom_entreprise) REFERENCES ENTREPRISE (nom_entreprise);
ALTER TABLE ETUDIANT ADD CONSTRAINT ETUDIANT_u1 UNIQUE (num_stage);
