- **Utiliser** (<ins>carnet</ins> <sup>u1</sup>, <ins>projet</ins> <sup>u2</sup>, technicien <sup>u1 u2</sup>)
  - Le champ _carnet_ fait partie de la clé primaire de la table. Sa table d'origine (_Carnet_) ayant été supprimée, il n'est pas considéré comme clé étrangère. Il obéit par contre à la contrainte d'unicité 1.
  - Le champ _projet_ fait partie de la clé primaire de la table. Sa table d'origine (_Projet_) ayant été supprimée, il n'est pas considéré comme clé étrangère. Il obéit par contre à la contrainte d'unicité 2.
  - Le champ _technicien_ est un simple attribut. Il a migré directement à partir de l'entité _Technicien_ en perdant son caractère identifiant. Cependant, comme la table créée à partir de cette entité a été supprimée, il n'est pas considéré comme clé étrangère. Il obéit par contre aux contraintes d'unicité 1 et 2.
<br>
----


**NB.** Les tables _Carnet_, _Projet_ et _Technicien_ ont été supprimées car elles étaient réduites à la clé primaire de leur entité d'origine. Pour conserver une telle table, suffixez d'un « + » le nom de l'entité correspondante dans sa définition.
