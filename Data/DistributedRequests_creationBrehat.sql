DROP TABLE EMP;
DROP TABLE PROJET;
DROP TABLE DEPT;
DROP TABLE EMPB;
DROP TABLE PROJETB;
DROP TABLE DEPT;


CREATE TABLE DEPT ( nodept NUMBER(2) constraint pk_dept primary key,
		    nomdept VARCHAR2(14),
		    lieu VARCHAR2(13));
		    
CREATE TABLE PROJETB ( noproj NUMBER(4) constraint pk_projetb primary key,
		      nomproj VARCHAR2(10),
		      budget NUMBER(6));
		      		    
CREATE TABLE EMPB ( noemp NUMBER(4) constraint pk_empb primary key,
		   supr NUMBER(4),
		   datemb DATE,
		   sal NUMBER(8,2),
		   comm NUMBER(8,2 ));
		   

INSERT INTO DEPT VALUES (10, 'finances', 'paris');
INSERT INTO DEPT VALUES (20, 'recherche', 'grenoble');
INSERT INTO DEPT VALUES (30, 'vente', 'lyon');
INSERT INTO DEPT VALUES (40, 'fabrication', 'lille');

INSERT INTO PROJETb VALUES (1,'gamma', 320000);
INSERT INTO PROJETb VALUES (3,'rodin', 280000);

INSERT INTO EMPB VALUES (7839, NULL, '17/11/2009', 5800,NULL);
INSERT INTO EMPB VALUES (7698, 7839, '01/05/2011', 4560,NULL); 
INSERT INTO EMPB VALUES (7782, 7839, '09/06/2011', 3920,NULL);
INSERT INTO EMPB VALUES (7566, 7839, '02/04/2011', 4760,NULL);
INSERT INTO EMPB VALUES (7788, 7566, '14/04/2015', 4800,NULL);
INSERT INTO EMPB VALUES (7902, 7566, '03/12/2011', 4800,NULL);
INSERT INTO EMPB VALUES (7369, 7902, '17/12/2010', 1280,NULL);
INSERT INTO EMPB VALUES (7499, 7698, '20/02/2011', 2560, 2400);
INSERT INTO EMPB VALUES (7521, 7698, '22/02/2011', 2200, 4000);
INSERT INTO EMPB VALUES (7654, 7698, '28/12/2011', 2200, 11200);
INSERT INTO EMPB VALUES (7844, 7698, '08/09/2011', 2400, NULL);
INSERT INTO EMPB VALUES (7876, 7788, '18/05/2015', 1560,NULL);
INSERT INTO EMPB VALUES (7900, 7698, '03/12/2011', 1520,NULL);
INSERT INTO EMPB VALUES (7934, 7782, '23/01/2012', 2080,NULL);

COMMIT;			