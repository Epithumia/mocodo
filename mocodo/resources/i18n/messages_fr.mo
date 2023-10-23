��    �      \              �
  +  �
  	  �  (   �  5   �  @   2     s     �  ]   �  C   �  E   :  x   �  Y   �  �   S       �     ?   �  <   �  P   (  M   y  %   �  �   �  x   o     �     �  4   �  D   +     p  @   }  C   �  0     &   3  !   Z  b   |     �  B   �  <   ;  9   x  0   �  8   �       $   0  
   U  8   `  	   �  .   �  /   �  �     �   �  |     �   �  T   "     w       2   �  I   �  !     *   :     e  +   �  S   �  F     7   J  L   �  6   �  O      /   V   *   �   '   �   +   �      !     !  C   !  @   ^!     �!  �   �!  0   ^"  .   �"  5   �"  3   �"  R   (#  ;   {#  9   �#  A   �#  5   3$  %   i$  I   �$  +   �$  2   %  3   8%  E   l%     �%  -   �%  	   �%  T   �%  !  B&  >   d'  G   �'  M   �'  h   9(  /   �(  7   �(  H   
)  j   S)  5   �)  1   �)  F   &*  H   m*  8   �*  >   �*  #   .+  (   R+  '   {+  '   �+  '   �+  K   �+  (   ?,     h,     �,  4   �,  %   �,  :   �,  !   !-  �   C-  !   �-  /   �-  -   #.  4   Q.  �   �.  !   /  `   ?/  ~   �/  >   0  .   ^0  J   �0  N   �0  f   '1     �1     �1     �1     �1  )   �1  %   2  A   <2  Y   ~2  M   �2  (   &3  -   O3  E   }3  5   �3  9   �3  6   34  -   j4     �4  %   �4     �4  /   �4  %   #5     I5     b5     �5     �5  &   �5  !   �5  J    6  4   K6  :   �6     �6  �  �6  �  �8    a<  8   n?  N   �?  O   �?     F@     f@  m   l@  Q   �@  R   ,A  �   A  {   "B  �   �B     |C  �   �C  Z   LD  M   �D  h   �D  c   ^E  )   �E  �   �E  �   �F     G     &G  .   .G  Q   ]G     �G  O   �G  T   H  :   eH  1   �H  (   �H  q   �H     mI  T   �I  ?   �I  S   !J  <   uJ  O   �J  #   K  P   &K     wK  <   �K  
   �K  ;   �K  >   L  �   FL  �   �L  �   �M  �   MN  p   O     xO      �O  2   �O  V   �O  (   ,P  6   UP  '   �P  ;   �P  ^   �P  X   OQ  B   �Q  i   �Q  J   UR  [   �R  G   �R  G   DS  7   �S  4   �S     �S     �S  Z   T  G   gT     �T  �   �T  0   �U  8   �U  ;   �U  <   *V  M   gV  F   �V  D   �V  -   AW  :   oW  +   �W  F   �W  -   X  K   KX  B   �X  D   �X     Y  ;   "Y  
   ^Y  N   iY  G  �Y  E    [  Z   F[  [   �[  k   �[  7   i\  K   �\  W   �\  ~   E]  J   �]  A   ^  ]   Q^  R   �^  G   _  G   J_  )   �_  Z   �_  .   `  -   F`  .   t`  Y   �`  .   �`  "   ,a     Oa  M   Ua  =   �a  @   �a  '   "b  �   Jb  (   �b  6   c  4   Hc  9   }c  �   �c  %   nd  o   �d  �   e  J   �e  D   �e  `   ;f  X   �f  q   �f     gg     {g     �g     �g  5   �g  7   �g  E   1h  v   wh  c   �h  4   Ri  8   �i  L   �i  B   j  �  Pj  P   �k  =   *l     hl  /   �l  "   �l  5   �l  +   m     <m      [m     |m     �m  ,   �m  2   �m  f   n  K   {n  A   �n     	o   
        NAME:
        Mocodo - An Entity-Relation Diagram Generator.

        DESCRIPTION:
        Mocodo is an open-source tool for designing and teaching relational databases.
        It takes as an input a textual description of both entities and associations
        of an entity-relationship diagram (ERD). It outputs a vectorial drawing in SVG
        and a relational schema in various formats (SQL, LaTeX, Markdown, etc.).

        NOTE:
        Each one of the following values is:
        - explicitely specified by the user as a command line option;
        - otherwise, retrieved from a file located at --params_path;
        - otherwise, retrieved from a file named 'params.json' in the input directory;
        - otherwise, calculated from a default value, possibly dependant of your system.
     
        SEE ALSO:
          Online version        https://mocodo.net
          Source code           https://github.com/laowantong/mocodo
          Documentation         https://rawgit.com/laowantong/mocodo/master/doc/fr_refman.html
          Cheat sheet for -t    https://github.com/laowantong/mocodo/blob/master/doc/fr_cheat_sheet.md

        LICENSE:                MIT

        CONTACT:
          Author                Aristide Grange
          Address               Université de Lorraine
                                Laboratoire LCOMS - UFR MIM
                                3 rue Augustin Fresnel
                                57070 METZ Technopôle
                                France
          Mail                  <author.full.name>@univ-lorraine.fr
       - Leg "{b1} — {b2}" overlaps "{b3}".   - Legs "{b1} — {b2}" and "{b3} — {b4}" overlap. A weak entity (here, {entity}) cannot be strengthened by itself. ASPECT OF THE GRAPHICAL OUTPUT ASSOC An association named "{df_label}" must have at least one leg with a maximal cardinality of 1. Association "{association}" linked to an unknown entity "{entity}"! Association "{association}" linked to another association "{entity}"! Attribute "{attribute_1}" in entity "{entity_1}" references an unknown attribute "{attribute_2}" in entity "{entity_2}". Attribute "{attribute}" in entity "{entity_1}" references an unknown entity "{entity_2}". Bad layout of boxes:
{details}
To fix the problem, reorder and/or skip lines in the source text, either manually, or with the option -t arrange (chocolate bar under Mocodo online). Binary Cannot compile the regular expression "{regex}" or the remplacement string "{replace}" in a relation template producing "*{stem_suffix}.{extension}" files. Cannot find a suitable combination of card schemes and arities. Circular inheritance in template "{name}.yaml" of "{folder}. Constraint "{constraint}" aligned with an unknown entity or association "{box}"! Constraint "{constraint}" linked to an unknown entity or association "{box}"! Cycle of weak entities in {entities}. Duplicate association "{name}". If you want to make two associations appear with the same name, you must suffix it with a number. Duplicate entity "{name}". If you want to make two entities appear with the same name, you must suffix it with a number. ENTITY Entity Failed to calculate a non-constrained planar layout. Failed to calculate a planar layout satisfying the given constraint. INPUT/OUTPUT Inheritance "{inheritance}" linked to an association "{entity}"! Inheritance "{inheritance}" linked to an unknown entity "{entity}"! Invalid sub-argument: "{subsubopt}={subsubarg}". Invalid sub-sub-option: "{subsubopt}". Layout calculation time exceeded. No third-party rendering service for extension "{extension}". You may want to add one in "{path}". OPTIONS ON MOCODO ITSELF Obfuscation failed. Not enough substitution words in "{filename}". One entity and one association share the same name "{name}". Operation "{op_name}" cannot be applied to "{pre_token}". Output file "{filename}" successfully generated. PNG and PDF generation requires cairosvg to be installed Parsing error:
{e}
 Problem with "{name}" file "{path}". Quaternary Reciprocal relative identification around {association}. Reflexive Source file "{filename}" successfully updated. Template "{name}.yaml" not found in "{folder}". Template "{name}.yaml" of "{folder}" contains a YAML array as value of key "{key}" where the "order" key is not associated to a number. Template "{name}.yaml" of "{folder}" contains a YAML array as value of key "{key}" where the "order" keys are not sorted in ascending order. Template "{name}.yaml" of "{folder}" contains a YAML array as value of key "{key}" which does not contain only YAML objects. Template "{name}.yaml" of "{folder}" contains a YAML array as value of key "{key}" which does not contain only objects having an "order" key. Template "{name}.yaml" of "{folder}" contains a YAML object as value of key "{key}". Ternary The ERD "{title}" is empty. The HTTP status code {code} was returned by:
{url} The association "{name}" should have at least 3 legs to become a cluster. The file "{input}" doesn't exist. The file "{path}" could not be read:
{err} The file "{path}" is missing. The file "{path}" is not a valid JSON file. The template '{stem}' doesn't have a help message in language of code '{language}'. The transformation '{subopt}' is not among the possible ones:
{valid}. The weak entity "{entity}" should have a discriminator. Totality (/T\ or /XT\) is mandatory for "=>" inheritance of parent "{name}". Unable to decode template "{name}.yaml" of "{folder}". Unable to read "{filename}" with any of the following encodings: "{encodings}". Unable to reuse the geometry file "{filename}". Unable to save geometry file "{filename}". Unknown "{opt}" sub-option: "{subopt}". Unknown argument "{k}" for option --select. Untitled Weak Entity add random entities and associations (default: 10 new associations) apply a vertical, horizontal or diagonal symmetry to the diagram attr backward compatibility alias for '-t' (with no arguments). Same as '-t markdown' but, under Jupyter Notebook, does not prevent the rendering of the conceptual diagram in the cell output collect all the attributes of the MCD in a table convert the conceptual model into a Chen's ERD convert the conceptual model into a UML class diagram convert the conceptual model into a crow's foot ERD convert the conceptual model into a relational schema with the given template path decompose any n-ary (*,1) associations into n-1 binary ones decompose any n-ary (*,N) associations into n binary ones discriminate between multiple SVG of the same interactive diagram display the contents of the parameter file, then exit display the version number, then exit dump the abstract syntax tree of the source text (for debugging purposes) encode the MCD into a URL for Mocodo online flex straight legs whose cardinalities may collide format string for minimal and maximal cardinalities generate a PNG or a PDF version of the SVG output (requires CairoSVG) id initial value for the random number generator is {name} keep the stucture, but replace the given elements with random ones whenever possible make a new version of the MCD by applying sequentially the given rewriting operations, and/or convert it into the given formats or languages. Under Jupyter Notebook, '-T' respectively replaces the current cell by the textual result, or copies it into the clipboard (pip3 install pyperclip) move any (1,1) association attribute to the appropriate entity name of the model, used at various places (file system, database, etc.) one or several encodings to be tried successively when reading the input file override the automatic localization of the messages with the given language code (e.g., 'fr', 'en', ...) prefix the given elements with the given string raise an error when horizontal or vertical legs overlap rearrange the layout with either a Branch & Bound or a Genetic Algorithm recreate a pristine version of the files 'sandbox.mcd' and 'params.json' in the input directory, then exit replace all element names by a numbered generic label reuse the geometry file of the previous execution rewrite the given elements by applying the given 'search/repl' pattern rewrite the given elements by capitalizing the first letter of each word rewrite the given elements by keeping only a given slice rewrite the given elements by swapping the case of each letter rewrite the given elements in ASCII rewrite the given elements in Title Case rewrite the given elements in UPPERCASE rewrite the given elements in camelCase rewrite the given elements in lowercase rewrite the given elements in lowercase, but more aggressively than 'lower' rewrite the given elements in snake_case rewrite the source text as is role scale all calculated text widths by the given factor scale the diagram by the given factor set the visibility and the contents of the lateral gutters show this help message, then exit specification of the fonts, dimensions, etc. Name (without extension) of a file located in the directory 'shapes', or path to a personal file string for relative cardinalities suffix the given elements with the given string suppress the given elements whenever possible the acronym to be circled in a functional dependency the color palette to use when generating the drawing. Name (without extension) of a file located in the directory 'colors', or path to a personal file the directory of the output files the path of the input file. By default, the output files will be generated in the same directory the path of the parameter file. If omitted, use 'params.json' in the input directory. If non existent, use default parameters. truncate the given elements to the given length (default: {n}) try to fix common errors in the given elements try to infer types, entities, CIFs or DF arrows from the existing elements under Jupyter Notebook, explicitely state the categories of results to display use an external web-service to further convert the conversion results into the given graphical formats {complete, disjoint} {complete, overlapping} {incomplete, disjoint} {incomplete, overlapping} {pin}"{v}" is not a valid line beginning. {pin}A box name cannot contain "{v}". {pin}A constraint name cannot contain more than three characters. {pin}A parent name must be followed by an inheritance arrow among "<=", "<-", "->", "=>". {pin}A valid box name starting a line must be followed by a colon or a comma. {pin}An association leg cannot be empty. {pin}An attribute label cannot contain "{v}". {pin}An attribute label cannot have more than one optionality marker. {pin}An attribute label cannot start with "{v[1]!r}". {pin}An attribute starting with "#" must contain two ">". {pin}An inheritance name must be "", "X", "T" or "XT". {pin}Expected a box name or a constraint leg. {pin}Expected a comma. {pin}Expected a number or a box name. {pin}Expected an entity name. {pin}Illegal character after a constraint name. {pin}Illegal comma after inheritance. {pin}Malformed box name. {pin}Malformed cardinalities. {pin}Malformed number. {pin}More than two coordinates. {pin}Only a box name is possible here. {pin}Only two coords are allowed. {pin}Please change the old foreign key syntax ("->") by the new one (">"). {pin}The constraint targets must be comma-separated. {pin}Token "{t}" encountered. Expected tokens: {expected}. {pin}Unclosed square bracket. Project-Id-Version: mocodo
POT-Creation-Date: 2023-09-23 13:41+0200
PO-Revision-Date: 2015-08-16 07:00+0000
Last-Translator: Aristide Grange <chewingword@wingi.net>, 2015-2016,2022-2023
Language-Team: French (http://app.transifex.com/aristide/mocodo/language/fr/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: pygettext.py 1.5
Language: fr
Plural-Forms: nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;
 
        NOM :
        Mocodo - Un générateur de diagrammes entité-association.

        DESCRIPTION :
        Mocodo est un outil libre destiné à l'enseignement des bases de données relationnelles.
        Il prend en entrée une description textuelle des entités et associations d'un diagramme
        entité-association (MCD). Il produit en sortie un dessin vectoriel en SVG et un schéma
        relationnel dans divers formats (SQL, LaTeX, Markdown, etc.).

        NOTE :
        Chacune des valeurs suivantes est :
        - spécifiée explicitement par l'utilisateur comme option de ligne de commande ;
        - sinon, récupérée depuis un fichier de chemin --params_path ;
        - sinon, récupérée depuis un fichier nommé « params.json » dans le répertoire d'entrée ;
        - sinon, calculée à partir d'une valeur par défaut, éventuellement dépendante de votre système.
     
        VOIR AUSSI :
          Version en ligne      https://mocodo.net
          Code source           https://github.com/laowantong/mocodo
          Documentation         https://rawgit.com/laowantong/mocodo/master/doc/fr_refman.html
          Aide-mémoire pour -t  https://github.com/laowantong/mocodo/blob/master/doc/fr_cheat_sheet.md

        LICENCE :               MIT

        CONTACT :
          Auteur                Aristide Grange
          Adresse               Université de Lorraine
                                Laboratoire LCOMS - UFR MIM
                                3 rue Augustin Fresnel
                                57070 METZ Technopôle
                                France
          Courriel              <prénom.nom>@univ-lorraine.fr
       - La patte « {b1} — {b2} » chevauche « {b3} ».   - Les pattes  « {b1} — {b2} » et « {b3} — {b4} » se chevauchent. Une entité faible (ici, {entity}) ne peut pas être renforcée par elle-même. ASPECT DE LA SORTIE GRAPHIQUE  ASSOC Une association nommée « {df_label} » doit avoir au moins une patte avec une cardinalité maximale de 1. Association « {association} » liée à une entité inconnue « {entity} ». Association « {association} » liée à une autre association « {entity} ». L'attribute « {attribute_1} » de l'entité « {entity_1} » fait référence à un attribut « {attribute_2} » inconnu dans l'entité « {entity_2} ». L'attribut « {attribute} » de l'entité « {entity_1} » fait référence à une entité « {entity_2} » inconnue. Mauvaise disposition des boîtes :
{details}
Pour corriger cela, réordonnez et/ou sautez des lignes dans le texte-source, soit à la main, soit à l'aide de l'option -t arrange (tablette de chocolat sous Mocodo online). Binaire Impossible de compiler l'expression régulière « {regex} » ou la chaîne de remplacement « {replace} » dans un gabarit de relation produisant des fichiers « *{stem_suffix}.{extension} ». Impossible de trouver une combinaison adéquate de schémas de cardinalités et d'arités. Héritage circulaire dans le gabarit « {name}.yaml » de « {folder} ». Une contrainte « {constraint} » est alignée avec une entité ou association inconnue « {box} ». Une contrainte « {constraint} » est liée à une entité ou association inconnue « {box} ». Cycle d'entités faibles dans {entities}. Association « {name} » dupliquée. Si vous souhaitez faire apparaître deux associations sous le même nom, vous devez suffixer celui-ci avec un nombre. Entité « {name} » dupliquée. Si vous souhaitez faire apparaître deux entités sous le même nom, vous devez suffixer celui-ci avec un nombre. ENTITÉ Entité Impossible de calculer un plongement planaire. Impossible de calculer un plongement planaire satisfaisant la contrainte donnée. ENTRÉE/SORTIE  L'héritage « {inheritance} » est lié à une association « {entity} ». L'héritage « {inheritance} » est lié à une entité inconnue « {entity} ». Sous-argument invalide : « {subsubopt}={subsubarg} ». Sous-sous-option invalide : « {subsubopt} ». Temps de calcul du plongement dépassé. Aucun service de rendu tiers pour l'extension « {extension} ». Vous pouvez en ajouter un dans « {path} ». OPTIONS SUR MOCODO LUI-MÊME  L'obfuscation a échoué. Pas assez de mots de substitution dans « {filename} ». Une entité et une association ont le même nom « {name} ». L'opération « {op_name} » ne peut pas être appliquée à « {pre_token} ». Fichier de sortie « {filename} » généré avec succès. Générer un PNG ou un PDF requiert une installation fonctionnelle de CairoSVG. Erreur d'analyse syntaxique :
{e}
 Problème lors du chargement de « {name} » au bout du chemin « {path} ». Quaternaire Identification relative réciproque autour de {association}. Réflexive Fichier source « {filename} » mis à jour avec succès. Gabarit « {name}.yaml » introuvable dans « {folder} ». Le gabarit « {name}.yaml » de « {folder} » contient un tableau YAML comme valeur de la clé « {key} » où la clé « order » n'est pas associée à un nombre. Le gabarit « {name}.yaml » de « {folder} » contient un tableau YAML comme valeur de la clé « {key} » où les clés « order » ne sont pas triées par ordre croissant. Le gabarit « {name}.yaml » de « {folder} » contient un tableau YAML comme valeur de la clé « {key} » qui ne contient pas uniquement des objets YAML. Le gabarit « {name}.yaml » de « {folder} » contient un tableau YAML comme valeur de la clé « {key} » qui ne contient pas uniquement des objets ayant une clé « order ». Le gabarit « {name}.yaml » de « {folder} » contient un objet YAML comme valeur de la clé « {key} ». Ternaire Le MCD « {title} » est vide. Le code HTTP {code} a été retourné par :
{url} L'association « {name} » devrait avoir au moins 3 pattes pour devenir un agrégat. Le fichier « {input} » n'existe pas. Le fichier « {path} » n'a pas pu être lu :
{err} Le fichier « {path} » est manquant. Le fichier « {path} » n'est pas un fichier JSON valide. Le gabarit « {stem} » n'a pas de message d'aide dans la langue de code « {language} ». La transformation « {subopt} » n'est pas parmi celles qui sont possibles :
{valid}. L'entité faible « {entity} » devrait avoir un discriminateur. La totalité (/T\ ou /XT\) est obligatoire pour l'héritage « => » de l'entité-mère « {name} ». Impossible de décoder le gabarit « {name}.yaml » de « {folder} ». Impossible de lire « {filename} » dans aucun des encodages suivants : \"{encodings}\". Impossible de réutiliser le fichier de géométrie « {filename} ». Impossible de sauvegarder le fichier de géométrie « {filename} ». Sous-option « {opt} » inconnue : « {subopt} ». Argument « {k} » inconnu pour l'option --select. MCD Entité faible ajoute des entités et associations aléatoires (par défaut : 10 nouvelles associations) applique au diagramme une symétrie verticale, horizontale ou diagonale at alias de compatibilité ascendante pour « -t » (sans arguments). Équivalent à « -t markdown » mais, sous Jupyter Notebook, n'empêche pas le rendu du diagramme conceptuel dans la sortie de la cellule extrait tous les attributs du MCD dans une table convertit le modèle conceptuel dans la notation de Chen convertit le modèle conceptuel en diagramme de classes UML convertit le modèle conceptuel dans la notation crow's foot convertit le modèle conceptuel en schéma relationnel avec le gabarit donné décompose toute association n-aire (*,1) en n-1 associations binaires décompose toute association n-aire (*,N) en n associations binaires ajoute un discriminateur à un SVG interactif affiche le contenu du fichier de paramètres, puis termine affiche le numéro de version, puis termine crée l'arbre de syntaxe abstraite du texte source (pour le débogage) encode le MCD dans une URL pour Mocodo online incurve les pattes rectilignes dont les cardinalités peuvent se chevaucher chaîne de formatage pour les cardinalités minimales et maximales génère une version PNG ou PDF de la sortie SVG (requiert CairoSVG) id valeur initiale pour le générateur de nombres aléatoires est {name} garde la structure, mais randomise les éléments donnés quand c'est possible crée une nouvelle version du MCD en appliquant séquentiellement les opérations de réécriture données, et/ou le convertit dans les formats ou langages donnés. Sous Jupyter Notebook, « -T » remplace respectivement la cellule courante par le résultat textuel, ou le copie dans le presse-papier (pip3 install pyperclip) déplace tout attribut d'association (1,1) vers l'entité appropriée nom du modèle, utilisé à divers endroits (système de fichiers, base de données, etc.) un ou plusieurs encodages à essayer successivement lors de la lecture du fichier d'entrée force la localisation des messages avec le code de langue donné (par exemple, « fr », « en », ...) préfixe les éléments donnés avec la chaîne donnée lève une erreur quand des pattes horizontales ou verticales se chevauchent réarrange la disposition, soit par Branch & Bound, soit avec un algorithme génétique recrée une version vierge des fichiers « sandbox.mcd » et « params.json » dans le répertoire d'entrée, puis termine remplace tous les noms d'éléments par un libellé générique numéroté réutilise le fichier de géométrie de l'exécution précédente réécrit les éléments donnés en appliquant le motif « recherche/remplacement » donné réécrit les éléments donnés en capitalisant la première lettre de chaque mot réécrit les éléments donnés en n'en gardant qu'une tranche donnée réécrit les éléments donnés en inversant la casse de chaque lettre réécrit les éléments donnés en ASCII réécrit les éléments donnés en mettant la première lettre de chaque mot en majuscule réécrit les éléments donnés en majuscules réécrit les éléments donnés en camelCase réécrit les éléments donnés en minuscules réécrit les éléments donnés en minuscules, mais plus agressivement que « lower » réécrit les éléments donnés en snake_case réécrit le texte source tel quel rôle applique à tous les textes calculés le facteur de mise à l'échelle donné applique au diagramme le facteur de mise à l'échelle donné définit la visibilité et le contenu des gouttières latérales affiche ce message d'aide, puis termine spécification des polices, dimensions, etc. Nom (sans extension) d'un fichier situé dans le répertoire « shapes », ou chemin vers un fichier personnel chaîne pour les cardinalités relatives suffixe les éléments donnés avec la chaîne donnée supprime les éléments donnés quand c'est possible l'acronyme à entourer dans une dépendance fonctionnelle la palette de couleurs à utiliser lors de la génération du dessin. Nom (sans extension) d'un fichier situé dans le répertoire « colors », ou chemin vers un fichier personnel le répertoire des fichiers de sortie le chemin du fichier d'entrée. Par défaut, les fichiers de sortie seront générés dans le même répertoire le chemin du fichier de paramètres. S'il est omis, utilise « params.json » dans le répertoire d'entrée. S'il n'existe pas, utilise les paramètres par défaut. tronque les éléments donnés à la longueur donnée (par défaut : {n}) essaie de corriger les erreurs courantes dans les éléments donnés essaie d'inférer les types, entités, CIFs ou flèches de DF à partir des éléments existants sous Jupyter Notebook, spécifie explicitement les catégories de résultats à afficher utilise un service web externe pour convertir les résultats de la conversion dans les formats graphiques donnés {complet, disjoint} {complet, non disjoint} {incomplet, disjoint} {incomplet, non disjoint} {pin}« {v} » n'est pas un début de ligne valide. {pin}Un nom de boîte ne peut pas contenir « {v} ». {pin}Un nom de contrainte ne peut contenir plus de trois caractères. {pin}Un nom de parent doit être suivi d'une flèche d'héritage parmi « <= », « <- », « -> », « => ». {pin}Un nom de boîte valide en début de ligne doit être suivi d'un deux-points ou d'une virgule. {pin}Une patte d'association ne peut pas être vide. {pin}Un nom d'attribut ne peut pas contenir « {v} ». {pin}Un nom d'attribut ne peut pas avoir plus d'un marqueur d'optionnalité. {pin}Un nom d'attribut ne peut pas commencer par « {v[1]!r} ». {pin}Vous semblez essayer de spécifier une clé étrangère. Au niveau du MCD (modèle conceptuel de données), ce sont les associations qui répondent à ce besoin. Les clés étrangères n'apparaîtront qu'après passage au relationnel, dans le MLD (modèle logique de données). À ce niveau, elles devront suivre la syntaxe : « #clé étrangère > table d'origine > clé primaire ». {pin}Un nom d'héritage doit être «  », « X », « T » ou « XT ». {pin}Un nom de boîte ou une patte de contrainte est attendu. {pin}Une virgule est attendue. {pin}Un nombre ou un nom de boîte est attendu. {pin}Un nom d'entité est attendu. {pin}Caractère illégal après un nom de contrainte. {pin}Virgule illégale après un héritage. {pin}Nom de boîte mal formé. {pin}Cardinalités mal formées. {pin}Nombre mal formé. {pin}Plus de deux coordonnées. {pin}Seul un nom de boîte est possible ici. {pin}Seulement deux coordonnées sont autorisées. {pin}Veuillez changer l'ancienne syntaxe de clé étrangère (« -> ») par la nouvelle (« > »). {pin}Les cibles de la contrainte doivent être séparées par des virgules. {pin}Token « {t} » rencontré. Tokens attendus : {expected}. {pin}Crochet fermant manquant. 