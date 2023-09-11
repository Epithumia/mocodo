.open protected;

CREATE TABLE EROS (
  congue VARCHAR(42) NOT NULL,
  PRIMARY KEY (congue)
);

CREATE TABLE LACUS (
  blandit VARCHAR(42) NOT NULL,
  elit VARCHAR(42),
  PRIMARY KEY (blandit)
);

CREATE TABLE LIGULA (
  blandit VARCHAR(42) NOT NULL,
  congue VARCHAR(42) NOT NULL,
  metus VARCHAR(42),
  PRIMARY KEY (blandit)
  FOREIGN KEY (blandit) REFERENCES LACUS (blandit),
  FOREIGN KEY (congue) REFERENCES EROS (congue)
);
