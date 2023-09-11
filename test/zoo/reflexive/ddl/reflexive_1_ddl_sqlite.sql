.open reflexive;

CREATE TABLE COMPOSER (
  piece VARCHAR(42) NOT NULL,
  piece_1 VARCHAR(42) NOT NULL,
  PRIMARY KEY (piece, piece_1)
);

CREATE TABLE HOMME (
  num_ss VARCHAR(8) NOT NULL,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  num_ss_1 VARCHAR(8) NOT NULL,
  PRIMARY KEY (num_ss)
  FOREIGN KEY (num_ss_1) REFERENCES HOMME (num_ss)
);
