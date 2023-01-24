DROP TABLE EMP;
DROP TABLE PROJET;
DROP TABLE DEPT;
DROP TABLE EMPT;
DROP TABLE PROJETT;

CREATE TABLE PROJETT ( noproj NUMBER(4) constraint pk_projett primary key,
		      nomproj VARCHAR2(10),
		      budget NUMBER(6));
		      		    
CREATE TABLE EMPT ( noemp NUMBER(4) constraint pk_empt primary key,
		   nomemp VARCHAR2(10),
		   poste VARCHAR2(10),
		   noproj NUMBER(4) ,
		   nodept NUMBER(2) );

INSERT INTO PROJETT VALUES (2,'papyrus', 250000);
INSERT INTO PROJETT VALUES (4,'alpha', 200000);


INSERT INTO EMPT VALUES (7839, 'leroy', 'president',1, 10);			
INSERT INTO EMPT VALUES (7698, 'noiret', 'directeur',4, 30); 
INSERT INTO EMPT VALUES (7782, 'lesage', 'directeur',1, 10);
INSERT INTO EMPT VALUES (7566, 'mercier', 'directeur',2, 20);
INSERT INTO EMPT VALUES (7788, 'dubois', 'ingenieur',2, 20);
INSERT INTO EMPT VALUES (7902, 'chatel', 'ingenieur',2, 20);
INSERT INTO EMPT VALUES (7369, 'leclerc', 'commercial',2, 20);
INSERT INTO EMPT VALUES (7499, 'biraud', 'commercial',3, 30);
INSERT INTO EMPT VALUES (7521, 'berger', 'commercial',4, 30);
INSERT INTO EMPT VALUES (7654, 'martin', 'commercial',3, 30);
INSERT INTO EMPT VALUES (7844, 'benain', 'commercial',3, 30);
INSERT INTO EMPT VALUES (7876, 'clement', 'secretaire',2, 20);
INSERT INTO EMPT VALUES (7900, 'fremont', 'secretaire',3, 30);
INSERT INTO EMPT VALUES (7934, 'villard', 'secretaire',3, 30);		   
				
COMMIT;