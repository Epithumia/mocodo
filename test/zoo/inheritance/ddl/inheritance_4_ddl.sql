-- Generated by Mocodo 4.0.2

CREATE TABLE LACUS (
  PRIMARY KEY (magna),
  magna VARCHAR(42) NOT NULL,
  tempor VARCHAR(42),
  fugit VARCHAR(42)
);

CREATE TABLE NEC (
  PRIMARY KEY (magna),
  magna VARCHAR(42) NOT NULL,
  pulvinar VARCHAR(42),
  audis VARCHAR(42),
  magna_via_mollis VARCHAR(42) NOT NULL,
  magna_via_vitae VARCHAR(42) NOT NULL
);

CREATE TABLE SODALES (
  PRIMARY KEY (magna),
  magna VARCHAR(42) NOT NULL,
  convallis VARCHAR(42),
  ipsum VARCHAR(42)
);

CREATE TABLE TRISTIS (
  PRIMARY KEY (magna),
  magna VARCHAR(42) NOT NULL,
  vestibulum VARCHAR(42),
  type UNSIGNED INT
);

CREATE TABLE ULTRICES (
  PRIMARY KEY (magna_sodales, magna_lacus),
  magna_sodales VARCHAR(42) NOT NULL,
  magna_lacus VARCHAR(42) NOT NULL
);

ALTER TABLE LACUS ADD FOREIGN KEY (magna) REFERENCES TRISTIS (magna);

ALTER TABLE NEC ADD FOREIGN KEY (magna_via_vitae) REFERENCES SODALES (magna);
ALTER TABLE NEC ADD FOREIGN KEY (magna_via_mollis) REFERENCES LACUS (magna);
ALTER TABLE NEC ADD FOREIGN KEY (magna) REFERENCES TRISTIS (magna);

ALTER TABLE SODALES ADD FOREIGN KEY (magna) REFERENCES TRISTIS (magna);

ALTER TABLE ULTRICES ADD FOREIGN KEY (magna_lacus) REFERENCES LACUS (magna);
ALTER TABLE ULTRICES ADD FOREIGN KEY (magna_sodales) REFERENCES SODALES (magna);
