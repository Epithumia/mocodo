.open gerund;

CREATE TABLE COMMANDE (
  commande VARCHAR(42),
  date DATE,
  PRIMARY KEY (commande)
);

CREATE TABLE LIGNE_DE_COMMANDE (
  commande VARCHAR(42),
  produit VARCHAR(42),
  quantite INTEGER,
  PRIMARY KEY (commande, produit)
  FOREIGN KEY (commande) REFERENCES COMMANDE (commande),
  FOREIGN KEY (produit) REFERENCES PRODUIT (produit)
);

CREATE TABLE PRODUIT (
  produit VARCHAR(42),
  libelle VARCHAR(50),
  PRIMARY KEY (produit)
);
