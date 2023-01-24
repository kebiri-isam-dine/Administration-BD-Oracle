-- Question 4 ---------------------------------------------------------------------
/* 
- POUR DÉFINIR UN SCHÉMA DE BASE DE DONNÉES HOMOGÈNE SUR CHAQUE MACHINE, L'administrateur doit d'ABORD CRÉER UN SCRIPT DE CRÉATION DE TABLES QUI SERA UTILISÉ POUR CRÉER LES TABLES SUR CHAQUE MACHINE. CE SCRIPT DOIT INCLURE LA DÉFINITION DE CHAQUE TABLE, AINSI QUE TOUTES LES CONTRAINTES DE CLÉ ÉTRANGÈRE ET AUTRES CONTRAINTES NÉCESSAIRES POUR GARANTIR L'intégrité des données.
- L'administrateur doit ensuite se connecter à chaque machine et exécuter le script de création de tables pour créer les tables sur chaque machine.
- APRÈS AVOIR CRÉÉ LES TABLES SUR CHAQUE MACHINE, L'administrateur doit importer les données dans chaque table.
- UNE FOIS LES DONNÉES IMPORTÉES SUR CHAQUE MACHINE, L'administrateur doit vérifier que les données sont identiques sur chaque machine en exécutant des requêtes de sélection sur les tables.
*/
--sur telline :
CREATE OR REPLACE VIEW EMP AS
    SELECT
        EMPT.*,
        SAL,
        COMM,
        DATEMB,
        SUPR
    FROM
        EMPT,
        EMPB@BREHAT EMPB
    WHERE
        EMPT.NOEMP = EMPB.NOEMP;


CREATE or replace view PROJET AS 
    SELECT *
    FROM
        PROJETT
    UNION
    SELECT *
    FROM 
        PROJETb@BREHAT;

CREATE OR REPLACE VIEW DEP AS
    SELECT
        *
    FROM
        DEPT@BREHAT;

-- sur brehat :
CREATE OR REPLACE VIEW EMP AS
    SELECT
        EMPB.*,
        NOMEMP,
        POSTE,
        NOPROJ,
        NODEPT
    FROM
        EMPB,
        EMPT@Telline EMPT
    WHERE
        EMPB.NOEMP = EMPT.NOEMP;

CREATE OR REPLACE VIEW PROJET AS
    SELECT
        *
    FROM
        PROJETB 
    UNION
    SELECT
            *
    FROM
        PROJETT@telline;

CREATE OR REPLACE VIEW DEP AS
    SELECT
        *
    FROM
        DEPT;




-- Question 5 ---------------------------------------------------------------------
/* POUR DEMANDER L'affichage du plan d'EXÉCUTION ASSOCIÉ À CHAQUE CONNEXION SQL, L'administrateur doit activer l'OPTION "autotrace" SUR CHAQUE CONNEXION. IL PEUT LE FAIRE EN EXÉCUTANT LA COMMANDE "set autotrace on" SUR CHAQUE CONNEXION. */

select NOEMP from EMP where NODEPT=10;
select SAL, NOMEMP FROM EMPB@BREHAT, EMPT where  NOEMP=7839;	   
			
COMMIT;


-- Question 6 ---------------------------------------------------------------------
-- Q1 : LE NUMÉRO DES EMPLOYÉS DU DÉPARTEMENT 10 :
SELECT noemp 
FROM EMPT
WHERE nodept = 10;

-- Q2 : LE NOM ET LE SALAIRE DE L’EMPLOYÉ 7839 :
SELECT nomemp, sal 
FROM EMPB 
WHERE noemp = 7839;

-- Q3 : LES EMPLOYÉS (NOM, SALAIRE) DU DÉPARTEMENT DES VENTES :
SELECT nomemp, sal 
FROM EMPT
JOIN DEPT 
ON EMPT.nodept = DEPT.nodept
WHERE nomdept = 'Ventes';

-- Q4 : LES EMPLOYÉS (NOM, SALAIRE) DU DÉPARTEMENT DES VENTES AFFECTÉS AU PROJET ALPHA :
SELECT nomemp, sal 
FROM EMPT
JOIN DEPT 
ON EMPT.nodept = DEPT.nodept
JOIN PROJETT
ON EMPT.noproj = PROJETT.noproj
WHERE nomdept = 'Ventes' AND nomproj = 'Alpha';


-- Question 7 ---------------------------------------------------------------------
/* (a) Avec les vues : L'administrateur peut créer une vue qui regroupe les employés affectés au projet alpha, puis utiliser cette vue pour mettre à jour les salaires de ces employés. Il peut ensuite exécuter la requête de mise à jour sur la vue pour augmenter le salaire de ces employés de 10%. */
CREATE VIEW vw_employes_projet_alpha AS
SELECT noemp, sal
FROM EMPT
JOIN PROJETT
ON EMPT.noproj = PROJETT.noproj
WHERE nomproj = 'Alpha';

UPDATE vw_employes_projet_alpha
SET sal = sal * 1.1;


/* (b) Sans les vues : L'administrateur peut également mettre à jour les salaires des employés affectés au projet alpha directement dans la table EMPT en utilisant une requête de mise à jour avec une clause WHERE pour sélectionner uniquement les employés affectés au projet alpha. */
UPDATE EMPT
SET sal = sal * 1.1
WHERE noproj = (SELECT noproj FROM PROJETT WHERE nomproj = 'Alpha');


/* (c) exécuter les requêtes sur telline et brehat : POUR EXÉCUTER LES REQUÊTES DE MISE À JOUR SUR LES DEUX MACHINES (TELLINE ET BREHAT), L'administrateur doit d'ABORD S'assurer qu'IL A LES AUTORISATIONS NÉCESSAIRES POUR EFFECTUER DES MODIFICATIONS SUR LES TABLES CONCERNÉES, PUIS IL PEUT UTILISER UN OUTIL DE GESTION DE BASE DE DONNÉES POUR SE CONNECTER À CHAQUE MACHINE ET EXÉCUTER LES REQUÊTES DE MISE À JOUR. IL EST IMPORTANT DE NOTER QUE POUR L'exécution des requêtes sur les deux machines, l'ADMINISTRATEUR DOIT VÉRIFIER QUE LES DONNÉES SONT SYNCHRONISÉES ENTRE LES DEUX BASES DE DONNÉES AVANT D'exécuter les requêtes pour éviter les incohérences dans les données. Il peut utiliser des outils de synchronisation de base de données pour synchroniser les données avant d'EXÉCUTER LES REQUÊTES. IL EST ÉGALEMENT IMPORTANT DE TESTER LES REQUÊTES SUR DES ENSEMBLES DE DONNÉES DE TESTS AVANT DE LES EXÉCUTER SUR LES DONNÉES DE PRODUCTION POUR S'assurer qu'ELLES FONCTIONNENT CORRECTEMENT ET NE CAUSENT PAS DE PROBLÈMES SUR LES DONNÉES.




-- Question 8 ---------------------------------------------------------------------
/* 
ETUDIER ET COMPARER TOUS LES PLANS D'exécution obtenus :

APRÈS AVOIR EXÉCUTÉ LES REQUÊTES DE MISE À JOUR SUR LES DEUX MACHINES (TELLINE ET BREHAT), L'administrateur doit étudier et comparer les plans d'EXÉCUTION OBTENUS POUR CHAQUE REQUÊTE. IL PEUT UTILISER DES OUTILS D'analyse de performances pour identifier les différences et déterminer les améliorations à apporter pour optimiser les performances de la base de données. Il pourrait s'AGIR DE LA MODIFICATION DE L'indexation, des statistiques de table, ou encore de la réécriture des requêtes pour les rendre plus efficaces.

EN UTILISANT LES VUES POUR EFFECTUER LES MISES À JOUR, L'administrateur peut avoir un meilleur contrôle sur les données mises à jour en s'ASSURANT QU'uniquement les employés affectés au projet alpha sont impactés par la mise à jour de salaire, tandis que sans vue il peut y avoir des risques d'ERREURS DANS LA SÉLECTION DES EMPLOYÉS IMPACTÉS.

EN COMPARANT LES PLANS D'exécution obtenus sur chaque machine, l'ADMINISTRATEUR PEUT ÉGALEMENT IDENTIFIER LES DIFFÉRENCES DE PERFORMANCES ENTRE LES DEUX MACHINES ET PRENDRE DES MESURES POUR LES CORRIGER, COMME L'ajout de ressources matérielles ou l'OPTIMISATION DES PARAMÈTRES DE CONFIGURATION DE LA BASE DE DONNÉES.
*/





