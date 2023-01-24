

--Q1
ALTER TABLE EQUIPE add NbChercheurs number(2);
update EQUIPE SET NbChercheurs = (
select count(*) from CHERCHEUR 
WHERE CHERCHEUR.CODEEQ = EQUIPE.CODEEQ );

--Q2
CREATE OR REPLACE TRIGGER incrementNbChercheurs
after INSERT OR delete or update on CHERCHEUR
for each row
declare
begin
if inserting then
update equipe 
set NbChercheurs = NbChercheurs + 1
where CodeEq =:new.CodeEq ;
dbms_output.put_line('nombre de chercher incrémenté pour l''equipe : ' || :new.CodeEq);
end if;
if deleting then
update equipe 
set NbChercheurs = NbChercheurs - 1
where CodeEq =:old.CodeEq ;
dbms_output.put_line('nombre de chercher décrémenté pour l''equipe : ' || :old.CodeEq);
end if;
end incrementNbChercheurs;

--Q3
CREATE OR REPLACE TRIGGER notInsertSMM
before insert on chercheur
for each row
declare
vCodeEq number;
begin
select CodeEq into vCodeEq from Equipe where NomEq='SMM';
if :new.CodeEq = vCodeEq then
--dbms_output.put_line('Equipe complet');
raise_application_error(-20001, 'Insertion impossible dans cette equipe');
else
dbms_output.put_line('Insertion ok');
end if;
end notInsertSMM;

--Q4 a
create or replace view Chercheur_Salaire2400
as 
    SELECT Codech, NomCh, salaire
    from chercheur
    where salaire > 2400;
    
--select * from cat; --pour voir les view

--Q4 b
insert into Chercheur_Salaire2400(100, �Dupont�, 2000)
-- possible mais pas visible dans chercheur_Salaire2400, pour empecher cette insertion il faut rajouter ""with check option;""


--Q5
--Faut faire alter trigger nom_trigger disable;
CREATE TRIGGER PREVENT_NEW_TEAM BEFORE
  INSERT ON EQUIPE FOR EACH ROW
BEGIN
  IF (
    SELECT
      COUNT(*)
    FROM
      EQUIPE
  ) >= 20 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Impossible de créer plus de 20 équipes');
  END IF;
END interdire_21Eq;

--Q6
---a
CREATE VIEW CHERCHEUR_NBRETH AS
  SELECT
    CHERCHEUR.CODECH,
    NOMCH,
    CODEEQ,
    SALAIRE,
    COUNT(*) AS NBRETH
  FROM
    CHERCHEUR
    JOIN TRAVAILLER
    ON CHERCHEUR.CODECH = TRAVAILLER.CODECH
  GROUP BY
    CHERCHEUR.CODECH, NOMCH, CODEEQ, SALAIRE;

---b
-- IL N'est pas possible de faire des mises à jour directement via cette vue car elle est basée sur une requête de sélection avec une fonction d'AGRÉGATION.

--c
CREATE TRIGGER MAJ_VUE AFTER
  INSERT OR UPDATE OR DELETE ON CHERCHEUR_NBRETH FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO CHERCHEUR (
      CODECH,
      NOMCH,
      CODEEQ,
      SALAIRE
    ) VALUES (
      :NEW.CODECH,
      :NEW.NOMCH,
      :NEW.CODEEQ,
      :NEW.SALAIRE
    );
    INSERT INTO TRAVAILLER (
      CODECH,
      CODETH
    ) VALUES (
      :NEW.CODECH,
      :NEW.CODETH
    );
  ELSIF UPDATING THEN
    UPDATE CHERCHEUR
    SET
      SALAIRE = :NEW.SALAIRE
    WHERE
      CODECH = :NEW.CODECH;
  ELSIF DELETING THEN
    DELETE FROM CHERCHEUR
    WHERE
      CODECH = :OLD.CODECH;
    DELETE FROM TRAVAILLER
    WHERE
      CODECH = :OLD.CODECH;
  END IF;
END MAJ_VUE;
/* IL EST IMPORTANT DE NOTER QUE CETTE SOLUTION EST PLUS COMPLEXE ET POURRAIT ENTRAINER DES INCOHÉRENCES SI LA VUE EST MISE À JOUR DE MANIÈRE INCOMPLÈTE OU INCORRECTE. IL EST DONC IMPORTANT DE TESTER CES TRIGGERS ET VÉRIFIER LEUR BON FONCTIONNEMENT AVANT DE LES UTILISER */