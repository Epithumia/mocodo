- **Appliquer** (<ins>employé</ins>, <ins>projet</ins>, <ins>compétence</ins>)
  - Le champ _employé_ fait partie de la clé primaire de la table. Sa table d'origine (_Employé_) ayant été supprimée, il n'est pas considéré comme clé étrangère.
  - Le champ _projet_ fait partie de la clé primaire de la table. Sa table d'origine (_Projet_) ayant été supprimée, il n'est pas considéré comme clé étrangère.
  - Le champ _compétence_ fait partie de la clé primaire de la table. Sa table d'origine (_Compétence_) ayant été supprimée, il n'est pas considéré comme clé étrangère.
<br>
----


**NB.** Les tables _Compétence_, _Employé_ et _Projet_ ont été supprimées car elles étaient réduites à la clé primaire de leur entité d'origine. Pour conserver une telle table, suffixez d'un « + » le nom de l'entité correspondante dans sa définition.
