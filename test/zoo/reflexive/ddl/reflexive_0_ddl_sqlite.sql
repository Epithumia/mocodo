.open reflexive;

CREATE TABLE COMPOSER (
  piece_composante VARCHAR(42) NOT NULL,
  piece_composee VARCHAR(42) NOT NULL,
  PRIMARY KEY (piece_composante, piece_composee)
);

CREATE TABLE HOMME (
  num_ss VARCHAR(8) NOT NULL,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  num_ss_pere VARCHAR(8) NULL,
  PRIMARY KEY (num_ss)
  FOREIGN KEY (num_ss_pere) REFERENCES HOMME (num_ss)
);
