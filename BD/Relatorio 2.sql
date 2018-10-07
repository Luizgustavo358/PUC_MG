1) CREATE TABLE Autor2(
	CodAut number(2) not null,
	NomAut char(35) not null);

2) INSERT INTO Autor2
	VALUES(1, 'José Lins do Rego');

3) INSERT INTO Autor2
	VALUES(1, 'Autor em duplicata');

4) COMMIT;


I - Criando PK em tabelas existente

x5) ALTER TABLE Autor2
	ADD CONSTRAINT PK_Autor2
	PRIMARY KEY(CodAut);

ERRO na linha 2:
ORA-02437: nÒo Ú possÝvel validar (LUIZGUSTAVO.PK_AUTOR2) - chave primßria
violada

6) Para eliminar os dados em duplicata:

DELETE FROM Autor2
	WHERE NomAut < 'B';

7) COMMIT;

8) Repetir passo 5


II - Aumentando o tamanho de uma coluna

9) inserir em Autor
	2	Leandro Duprê
	3	Elmasri
	4	Navathe
	5	José Mauro de Vasconcelos
COMMIT;

10) DESC Autor2;

ALTER TABLE Autor2
	MODIFY NomAut char(50);

DESC Autor2;

Nome                                      Nulo?    Tipo
----------------------------------------- -------- ----------------------------
CODAUT                                    NOT NULL NUMBER(2)
NOMAUT                                    NOT NULL CHAR(50)


III - Criando uma nova coluna:

12) SELECT *
	FROM Autor2;

    CODAUT NOMAUT
---------- --------------------------------------------------
         2 Leandro Duprê
         1 José Lins do Rego
         3 Elmasri
         4 Elmasri
         5 José Mauro de Vasconcelos

x13) ALTER TABLE Autor2
	ADD CodPai number(2)
	not null;

Por que o erro?

ALTER TABLE Autor2
            *
ERRO na linha 1:
ORA-01758: a tabela deve estar vazia para incluir a coluna (NOT NULL)
obrigat¾ria

14) ALTER TABLE Autor2
	ADD CodPai number(2);
	
DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                             NUMBER(2)

15) UPDATE Autor2
	SET CodPai = 1
	WHERE CodAut IN (1, 2, 5);

16) UPDATE Autor2
	SET CodPai = 6
	WHERE CodAut IN (3, 4);

17) SELECT *
	FROM Autor2;


    CODAUT NOMAUT                                                 CODPAI
---------- -------------------------------------------------- ----------
         2 Leandro Duprê                                               1
         1 José Lins do Rego                                           1
         3 Elmasri                                                     6
         4 Elmasri                                                     6
         5 José Mauro de Vasconcelos                                   1

COMMIT;

18) DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                             NUMBER(2)

ALTER TABLE AUTOR2
	MODIFY CodPai not null;

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                    NOT NULL NUMBER(2)


IV - Criando nova FK

19) ALTER TABLE Autor2
	ADD CONSTRAINT FK_Pais_Autor2
	FOREIGN KEY(CodPai) REFERENCES Pais;

x20) INSERT INTO Autor2
	VALUES(10, 'Margarida Schimit');

INSERT INTO Autor2
            *
ERRO na linha 1:
ORA-00947: nÒo hß valores suficientes



V - Diminuindo o tamanho de uma coluna.

x21) ALTER TABLE Autor2
	MODIFY NomAut
	char(35);

        MODIFY NomAut
               *
ERRO na linha 2:
ORA-01441: nÒo Ú possÝvel diminuir o tamanho da coluna porque algum valor Ú
muito grande

22) ALTER TABLE Autor2
	ADD NomAut2 char(35);

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT2                                            CHAR(35)

23) UPDATE Autor2
	SET NomAut = substr(NomAut, 1, 35);

COMMIT;

SELECT * 
	FROM Autor2;

    CODAUT NOMAUT                                                 CODPAI
---------- -------------------------------------------------- ----------
NOMAUT2
-----------------------------------
         2 Leandro Duprê                                               1


         1 José Lins do Rego                                           1


         3 Elmasri                                                     6



    CODAUT NOMAUT                                                 CODPAI
---------- -------------------------------------------------- ----------
NOMAUT2
-----------------------------------
         4 Elmasri                                                     6


         5 José Mauro de Vasconcelos                                   1


24) ALTER TABLE Autor2
	MODIFY NomAut2 not null;

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT2                                   NOT NULL CHAR(35)


VI - Eliminando uma coluna

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 NOMAUT                                    NOT NULL CHAR(50)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT2                                   NOT NULL CHAR(35)

ALTER TABLE Autor2
	DROP COLUMN NomAut;

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT2                                   NOT NULL CHAR(35)


VII - Renomeando uma coluna

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT2                                   NOT NULL CHAR(35)

ALTER TABLE Autor2
	RENAME COLUMN NomAut2
	TO NomAut;

DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT                                             CHAR(35)


VIII - Renomeando uma tabela 

1) DESC Autor2;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT                                             CHAR(35)

2) RENAME Autor2 TO Troquei;

3) DESC Autor2;

ERROR:
ORA-04043: o objeto Autor2 nÒo existe

DESC Troquei;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT                                             CHAR(35)

4) RENAME Troquei TO Autor2;


IX - Apenas informativo

Podemos realizar vários comandos de uma tabela em um só alter table.

Alter table Autor2 
 ( add col1 char(2), ...
   add CONSTRAINT...,
   modify...);

X - Podemos criar uma tabela a partir de outra

CREATE TABLE VaiSumir
AS SELECT * FROM Pais;

XI - Eliminando uma tabela 
 
DESC  VaiSumir;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODPAI                                    NOT NULL NUMBER(2)
 NOMPAI                                    NOT NULL CHAR(30)

DROP TABLE VaiSumir;
DESC VaiSumir;

ERROR:
ORA-04043: o objeto VaiSumir nÒo existe


XII - Create INDEX 
Pesquisar comando do create index no google

Emitir Comando

CREATE INDEX INomUsu
	ON Usuario(NomUsu);


XIII - Criar e popular o modelo abaixo

CREATE TABLE Marca(
	CodMar     number(2) NOT NULL,
	NomMar     char(35)  NOT NULL,
	CONSTRAINT PK_Pais   PRIMARY KEY(CodMar));

CREATE TABLE Modelo(
	CodMod number(2) NOT NULL,
	NomMod char(35)  NOT NULL);
