# Administration d'une BD Oracle




![GitHub](https://img.shields.io/github/license/kebiri-isam-dine/Administration-BD-Oracle?color=g&style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/kebiri-isam-dine/Administration-BD-Oracle?color=red&style=for-the-badge)
![GitHub contributors](https://img.shields.io/github/contributors/kebiri-isam-dine/Administration-BD-Oracle?color=yellow&style=for-the-badge)


![GitHub dev_language](https://img.shields.io/badge/Oracle-red?style=flat&logo=oracle&logoColor=white)


![GitHub Org's stars](https://img.shields.io/github/stars/kebiri-isam-dine?style=social)
![GitHub followers](https://img.shields.io/github/followers/kebiri-isam-dine?style=social)




## About The Project
Ce projet concerne l'administration d'une base de données Oracle. Il comprend la modélisation de la base de données, la gestion des transactions sous Oracle, la mise en place de Triggers pour automatiser certaines tâches, la conception d'une BDR (base de données relationnelle) pour gérer les données de manière efficace, l'évaluation de requêtes réparties pour garantir la performance de la base de données, ainsi que la gestion de vues pour faciliter l'interaction avec les données et la restructuration de la base de données pour améliorer les performances.


#### Keywords

Oracle - SQL - PL/SQL - modélisation - base de données relationnelle - Triggers - requêtes réparties - gestion de vues



## Environnement 

- IDE : sql developer
- DB : Oracle



### 1. Médelisation
La première étape de ce projet consiste à modéliser la base de données en utilisant les outils appropriés. Cela inclut la définition des tables, des relations entre les tables, et des contraintes pour garantir l'intégrité des données.

### 2. Gestion des transactions
Oracle propose des outils pour gérer les transactions de manière efficace. Ces outils seront utilisés pour garantir l'intégrité des données et éviter les conflits lors de la mise à jour de la base de données. Les détails de l'expérience sont [ici](Projet/Transactions.pdf)

- Exemple de transaction géré :
<img src="/Captures/Capture_transaction.png" />


### 3. Utilisation de Triggers
Les TRIGGERS sont des procédures stockées qui s'exécutent automatiquement lorsqu'une opération spécifique est effectuée sur la base de données. Ils seront utilisés pour automatiser certaines tâches et garantir l'intégrité des données.

- Liste des Triggers à faire [Triggers.pdf](Projet/Triggers.pdf)
- Solution proposée [Triggers.sql](Triggers.sql)

### 4. Evaluation de requêtes réparties
Les requêtes réparties seront évaluées pour garantir la performance de la base de données. Les résultats de cette évaluation seront utilisés pour optimiser les requêtes et améliorer les performances de la base de données. Le travail à faire comporte à :

- Création d'une connexion via SQL Developer : une vers le serveur Telline, l’autre vers le serveur Brehat (deux serveurs de l'université Paul Sabatier)
- Création de deux bases de données réparties : [DB_Telline](Data/DistributedRequests_creationTelline.sql) et [DB_Brehat](Data/DistributedRequests_creationBrehat.sql)
- Création de liens de communication entre deux bases de données
- Description de toutes les étapes effectuées par l’administrateur pour définir un schéma de BD homogène sur chaque machine
- Affichage du plan d’exécution associé à brehat et telline
- Écriture des requêtes SQL d'un langage naturel sous forme relationnelle, et les exécuter sur telline et brehat
- Étude et comparaison de tous les plans d’exécution obtenus

Solution proposée [DistributedRequests.sql](/DistributedRequests.sql)
## Output

`` or `![image]({BadgeURLHere})`
- Première partie :
  * Travaille demandé :
➥ Exploitation des principales bases de données de protéines (Protein Data Bank) : NCBI, PDB et PubMed pour ensuite décortiquer un article scientifique basé sur l’application des outils de l’IA sur des séquences nucléotides
  * Rendement :
➥ [Rapport sur l'article Classification and specific primer design for accurate detection of SARS-CoV-2 using deep learning](Output/Rapport01.pdf)
➥ [Décortication de l'aticle](Output/Décortication_de_l'aticle.pdf)
  
* Deuxième partie :
  * Travaille demandé :
➥ Sur le serveur NCBI, identifier toutes les séquences de la protéine de la pénicilline.
➥ Choisir un type de pénicilline et récupérer la séquence au format FASTA.
➥ En utilisant la séquence récupérée au format FASTA, faites un BLAST au NCBI.
➥ A laide de la même séquence au format FASTA, interroger la banque de données SwissProt en recherchant les séquences voisines.
➥ Est-ce que les séquences trouvées sont les mêmes que celle trouvées par BLAST.
  * Rendement :
➥ [Rapport Alignement des séquences par FASTA et BLAST](Output/Rapport02.pdf)

* Troixième partie :
  * Travaille demandé :
  ➥ programmer la méthode d’alignement globale par programmation dynamique en python et de déduire l’arbre phylogénique par la méthode UPGMA (avec sub=-1, Id=2 et GAP=2) puis en utilisant l’algorithme claustral déterminer l’alignement global. En déduire l’arbre phylogénétique et comparer les résultats avec les résultats obtenus précédemment
  ➥ script python : [AAlignement_globale _UPGMA.ipynb](Alignement_globale%20_UPGMA.ipynb)






## License

[GPL-3.0](https://choosealicense.com/licenses/gpl-3.0/)


## Contact

📫 How to reach me: kebiri.isam.dine@gmail.com

🌐 My Portfolio: <https://kebiri-isam-dine.github.io/>

🔗 Project Link: [https://github.com/Kebiri-isam-dine](https://github.com/Kebiri-isam-dine)
