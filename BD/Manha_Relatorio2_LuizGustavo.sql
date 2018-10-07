/********************************************
  *              Relatorio 2                *
  *-----------------------------------------*
  * Materia: Banco de Dados                 *
  *                                         *
  * Nome: Luiz Gustavo Bragan�a dos Santos  *
  * Matricula: 524507                       *
  * Turno: Manha                            *
  *******************************************/

1) CREATE TABLE Autor2
(
	CodAut number(2) not null,
	NomAut char(35) not null
);

2) INSERT INTO Autor2
	VALUES(1, 'Jos� Lins do Rego');

3) INSERT INTO Autor2
	VALUES(1, 'Autor em duplicata');

4) COMMIT;


I - Criando PK em tabelas existente

x5) ALTER TABLE Autor2
	ADD CONSTRAINT PK_Autor2
	PRIMARY KEY(CodAut);

ERRO na linha 2:
ORA-02437: n�o � poss�vel validar (LUIZGUSTAVO.PK_AUTOR2) - chave prim�ria
violada

6) Para eliminar os dados em duplicata:

DELETE FROM Autor2
	WHERE NomAut < 'B';

7) COMMIT;

8) Repetir passo 5


II - Aumentando o tamanho de uma coluna

9) inserir em Autor
	2	Leandro Dupr�
	3	Elmasri
	4	Navathe
	5	Jos� Mauro de Vasconcelos
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
         2 Leandro Dupr�
         1 Jos� Lins do Rego
         3 Elmasri
         4 Elmasri
         5 Jos� Mauro de Vasconcelos

x13) ALTER TABLE Autor2
	ADD CodPai number(2)
	not null;

Por que o erro?

ALTER TABLE Autor2
            *
ERRO na linha 1:
ORA-01758: a tabela deve estar vazia para incluir a coluna (NOT NULL)
obrigat�ria

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
         2 Leandro Dupr�                                               1
         1 Jos� Lins do Rego                                           1
         3 Elmasri                                                     6
         4 Elmasri                                                     6
         5 Jos� Mauro de Vasconcelos                                   1

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
ORA-00947: n�o h� valores suficientes



V - Diminuindo o tamanho de uma coluna.

x21) ALTER TABLE Autor2
	MODIFY NomAut
	char(35);

        MODIFY NomAut
               *
ERRO na linha 2:
ORA-01441: n�o � poss�vel diminuir o tamanho da coluna porque algum valor �
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
         2 Leandro Dupr�                                               1


         1 Jos� Lins do Rego                                           1


         3 Elmasri                                                     6



    CODAUT NOMAUT                                                 CODPAI
---------- -------------------------------------------------- ----------
NOMAUT2
-----------------------------------
         4 Elmasri                                                     6


         5 Jos� Mauro de Vasconcelos                                   1


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
ORA-04043: o objeto Autor2 n�o existe

DESC Troquei;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODAUT                                    NOT NULL NUMBER(2)
 CODPAI                                    NOT NULL NUMBER(2)
 NOMAUT                                             CHAR(35)

4) RENAME Troquei TO Autor2;


IX - Apenas informativo

Podemos realizar v�rios comandos de uma tabela em um s� alter table.

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
ORA-04043: o objeto VaiSumir n�o existe


XII - Create INDEX
Pesquisar comando do create index no google

Emitir Comando

CREATE INDEX INomUsu
	ON Usuario(NomUsu);


XIII - Criar e popular o modelo abaixo

CREATE TABLE Marca
(
	CodMar     number(2) NOT NULL,
	NomMar     char(35)  NOT NULL,
	CONSTRAINT PK_Marca   PRIMARY KEY(CodMar)
);

CREATE TABLE Modelo
(
	CodMod     number(2)       NOT NULL,
	NomMod     char(35)        NOT NULL,
    CodMar     number(2)       NOT NULL,
	CONSTRAINT PK_Modelo       PRIMARY KEY(CodMod),
    CONSTRAINT FK_Modelo_Marca FOREIGN KEY(CodMar) REFERENCES Marca
);

CREATE TABLE Veiculo
(
	PlaVei     char(7)           NOT NULL,
	AnoFab     number(4) 		 NOT NULL,
	CodMod     number(2)		 NOT NULL,
	CONSTRAINT PK_Veiculo 	     PRIMARY KEY(PlaVei),
	CONSTRAINT FK_Veiculo_Modelo FOREIGN KEY(CodMod) REFERENCES Modelo
);

CREATE TABLE Proprietario
(
	CodPro     number(2) 	   NOT NULL,
	NomPro     char(35)  	   NOT NULL,
	SexPro     char(1)   	   NOT NULL,
	CONSTRAINT PK_Proprietario PRIMARY KEY(CodPro)
);

CREATE TABLE Localidade
(
    CodLoc     number(2) 	 NOT NULL,
    NomLoc     char(35) 	 NOT NULL,
    CONSTRAINT PK_Localidade PRIMARY KEY(CodLoc)
);

CREATE TABLE Emplacamento
(
    PlaVei     char(7)         			   NOT NULL,
    CodPro     number(2)       			   NOT NULL,
    DatIni     date            		       DEFAULT sysdate,
    DatFim     date            			   DEFAULT sysdate,
    CodLoc     number(2)       			   NOT NULL,
    CONSTRAINT PK_Emplacamento 			   PRIMARY KEY(PlaVei, CodPro, DatIni),
    CONSTRAINT FK_Emplacamento_Localizacao FOREIGN KEY(CodLoc) REFERENCES Localidade
);

ALTER session SET nls_date_format='ddmmyyyy';

/* Inserindo Marcas */
INSERT INTO Marca VALUES(1, 'Ford');
INSERT INTO Marca VALUES(2, 'Toyota');
INSERT INTO Marca VALUES(3, 'Chevrolet');
INSERT INTO Marca VALUES(4, 'Hyundai');
INSERT INTO Marca VALUES(5, 'Honda');
INSERT INTO Marca VALUES(6, 'Fiat');
INSERT INTO Marca VALUES(7, 'Nissan');
INSERT INTO Marca VALUES(8, 'Citroen');

/* Inserindo Modelos */
INSERT INTO Modelo VALUES(1,  'Ka'     , 1);
INSERT INTO Modelo VALUES(2,  'i30'    , 4);
INSERT INTO Modelo VALUES(3,  'HB20'   , 4);
INSERT INTO Modelo VALUES(4,  'Punto'  , 6);
INSERT INTO Modelo VALUES(5,  'Argo'   , 6);
INSERT INTO Modelo VALUES(6,  'Uno'    , 6);
INSERT INTO Modelo VALUES(7,  'Versa'  , 7);
INSERT INTO Modelo VALUES(8,  'GT-R'   , 7);
INSERT INTO Modelo VALUES(9,  '350Z'   , 7);
INSERT INTO Modelo VALUES(10, 'AE86'   , 2);
INSERT INTO Modelo VALUES(11, 'Corolla', 2);
INSERT INTO Modelo VALUES(12, 'Civic'  , 5);
INSERT INTO Modelo VALUES(13, 'Fit'    , 5);
INSERT INTO Modelo VALUES(14, 'Corsa'  , 3);
INSERT INTO Modelo VALUES(15, 'GT'     , 1);
INSERT INTO Modelo VALUES(16, 'Tracker', 3);
INSERT INTO Modelo VALUES(17, 'Palio'  , 6);
INSERT INTO Modelo VALUES(18, 'Tucson' , 4);
INSERT INTO Modelo VALUES(19, 'Cruze'  , 3);
INSERT INTO Modelo VALUES(20, 'ix35'   , 4);

/* Inserindo Veiculos */
INSERT INTO Veiculo VALUES('HUE0101', 1986, 10);
INSERT INTO Veiculo VALUES('WSH7523', 2017,  2);
INSERT INTO Veiculo VALUES('QPH5355', 2017,  3);
INSERT INTO Veiculo VALUES('RRN8608', 2012,  2);
INSERT INTO Veiculo VALUES('MNG4641', 2010, 15);
INSERT INTO Veiculo VALUES('DES8894', 2005, 20);
INSERT INTO Veiculo VALUES('YKB7764', 1996, 19);
INSERT INTO Veiculo VALUES('CJB5806', 1995, 15);
INSERT INTO Veiculo VALUES('ZVC1724', 1993, 13);
INSERT INTO Veiculo VALUES('VML3026', 2001, 13);
INSERT INTO Veiculo VALUES('LEG2836', 2004,  4);
INSERT INTO Veiculo VALUES('MMU4402', 2007,  3);
INSERT INTO Veiculo VALUES('AAI6624', 2007,  1);
INSERT INTO Veiculo VALUES('DAD2307', 2003,  2);
INSERT INTO Veiculo VALUES('CXG5451', 2013,  4);
INSERT INTO Veiculo VALUES('BIO6486', 2014,  4);
INSERT INTO Veiculo VALUES('FCN3610', 2015,  3);
INSERT INTO Veiculo VALUES('SUN9096', 1989, 10);
INSERT INTO Veiculo VALUES('VGF9992', 2000, 16);
INSERT INTO Veiculo VALUES('EGT1581', 2014, 11);
INSERT INTO Veiculo VALUES('XZJ5122', 2011, 13);
INSERT INTO Veiculo VALUES('VKI4424', 2011, 14);
INSERT INTO Veiculo VALUES('YEP3543', 2010, 18);
INSERT INTO Veiculo VALUES('DKH9775', 2013, 17);
INSERT INTO Veiculo VALUES('CAK4848', 2006, 17);
INSERT INTO Veiculo VALUES('GFI9231', 2005, 18);
INSERT INTO Veiculo VALUES('NPB3280', 2004, 16);
INSERT INTO Veiculo VALUES('DXK5854', 2006, 16);
INSERT INTO Veiculo VALUES('ZRL6555', 2003,  6);
INSERT INTO Veiculo VALUES('YKJ2647', 2007,  7);
INSERT INTO Veiculo VALUES('NOH6275', 2008,  9);
INSERT INTO Veiculo VALUES('ERH4785', 2006, 10);
INSERT INTO Veiculo VALUES('JLZ1988', 1999, 11);
INSERT INTO Veiculo VALUES('RMR7847', 1997, 20);
INSERT INTO Veiculo VALUES('AAL6289', 1998, 15);
INSERT INTO Veiculo VALUES('OSI8430', 1993, 14);
INSERT INTO Veiculo VALUES('BOW7047', 1990, 16);
INSERT INTO Veiculo VALUES('KMF5618', 2001,  6);
INSERT INTO Veiculo VALUES('SDE8150', 2003,  3);
INSERT INTO Veiculo VALUES('ZIV8005', 2001,  1);
INSERT INTO Veiculo VALUES('AAS9218', 2016,  9);
INSERT INTO Veiculo VALUES('ACI9241', 2016,  8);
INSERT INTO Veiculo VALUES('QOR3204', 2015,  2);
INSERT INTO Veiculo VALUES('KXZ8597', 2017,  5);
INSERT INTO Veiculo VALUES('POB5758', 2015,  3);
INSERT INTO Veiculo VALUES('WRE5316', 2014, 13);
INSERT INTO Veiculo VALUES('YFG6718', 2013, 12);
INSERT INTO Veiculo VALUES('BUG1602', 2017, 11);
INSERT INTO Veiculo VALUES('OOH1427', 2011, 10);
INSERT INTO Veiculo VALUES('MAH0001', 2008,  4);

/* Inserindo Proprietarios */
INSERT INTO Proprietario VALUES(1,  'Luiz Gustavo'       , 'M');
INSERT INTO Proprietario VALUES(2,  'Pedro Henrique'     , 'M');
INSERT INTO Proprietario VALUES(3,  'Isabelle Langkammer', 'F');
INSERT INTO Proprietario VALUES(4,  'Daniel Cardoso'     , 'M');
INSERT INTO Proprietario VALUES(5,  'Hyalen Neves'       , 'M');
INSERT INTO Proprietario VALUES(6,  'Otto Bittencourt'   , 'M');
INSERT INTO Proprietario VALUES(7,  'Yui'                , 'F');
INSERT INTO Proprietario VALUES(8,  'Rafael C�mara'      , 'M');
INSERT INTO Proprietario VALUES(9,  'Izabela Borges'     , 'F');
INSERT INTO Proprietario VALUES(10, 'Vin�cius'           , 'M');
INSERT INTO Proprietario VALUES(11, 'Tain�'              , 'F');
INSERT INTO Proprietario VALUES(12, 'Valentina'          , 'F');
INSERT INTO Proprietario VALUES(13, 'Palhares'           , 'M');
INSERT INTO Proprietario VALUES(14, 'Ana Let�cia'        , 'F');
INSERT INTO Proprietario VALUES(15, 'Saul'               , 'M');

/* Inserindo Localidades */
INSERT INTO Localidade VALUES(1,  'Autocar veiculos');
INSERT INTO Localidade VALUES(2,  'Filipe Emplacamentos');
INSERT INTO Localidade VALUES(3,  'Almeida Despachante');
INSERT INTO Localidade VALUES(4,  'Canal Emplacamentos');
INSERT INTO Localidade VALUES(5,  'Nordeste Emplacamentos');
INSERT INTO Localidade VALUES(6,  'JR Emplacamentos');
INSERT INTO Localidade VALUES(7,  '2lu Emplacamentos');
INSERT INTO Localidade VALUES(8,  'Gold Placas');
INSERT INTO Localidade VALUES(9,  'Emplacamento 100%');
INSERT INTO Localidade VALUES(10, 'Suldeste Emplacamentos');

/* Inserindo Emplacamento */
INSERT INTO Emplacamento VALUES('HUE0101', 1,  '12062017', null      ,  7);
INSERT INTO Emplacamento VALUES('KXZ8597', 3,  '27102013', null      ,  7);
INSERT INTO Emplacamento VALUES('AAI6624', 2,  '13112000', null      ,  7);
INSERT INTO Emplacamento VALUES('AAS9218', 4,  default   , null      ,  7);
INSERT INTO Emplacamento VALUES('POB5758', 15, '25022003', null      ,  1);
INSERT INTO Emplacamento VALUES('WSH7523', 1,  '01012006', '20112008',  7);
INSERT INTO Emplacamento VALUES('QPH5355', 6,  '23112013', null      ,  2);
INSERT INTO Emplacamento VALUES('DKH9775', 10, '07122000', '02052011',  3);
INSERT INTO Emplacamento VALUES('YKJ2647', 10, '11082005', '17022014',  3);
INSERT INTO Emplacamento VALUES('RRN8608', 2,  '09101999', null      ,  3);
INSERT INTO Emplacamento VALUES('MNG4641', 3,  '12091999', '11042013',  7);
INSERT INTO Emplacamento VALUES('YKB7764', 4,  '05092002', '26052006',  4);
INSERT INTO Emplacamento VALUES('WRE5316', 5,  default   , null      ,  5);
INSERT INTO Emplacamento VALUES('MAH0001', 6,  '05092002', '26052006',  5);
INSERT INTO Emplacamento VALUES('CJB5806', 7,  '05092002', '26052006',  7);
INSERT INTO Emplacamento VALUES('ZVC1724', 8,  '02022011', null      ,  6);
INSERT INTO Emplacamento VALUES('VML3026', 9,  '21012009', '01122015',  5);
INSERT INTO Emplacamento VALUES('LEG2836', 10, '02022011', null      , 10);
INSERT INTO Emplacamento VALUES('MMU4402', 11, '12012003', '26042005',  9);
INSERT INTO Emplacamento VALUES('QOR3204', 12, default   , null      ,  8);
INSERT INTO Emplacamento VALUES('DAD2307', 13, '09101999', null      ,  8);
INSERT INTO Emplacamento VALUES('CXG5451', 14, '12012003', '26042005',  4);
INSERT INTO Emplacamento VALUES('BIO6486', 15, '18092005', null      ,  6);
INSERT INTO Emplacamento VALUES('FCN3610', 10, '09101999', null      ,  5);
INSERT INTO Emplacamento VALUES('SUN9096', 11, '09101999', null      ,  7);
INSERT INTO Emplacamento VALUES('VGF9992', 9,  '28072001', '23112012',  7);
INSERT INTO Emplacamento VALUES('EGT1581', 9,  '09101999', null      ,  3);
INSERT INTO Emplacamento VALUES('XZJ5122', 8,  default   , null      ,  7);
INSERT INTO Emplacamento VALUES('VKI4424', 8,  '10092001', '14022004',  2);
INSERT INTO Emplacamento VALUES('YEP3543', 5,  '05092002', '26052006',  1);
INSERT INTO Emplacamento VALUES('OOH1427', 4,  '12012003', '26042005',  2);
INSERT INTO Emplacamento VALUES('CAK4848', 4,  '10092001', '14022004',  2);
INSERT INTO Emplacamento VALUES('GFI9231', 4,  '12012003', '26042005',  2);
INSERT INTO Emplacamento VALUES('NPB3280', 13, '09101999', null      ,  1);
INSERT INTO Emplacamento VALUES('DXK5854', 13, '09101999', null      ,  1);
INSERT INTO Emplacamento VALUES('ZRL6555', 13, default   , null      ,  3);
INSERT INTO Emplacamento VALUES('BUG1602', 13, '12012003', '26042005',  3);
INSERT INTO Emplacamento VALUES('NOH6275', 13, '28072001', '23112012',  3);
INSERT INTO Emplacamento VALUES('ERH4785', 14, '24122007', null      ,  1);
INSERT INTO Emplacamento VALUES('JLZ1988', 14, '20042008', '18102015',  5);
INSERT INTO Emplacamento VALUES('RMR7847', 14, '12012003', '26042005',  6);
INSERT INTO Emplacamento VALUES('AAL6289', 15, '15092002', null      ,  8);
INSERT INTO Emplacamento VALUES('OSI8430', 10, '05092002', '26052006',  7);
INSERT INTO Emplacamento VALUES('BOW7047', 7,  '09101999', null      ,  7);
INSERT INTO Emplacamento VALUES('KMF5618', 7,  '12012003', '26042005',  7);
INSERT INTO Emplacamento VALUES('SDE8150', 7,  '10092001', '14022004',  7);
INSERT INTO Emplacamento VALUES('ZIV8005', 6,  default   , null      ,  7);
INSERT INTO Emplacamento VALUES('YFG6718', 1,  '03022008', '19012014',  7);
INSERT INTO Emplacamento VALUES('ACI9241', 1,  '04012002', '18072014',  7);
INSERT INTO Emplacamento VALUES('DES8894', 1,  '13112000', null      ,  7);

COMMIT;

SELECT * FROM Marca;

    CODMAR NOMMAR
---------- -----------------------------------
         1 Ford
         2 Toyota
         3 Chevrolet
         4 Hyundai
         5 Honda
         6 Fiat
         7 Nissan
         8 Citroen

SELECT * FROM Modelo;

    CODMOD NOMMOD                                  CODMAR
---------- ----------------------------------- ----------
         1 Ka                                           1
         2 i30                                          4
         3 HB20                                         4
         4 Punto                                        6
         5 Argo                                         6
         6 Uno                                          6
         7 Versa                                        7
         8 GT-R                                         7
         9 350Z                                         7
        10 AE86                                         2
        11 Corolla                                      2

    CODMOD NOMMOD                                  CODMAR
---------- ----------------------------------- ----------
        12 Civic                                        5
        13 Fit                                          5
        14 Corsa                                        3
        15 GT                                           1
        16 Tracker                                      3
        17 Palio                                        6
        18 Tucson                                       4
        19 Cruze                                        3
        20 ix35                                         4

SELECT * FROM Veiculo;

PLAVEI      ANOFAB     CODMOD
------- ---------- ----------
HUE0101       1986         10
WSH7523       2017          2
QPH5355       2017          3
RRN8608       2012          2
MNG4641       2010         15
DES8894       2005         20
YKB7764       1996         19
CJB5806       1995         15
ZVC1724       1993         13
VML3026       2001         13
LEG2836       2004          4

PLAVEI      ANOFAB     CODMOD
------- ---------- ----------
MMU4402       2007          3
AAI6624       2007          1
DAD2307       2003          2
CXG5451       2013          4
BIO6486       2014          4
FCN3610       2015          3
SUN9096       1989         10
VGF9992       2000         16
EGT1581       2014         11
XZJ5122       2011         13
VKI4424       2011         14

PLAVEI      ANOFAB     CODMOD
------- ---------- ----------
YEP3543       2010         18
DKH9775       2013         17
CAK4848       2006         17
GFI9231       2005         18
NPB3280       2004         16
DXK5854       2006         16
ZRL6555       2003          6
YKJ2647       2007          7
NOH6275       2008          9
ERH4785       2006         10
JLZ1988       1999         11

PLAVEI      ANOFAB     CODMOD
------- ---------- ----------
RMR7847       1997         20
AAL6289       1998         15
OSI8430       1993         14
BOW7047       1990         16
KMF5618       2001          6
SDE8150       2003          3
ZIV8005       2001          1
AAS9218       2016          9
ACI9241       2016          8
QOR3204       2015          2
KXZ8597       2017          5

PLAVEI      ANOFAB     CODMOD
------- ---------- ----------
POB5758       2015          3
WRE5316       2014         13
YFG6718       2013         12
BUG1602       2017         11
OOH1427       2011         10
MAH0001       2008          4

SELECT * FROM Proprietario;

    CODPRO NOMPRO                              S
---------- ----------------------------------- -
         1 Luiz Gustavo                        M
         2 Pedro Henrique                      M
         3 Isabelle Langkammer                 F
         4 Daniel Cardoso                      M
         5 Hyalen Neves                        M
         6 Otto Bittencourt                    M
         7 Yui                                 F
         8 Rafael C�mara                       M
         9 Izabela Borges                      F
        10 Vin�cius                            M
        11 Tain�                               F

    CODPRO NOMPRO                              S
---------- ----------------------------------- -
        12 Valentina                           F
        13 Palhares                            M
        14 Ana Let�cia                         F
        15 Saul                                M

SELECT * FROM Localidade;

    CODLOC NOMLOC
---------- -----------------------------------
         1 Autocar veiculos
         2 Filipe Emplacamentos
         3 Almeida Despachante
         4 Canal Emplacamentos
         5 Nordeste Emplacamentos
         6 JR Emplacamentos
         7 2lu Emplacamentos
         8 Gold Placas
         9 Emplacamento 100%
        10 Suldeste Emplacamentos

SELECT * FROM Emplacamento;

PLAVEI      CODPRO DATINI   DATFIM       CODLOC
------- ---------- -------- -------- ----------
HUE0101          1 12062017                   7
KXZ8597          3 27102013                   7
AAI6624          2 13112000                   7
AAS9218          4 09102017                   7
POB5758         15 25022003                   1
WSH7523          1 01012006 20112008          7
QPH5355          6 23112013                   2
DKH9775         10 07122000 02052011          3
YKJ2647         10 11082005 17022014          3
RRN8608          2 09101999                   3
MNG4641          3 12091999 11042013          7

PLAVEI      CODPRO DATINI   DATFIM       CODLOC
------- ---------- -------- -------- ----------
YKB7764          4 05092002 26052006          4
WRE5316          5 09102017                   5
MAH0001          6 05092002 26052006          5
CJB5806          7 05092002 26052006          7
ZVC1724          8 02022011                   6
VML3026          9 21012009 01122015          5
LEG2836         10 02022011                  10
MMU4402         11 12012003 26042005          9
QOR3204         12 09102017                   8
DAD2307         13 09101999                   8
CXG5451         14 12012003 26042005          4

PLAVEI      CODPRO DATINI   DATFIM       CODLOC
------- ---------- -------- -------- ----------
BIO6486         15 18092005                   6
FCN3610         10 09101999                   5
SUN9096         11 09101999                   7
VGF9992          9 28072001 23112012          7
EGT1581          9 09101999                   3
XZJ5122          8 09102017                   7
VKI4424          8 10092001 14022004          2
YEP3543          5 05092002 26052006          1
OOH1427          4 12012003 26042005          2
CAK4848          4 10092001 14022004          2
GFI9231          4 12012003 26042005          2

PLAVEI      CODPRO DATINI   DATFIM       CODLOC
------- ---------- -------- -------- ----------
NPB3280         13 09101999                   1
DXK5854         13 09101999                   1
ZRL6555         13 09102017                   3
BUG1602         13 12012003 26042005          3
NOH6275         13 28072001 23112012          3
ERH4785         14 24122007                   1
JLZ1988         14 20042008 18102015          5
RMR7847         14 12012003 26042005          6
AAL6289         15 15092002                   8
OSI8430         10 05092002 26052006          7
BOW7047          7 09101999                   7

PLAVEI      CODPRO DATINI   DATFIM       CODLOC
------- ---------- -------- -------- ----------
KMF5618          7 12012003 26042005          7
SDE8150          7 10092001 14022004          7
ZIV8005          6 09102017                   7
YFG6718          1 03022008 19012014          7
ACI9241          1 04012002 18072014          7
DES8894          1 13112000                   7
