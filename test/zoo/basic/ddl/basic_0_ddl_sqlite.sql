.open basic;

CREATE TABLE CLIENT (
  ref_client VARCHAR(8),
  nom VARCHAR(255),
  prenom VARCHAR(255),
  adresse VARCHAR(42),
  PRIMARY KEY (ref_client)
);

CREATE TABLE COMMANDE (
  num_commande VARCHAR(8),
  date DATE,
  montant DECIMAL(10,2),
  ref_client VARCHAR(8),
  PRIMARY KEY (num_commande)
  FOREIGN KEY (ref_client) REFERENCES CLIENT (ref_client)
);

CREATE TABLE INCLURE (
  num_commande VARCHAR(8),
  ref_produit VARCHAR(8),
  quantite INTEGER,
  PRIMARY KEY (num_commande, ref_produit)
  FOREIGN KEY (num_commande) REFERENCES COMMANDE (num_commande),
  FOREIGN KEY (ref_produit) REFERENCES PRODUIT (ref_produit)
);

CREATE TABLE PRODUIT (
  ref_produit VARCHAR(8),
  libelle VARCHAR(50),
  prix_unitaire DECIMAL(10,2),
  PRIMARY KEY (ref_produit)
);
