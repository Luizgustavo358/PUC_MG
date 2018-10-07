/********************************************
  *             Relatorio 1                 *
  * ----------------------------------------*
  * Materia: Banco de Dados                 *
  *				                    	    *
  * Nome: Luiz Gustavo Bragan�a dos Santos  *
  * Matricula: 524507                       *
  * Turno: Manh�                            *
  *******************************************/

//----------- Sala de Aula--------------------
1)
// Minha primeira tabela
CREATE TABLE Pais(
	CodPai     number(2) not null,
	NomPai     char(30)  not null,
	CONSTRAINT PK_Pais   PRIMARY KEY(CodPai));


2)
// para mostrar a descricao da tabela
DESC Pais;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODPAI                                    NOT NULL NUMBER(2)
 NOMPAI                                    NOT NULL CHAR(30)


3)
INSERT INTO Pais
	VALUES(1, 'Brasil');


4)
INSERT INTO Pais
	VALUES(2, 'Argentina');


4)a)
// vai dar erro de codigo do pais
INSERT INTO Pais
	VALUES(1, 'EUA');


4)b)
// precisa de dois elementos
INSERT INTO Pais
	VALUES(3);

5)
// salvando
COMMIT;

5)a)
// mostrando a tabela
SELECT *
	FROM Pais;

6)
INSERT INTO Pais
	VALUES(3, 'Chile');

7)
SELECT *
	FROM Pais;

8)
// volta ate o commit
ROLLBACK;

9)
SELECT *
	FROM Pais;

10) Defina commit e rollback:

-> Commit: esse comando salva todos os dados contidos no buffer no SGBD.

-> Rollback: esse comando volta at� o �ltimo commit dado.


11) Inserir em Pais:
	3 Chile
	4 Portugal
	5 Canada
	6 EUA
	7 Cuba
	+3 paises

INSERT INTO Pais 
	VALUES(4, 'Portugal');

INSERT INTO Pais 
	VALUES(5, 'Canad�');

INSERT INTO Pais 
	VALUES(6, 'EUA');

INSERT INTO Pais 
	VALUES(7, 'Cuba');

INSERT INTO Pais 
	VALUES(8, 'Jap�o');

INSERT INTO Pais 
	VALUES(9, 'Egito');

INSERT INTO Pais 
	VALUES(10, 'Israel');

COMMIT;

12) Criando tabela Autor
CREATE TABLE Autor(
	CodAut     number(2)     not null,
	NomAut 	   char(35)      not null,
	CodPai     number(2)     not null,
	CONSTRAINT PK_Autor      PRIMARY KEY(CodAut),
	CONSTRAINT FK_Autor_Pais FOREIGN KEY(CodPai) REFERENCES Pais);


13)
INSERT INTO Autor
	VALUES(1, 'Jos� Luis do Rego', 1);

14)
INSERT INTO Autor
	VALUES(2, 'Leandro Dupr�', 1);

15) // vai dar erro
INSERT INTO Autor
	VALUES(3);

16)// erro
INSERT INTO Autor
	VALUES(3, 'Elman', 14);

17)// erro
INSERT INTO Autor
	VALUES(3, 'Elman');

18)
COMMIT;

19) mostra todos os nomes de autores ordenados de forma decrescente
SELECT NomAut
	FROM Autor
	ORDER BY NomAut DESC;

20) mostra o nome dos autores e de qual pa�s s�o
SELECT NomAut, NomPai
	FROM Autor JOIN Pais
	ON Autor.CodPai = Pais.CodPai;

21) mostra todos autores
SELECT *
	FROM Autor JOIN Pais
	ON Pais.CodPai = Autor.CodPai;

22)
SELECT *
	FROM Pais NATURAL JOIN Autor;

23) Para alterar conte�do dos dados
UPDATE Pais
	SET NomPai = 'Brazil'
	WHERE codPai = 1;

24)
SELECT *
	FROM Pais;

25)
ROLLBACK;


26) repetir 24
SELECT *
	FROM Pais;

27) Para eliminar uma linha
DELETE Pais
	WHERE CodPai = 1;


28) repetir 25, 24
ROLLBACK;

SELECT *
	FROM Pais;
	

//----------- Relat�rio ----------------------
1) Criando tabela Pa�s

CREATE TABLE Pais(
	CodPai     number(2) not null,
	NomPai     char(30)  not null,
	CONSTRAINT PK_Pais   PRIMARY KEY(CodPai));


2) Vendo a desci��o da tabela no dicion�rio de dados

DESC Pais;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODPAI                                    NOT NULL NUMBER(2)
 NOMPAI                                    NOT NULL CHAR(30)

3) Inserindo valores na tabela:

INSERT INTO Pais
	VALUES(1, 'Brasil');

INSERT INTO Pais
	VALUES(2, 'Argentina');

INSERT INTO Pais
	VALUES(3, 'Portugal');

INSERT INTO Pais
	VALUES(4, 'Cuba');

INSERT INTO Pais
	VALUES(5, 'EUA');

INSERT INTO Pais
	VALUES(6, 'Canad�');

INSERT INTO Pais
	VALUES(7, 'Venezuela');

INSERT INTO PAIS
	VALUES(8, 'Chile');

INSERT INTO PAIS
	VALUES(9, 'Jap�o');

INSERT INTO PAIS
	VALUES(10, 'Fran�a');


4) ?


5) Defina Rollback e Commit.

-> Commit: esse comando salva todos os dados contidos no buffer no SGBD.

-> Rollback: esse comando volta at� o �ltimo commit dado.


6) Para alterar conte�do dos dados

UPDATE Pais
	SET NomPai = 'Brazil'
	WHERE codPai = 1;

Resultado: Alterando o nome do pais com codigo 1


7) SELECT CodPai, NomPai
	FROM Pais ORDER BY NomPai;

    CODPAI NOMPAI
---------- ------------------------------
         2 Argentina
         1 Brazil
         6 Canad�
         8 Chile
         4 Cuba
         5 EUA
        10 Fran�a
         9 Jap�o
         3 Portugal
         7 Venezuela


8) SELECT CodPai, NomPai
	FROM Pais ORDER BY NomPai DESC;


    CODPAI NOMPAI
---------- ------------------------------
         7 Venezuela
         3 Portugal
         9 Jap�o
        10 Fran�a
         5 EUA
         4 Cuba
         8 Chile
         6 Canad�
         1 Brazil
         2 Argentina


9) SELECT CodPai, NomPai
	FROM Pais WHERE NomPai LIKE '%nad�%';


    CODPAI NOMPAI
---------- ------------------------------
         6 Canad�


10) SELECT CodPai, NomPai
	FROM Pais
	WHERE CodPai IN (1, 3, 5);


    CODPAI NOMPAI
---------- ------------------------------
         1 Brazil
         3 Portugal
         5 EUA


11) Eliminar linhas em uma tabela:

DELETE Pais
	WHERE CodPai = 1;


12)a) Criando e populando a tabela Autor:

// cria a tabela de autor
CREATE TABLE Autor(
	CodAut     number(2)     not null,
	NomAut 	   char(35)      not null,
	CodPai     number(2)     not null,
	CONSTRAINT PK_Autor      PRIMARY KEY(CodAut),
	CONSTRAINT FK_Autor_Pais FOREIGN KEY(CodPai) REFERENCES Pais);

INSERT INTO Autor
	VALUES(1, 'Jos� Lins do Rego', 1);

INSERT INTO Autor
	VALUES(2, 'Leandro Dupr�', 19); 

INSERT INTO Autor
*
ERRO na linha 1:
ORA-02291: restri��o de integridade (LUIZGUSTAVO.FK_AUTOR_PAIS) violada - chave
m�e n�o localizada

INSERT INTO Autor
	VALUES(3, 'Jos� Mauro de Vasconcelos', 1);

Insert into Autor
	VALUES(4, 'Shamkant B. Navathe', 6);

INSERT INTO Autor
	VALUES(5, 'Ramez Elmasri', 6);

INSERT INTO Autor
	VALUES(6, 'Pablo Neruda', 3);

INSERT INTO Autor
	VALUES(7, 'Machado de Assis', 1);

INSERT INTO Autor
	VALUES(8, 'Guimar�es Rosa', 1);

INSERT INTO Autor
	VALUES(9, 'Maria Jos� Dupr�', 1);

INSERT INTO Autor
	VALUES(10, 'Jos� de Alencar', 1);

INSERT INTO Autor
	VALUES(11, 'J� Soares', 1);

COMMIT;

SELECT *
	FROM Autor;

    CODAUT NOMAUT                                  CODPAI
---------- ----------------------------------- ----------
         4 Shamkant B. Navathe                          6
         5 Ramez Elmasri                                6
         6 Pablo Neruda                                 3
         1 Jos� Lins do Rego                            1
         3 Jos� Mauro de Vasconcelos                    1
         7 Machado de Assis                             1
         8 Guimar�es Rosa                               1
         9 Maria Jos� Dupr�                             1
        10 Jos� de Alencar                              1

    CODAUT NOMAUT                                  CODPAI
---------- ----------------------------------- ----------
        11 J� Soares                                    1

SELECT *
	FROM Autor
	ORDER BY NomAut;

    CODAUT NOMAUT                                  CODPAI
---------- ----------------------------------- ----------
         8 Guimar�es Rosa                               1
        11 J� Soares                                    1
        10 Jos� de Alencar                              1
         1 Jos� Lins do Rego                            1
         3 Jos� Mauro de Vasconcelos                    1
         7 Machado de Assis                             1
         9 Maria Jos� Dupr�                             1
         6 Pablo Neruda                                 3
         5 Ramez Elmasri                                6
         4 Shamkant B. Navathe                          6


SELECT *
	FROM Autor
	ORDER BY CodPai, NomAut;

    CODAUT NOMAUT                                  CODPAI
---------- ----------------------------------- ----------
         8 Guimar�es Rosa                               1
        11 J� Soares                                    1
        10 Jos� de Alencar                              1
         1 Jos� Lins do Rego                            1
         3 Jos� Mauro de Vasconcelos                    1
         7 Machado de Assis                             1
         9 Maria Jos� Dupr�                             1
         6 Pablo Neruda                                 3
         5 Ramez Elmasri                                6
         4 Shamkant B. Navathe                          6


12)b) Criando e populando a tabela TipoUsuario:

CREATE TABLE TipoUsuario(
	TipUsu     char(1)         not null,
	DesTipUsu  char(15)        not null,
	CONSTRAINT PK_Tipo_usuario PRIMARY KEY(TipUsu));

DESC TipoUsuario;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 TIPUSU                                    NOT NULL CHAR(1)
 DESTIPUSU                                 NOT NULL CHAR(15)

INSERT INTO TipoUsuario
	VALUES('A', 'Aluno');

INSERT INTO TipoUsuario
	VALUES('F', 'Funcionario');

INSERT INTO TipoUsuario
	VALUES('P', 'Professor');

INSERT INTO TipoUsuario
	VALUES('V', 'Visitante');

COMMIT;

SELECT *
	FROM TipoUsuario;

T DESTIPUSU
- ---------------
A Aluno
F Funcionario
P Professor
V Visitante


13) Criando e populando a tabela TipoObra:

CREATE TABLE TipoObra(
	tipObr     number       not null,
	DesTipObr  char(25)     not null,
	CONSTRAINT PK_Tipo_Obra PRIMARY KEY(tipObr));

INSERT INTO TipoObra
	VALUES(1, 'Peri�dico Cient�fico');

INSERT INTO TipoObra
	VALUES(2, 'Fic��o');

INSERT INTO TipoObra
	VALUES(3, 'Literatura');

INSERT INTO TipoObra
	VALUES(4, 'Obra Cient�fica');

COMMIT;

SELECT *
	FROM TipoObra;

    TIPOBR DESTIPOBR
---------- -------------------------
         1 Peri�dico Cient�fico
         2 Fic��o
         3 Literatura
         4 Obra Cient�fica


14) Inclua agora dois autores de cada p�is inclu�do por voc�.

INSERT INTO Autor
	VALUES(12, 'Yoshihiro Togashi', 9);

INSERT INTO Autor
	VALUES(13, 'Pedro Ronsard', 10);

COMMIT;

SELECT NomPai, NomAut
	FROM Pais NATURAL JOIN Autor
	ORDER BY NomPai, NomAut;

NOMPAI                         NOMAUT
------------------------------ -----------------------------------
Brasil                         Guimar�es Rosa
Brasil                         J� Soares
Brasil                         Jos� de Alencar
Brasil                         Jos� Lins do Rego
Brasil                         Jos� Mauro de Vasconcelos
Brasil                         Machado de Assis
Brasil                         Maria Jos� Dupr�
Canad�                         Ramez Elmasri
Canad�                         Shamkant B. Navathe
Fran�a                         Pedro Ronsard
Jap�o                          Yoshihiro Togashi

NOMPAI                         NOMAUT
------------------------------ -----------------------------------
Portugal                       Pablo Neruda


SELECT Pais.CodPai, NomPai, NomAut
	FROM Pais JOIN Autor
	ON Pais.CodPai = Autor.CodPai
	ORDER BY NomPai, NomAut;

    CODPAI NOMPAI                         NOMAUT
---------- ------------------------------ -----------------------------------
         1 Brasil                         Guimar�es Rosa
         1 Brasil                         J� Soares
         1 Brasil                         Jos� de Alencar
         1 Brasil                         Jos� Lins do Rego
         1 Brasil                         Jos� Mauro de Vasconcelos
         1 Brasil                         Machado de Assis
         1 Brasil                         Maria Jos� Dupr�
         6 Canad�                         Ramez Elmasri
         6 Canad�                         Shamkant B. Navathe
        10 Fran�a                         Pedro Ronsard
         9 Jap�o                          Yoshihiro Togashi

    CODPAI NOMPAI                         NOMAUT
---------- ------------------------------ -----------------------------------
         3 Portugal                       Pablo Neruda


15) Criando e populando a tabelas Tabelas Unidade e Curso

// Crindo tabela de Unidade
CREATE TABLE Unidade(
	CodUni     number(2)  not null,
	NomUni     char(30)   not null,
	CONSTRAINT PK_Unidade PRIMARY KEY(CodUni));

INSERT INTO Unidade
	VALUES(1, 'Cora��o Eucar�stico');

INSERT INTO Unidade
	VALUES(2, 'Betim');

INSERT INTO Unidade
	VALUES(3, 'S�o Gabriel');

INSERT INTO Unidade
	VALUES(4, 'Barreiro');

INSERT INTO Unidade
	VALUES(5, 'Po�os de Caldas');

SELECT *
	FROM Unidade;

    CODUNI NOMUNI
---------- ------------------------------
         1 Cora��o Eucar�stico
         2 Betim
         3 S�o Gabriel
         4 Barreiro
         5 Po�os de Caldas

SELECT CodUni, NomUni
	FROM Unidade
	ORDER BY NomUni;

    CODUNI NOMUNI
---------- ------------------------------
         4 Barreiro
         2 Betim
         1 Cora��o Eucar�stico
         5 Po�os de Caldas
         3 S�o Gabriel

// Crindo tabela de Curso
CREATE TABLE Curso(
	CodCur     number(2)        not null,
	NomCur     char(25)         not null,
	CodUni     number(2)        not null,
	CONSTRAINT PK_Curso         PRIMARY KEY(CodCur),
	CONSTRAINT FK_Curso_Unidade FOREIGN KEY(CodUni) REFERENCES Unidade);

DESC Curso;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODCUR                                    NOT NULL NUMBER(2)
 NOMCUR                                    NOT NULL CHAR(25)
 CODUNI                                    NOT NULL NUMBER(2)

INSERT INTO Curso
	VALUES(1, 'Sistema de Informa��o', 4);

INSERT INTO Curso
	VALUES(2, 'Psicologia', 1);

INSERT INTO Curso
	VALUES(3, 'Hist�ria', 1);

INSERT INTO Curso
	VALUES(4, 'Sociologia', 1);

INSERT INTO Curso
	VALUES(5, 'Letras', 1);

INSERT INTO Curso
	VALUES(6, 'Ci�ncia da Computa��o', 1);

INSERT INTO Curso
	VALUES(7, 'Engenharia da Computa��o', 3);

INSERT INTO Curso
	VALUES(8, 'F�sica', 1);

INSERT INTO Curso
	VALUES(9, 'Administra��o de Empresa', 4);

INSERT INTO Curso
	VALUES(10, 'Direito', 2);

COMMIT;

SELECT *
	FROM Curso;

    CODCUR NOMCUR                        CODUNI
---------- ------------------------- ----------
         1 Sistema de Informa��o              4
         2 Psicologia                         1
         3 Hist�ria                           1
         4 Sociologia                         1
         5 Letras                             1
         6 Ci�ncia da Computa��o              1
         7 Engenharia da Computa��o           3
         8 F�sica                             1
         9 Administra��o de Empresa           4
        10 Direito                            2

INSERT INTO Curso
	VALUES(11, 'Ci�ncia da Informa��o', 5);

INSERT INTO Curso
	VALUES(12, 'Engenharia de Alimentos', 1);

INSERT INTO Curso
	VALUES(13, 'Jogos Digitais', 3);

INSERT INTO Curso
	VALUES(14, 'Engenharia Civil', 1);

INSERT INTO Curso
	VALUES(15, 'Engenharia de Software', 2);

COMMIT;

SELECT *
	FROM Curso;

    CODCUR NOMCUR                        CODUNI
---------- ------------------------- ----------
         1 Sistema de Informa��o              4
         2 Psicologia                         1
         3 Hist�ria                           1
         4 Sociologia                         1
         5 Letras                             1
         6 Ci�ncia da Computa��o              1
         7 Engenharia da Computa��o           3
         8 F�sica                             1
         9 Administra��o de Empresa           4
        10 Direito                            2
        11 Ci�ncia da Informa��o              5

    CODCUR NOMCUR                        CODUNI
---------- ------------------------- ----------
        12 Engenharia de Alimentos            1
        13 Jogos Digitais                     3
        14 Engenharia Civil                   1
        15 Engenharia de Software             2


16) Criando e populando a tabela usu�rio.

CREATE TABLE Usuario(
	CodUsu     number(2)        not null,
	NomUsu     char(35)         not null,
	SexUsu     char(1)          not null,
	CodCur     number(2)        not null,
	TipUsu     char(1)          not null,
	CONSTRAINT PK_Usuario       PRIMARY KEY(CodUsu),
	CONSTRAINT FK_Usuario_Curso FOREIGN Key(CodCur) REFERENCES Curso,
	CONSTRAINT FK_Usuario_Tipo  FOREIGN Key(TipUsu) REFERENCES TipoUsuario,
	CONSTRAINT CK_SexUsu        CHECK(SexUsu IN ('F', 'M')));

INSERT INTO Usuario
	VALUES(1, 'Maria Luiza Pereira', 'F', 1, 'P');

INSERT INTO Usuario
	VALUES(2, 'M�rio Jos� Silveira', 'M', 1, 'P');

INSERT INTO Usuario
	VALUES(3, 'Dalmo Lucas Jardim', 'M', 2, 'A');

INSERT INTO Usuario
	VALUES(4, 'Helena Albuquerque', 'F', 2, 'A');

INSERT INTO Usuario
	VALUES(5, 'Juarez Perez', 'M', 3, 'F');

INSERT INTO Usuario
	VALUES(6, 'Saulo Castro Silva', 'M', 2, 'P');

INSERT INTO Usuario
	VALUES(7, 'Lucas Rodrigo Arantes', 'M', 3, 'P');

INSERT INTO Usuario
	VALUES(8, 'C�ntia Maria Silva', 'F', 6, 'A');

INSERT INTO Usuario
	VALUES(9, 'Cec�lia Andrade Albuquerque', 'F', 8, 'A');

INSERT INTO Usuario
	VALUES(10, 'Renato Paula Braga', 'M', 2, 'A');

INSERT INTO Usuario
	VALUES(11, 'Rafael Andrade', 'M', 3, 'A');

INSERT INTO Usuario
	VALUES(12,'Jos� Marcos Silva', 'M', 3, 'F');

INSERT INTO Usuario
	VALUES(13, 'Maria Eduarda de Silva Santos', 'F', 2, 'F');

INSERT INTO Usuario
	VALUES(14, 'Luz Maria Pellegrini', 'F', 2, 'P');

INSERT INTO Usuario
	VALUES(15, 'Leandro Paula Braga', 'M', 1, 'P');

INSERT INTO Usuario
	VALUES(16, 'Lucas Faria', 'M', 1, 'A');

INSERT INTO Usuario
	VALUES(17, 'Renata Gonzalez Albuquerque e Silva', 'F', 7, 'P');

INSERT INTO Usuario
	VALUES(18, 'Cassia Abrantes Juarez', 'F', 3, 'A');

INSERT INTO Usuario
	VALUES(19, 'Luiz Gustavo Pontes', 'M', 1, 'P');

INSERT INTO Usuario
	VALUES(20, 'Lauro Samuel Andrade', 'M', 1, 'F');

COMMIT;


17) Inserir um usu�rio (matr�cula 21) com seus dados

INSERT INTO Usuario
	VALUES(21, 'Luiz Gustavo Bragan�a dos Santos', 'M', 6, 'A');

COMMIT;

SELECT *
	FROM Usuario;

    CODUSU NOMUSU                              S     CODCUR T
---------- ----------------------------------- - ---------- -
         1 Maria Luiza Pereira                 F          1 P
         2 M�rio Jos� Silveira                 M          1 P
         3 Dalmo Lucas Jardim                  M          2 A
         4 Helena Albuquerque                  F          2 A
         5 Juarez Perez                        M          3 F
         6 Saulo Castro Silva                  M          2 P
         7 Lucas Rodrigo Arantes               M          3 P
         8 C�ntia Maria Silva                  F          6 A
         9 Cec�lia Andrade Albuquerque         F          8 A
        10 Renato Paula Braga                  M          2 A
        11 Rafael Andrade                      M          3 A

    CODUSU NOMUSU                              S     CODCUR T
---------- ----------------------------------- - ---------- -
        12 Jos� Marcos Silva                   M          3 F
        13 Maria Eduarda de Silva Santos       F          2 F
        14 Luz Maria Pellegrini                F          2 P
        15 Leandro Paula Braga                 M          1 P
        16 Lucas Faria                         M          1 A
        17 Renata Gonzalez Albuquerque e Silva F          7 P
        18 Cassia Abrantes Juarez              F          3 A
        19 Luiz Gustavo Pontes                 M          1 P
        20 Lauro Samuel Andrade                M          1 F
        21 Luiz Gustavo Bragan�a dos Santos    M          6 A


17.1) Incluir mais 10 usu�rios

INSERT INTO Usuario
	VALUES(22, 'Iara Lopes', 'F', 15, 'A');

INSERT INTO Usuario
	VALUES(23, 'Theldo Cruz Franqueira', 'M', 6, 'P');

INSERT INTO Usuario
	VALUES(24, 'Miriam Lemos', 'F', 5, 'P');

INSERT INTO Usuario
	VALUES(25, 'Cl�vis Miyasaki', 'M', 8, 'P');

INSERT INTO Usuario
	VALUES(26, 'Sebastiana Geralda Bragan�a', 'F', 10, 'A');

INSERT INTO Usuario
	VALUES(27, 'Pedro Henrique', 'M', 10, 'F');

INSERT INTO Usuario
	VALUES(28, 'Isabelle Langkammer', 'F', 6, 'A');

INSERT INTO Usuario
	VALUES(29, 'Ana Clara Gomes', 'F', 2, 'A');

INSERT INTO Usuario
	VALUES(30, 'Hyalen Neves', 'M', 12, 'F');

INSERT INTO Usuario
	VALUES(31, 'Vin�cius Campos', 'M', 13, 'P');

SELECT CodUsu, NomUsu, SexUsu
	FROM Usuario
	ORDER BY NomUsu;

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        29 Ana Clara Gomes                     F
        18 Cassia Abrantes Juarez              F
         9 Cec�lia Andrade Albuquerque         F
        25 Cl�vis Miyasaki                     M
         8 C�ntia Maria Silva                  F
         3 Dalmo Lucas Jardim                  M
         4 Helena Albuquerque                  F
        30 Hyalen Neves                        M
        22 Iara Lopes                          F
        28 Isabelle Langkammer                 F
        12 Jos� Marcos Silva                   M

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
         5 Juarez Perez                        M
        20 Lauro Samuel Andrade                M
        15 Leandro Paula Braga                 M
        16 Lucas Faria                         M
         7 Lucas Rodrigo Arantes               M
        21 Luiz Gustavo Bragan�a dos Santos    M
        19 Luiz Gustavo Pontes                 M
        14 Luz Maria Pellegrini                F
        13 Maria Eduarda de Silva Santos       F
         1 Maria Luiza Pereira                 F
        24 Miriam Lemos                        F

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
         2 M�rio Jos� Silveira                 M
        27 Pedro Henrique                      M
        11 Rafael Andrade                      M
        17 Renata Gonzalez Albuquerque e Silva F
        10 Renato Paula Braga                  M
         6 Saulo Castro Silva                  M
        26 Sebastiana Geralda Bragan�a         F
        23 Theldo Cruz Franqueira              M
        31 Vin�cius Campos                     M

SELECT CodUsu, NomUsu, SexUsu
	FROM Usuario
	ORDER BY SexUsu, NomUsu;

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        29 Ana Clara Gomes                     F
        18 Cassia Abrantes Juarez              F
         9 Cec�lia Andrade Albuquerque         F
         8 C�ntia Maria Silva                  F
         4 Helena Albuquerque                  F
        22 Iara Lopes                          F
        28 Isabelle Langkammer                 F
        14 Luz Maria Pellegrini                F
        13 Maria Eduarda de Silva Santos       F
         1 Maria Luiza Pereira                 F
        24 Miriam Lemos                        F

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        17 Renata Gonzalez Albuquerque e Silva F
        26 Sebastiana Geralda Bragan�a         F
        25 Cl�vis Miyasaki                     M
         3 Dalmo Lucas Jardim                  M
        30 Hyalen Neves                        M
        12 Jos� Marcos Silva                   M
         5 Juarez Perez                        M
        20 Lauro Samuel Andrade                M
        15 Leandro Paula Braga                 M
        16 Lucas Faria                         M
         7 Lucas Rodrigo Arantes               M

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        21 Luiz Gustavo Bragan�a dos Santos    M
        19 Luiz Gustavo Pontes                 M
         2 M�rio Jos� Silveira                 M
        27 Pedro Henrique                      M
        11 Rafael Andrade                      M
        10 Renato Paula Braga                  M
         6 Saulo Castro Silva                  M
        23 Theldo Cruz Franqueira              M
        31 Vin�cius Campos                     M


18) Inserir um usu�rio com SexUsu diferente de M e F.

INSERT INTO Usuario
	VALUES(32, 'Jo�o da Silva S�', 'A', 7, 'V');

INSERT INTO Usuario
*
ERRO na linha 1:
ORA-02290: restri��o de verifica��o (LUIZGUSTAVO.CK_SEXUSU) violada

INSERT INTO Usuario
	VALUES(33, 'Jos� Carlos', 'M', 16, 'A');

INSERT INTO Usuario
*
ERRO na linha 1:
ORA-02291: restri��o de integridade (LUIZGUSTAVO.FK_USUARIO_CURSO) violada -
chave m�e n�o localizada

INSERT INTO Usuario
	VALUES(32, 'Pedro Henrique Bragan�a dos Santos', 'M', 9, 'F');

INSERT INTO Usuario
	VALUES(33, 'Mauro Janu�rio dos Santos', 'M', 3, 'F');

INSERT INTO Usuario
	VALUES(34, 'Otto Bittencourt', 'M', 6, 'A');

INSERT INTO Usuario
	VALUES(35, 'Rafael C�mara', 'M', 8, 'A');

INSERT INTO Usuario
	VALUES(36, 'Maria Jos� Braga', 'F', 13, 'P');

COMMIT;

SELECT CodUsu, NomUsu, SexUsu
	FROM Usuario;

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
         1 Maria Luiza Pereira                 F
         2 M�rio Jos� Silveira                 M
         3 Dalmo Lucas Jardim                  M
         4 Helena Albuquerque                  F
         5 Juarez Perez                        M
         6 Saulo Castro Silva                  M
         7 Lucas Rodrigo Arantes               M
         8 C�ntia Maria Silva                  F
         9 Cec�lia Andrade Albuquerque         F
        10 Renato Paula Braga                  M
        11 Rafael Andrade                      M

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        12 Jos� Marcos Silva                   M
        13 Maria Eduarda de Silva Santos       F
        14 Luz Maria Pellegrini                F
        15 Leandro Paula Braga                 M
        16 Lucas Faria                         M
        17 Renata Gonzalez Albuquerque e Silva F
        18 Cassia Abrantes Juarez              F
        19 Luiz Gustavo Pontes                 M
        20 Lauro Samuel Andrade                M
        21 Luiz Gustavo Bragan�a dos Santos    M
        22 Iara Lopes                          F

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        23 Theldo Cruz Franqueira              M
        24 Miriam Lemos                        F
        25 Cl�vis Miyasaki                     M
        26 Sebastiana Geralda Bragan�a         F
        27 Pedro Henrique                      M
        28 Isabelle Langkammer                 F
        29 Ana Clara Gomes                     F
        30 Hyalen Neves                        M
        31 Vin�cius Campos                     M
        32 Pedro Henrique Bragan�a dos Santos  M
        33 Mauro Janu�rio dos Santos           M

    CODUSU NOMUSU                              S
---------- ----------------------------------- -
        34 Otto Bittencourt                    M
        35 Rafael C�mara                       M
        36 Maria Jos� Braga                    F


19) Criando e populando a tabela Obra

CREATE TABLE Obra(
	CodObr     number(2)        not null,
	NomObr     char(35)         not null,
	TipObr     number(1)        not null,
	CONSTRAINT PK_Obra          PRIMARY KEY(CodObr),
	CONSTRAINT FK_Obra_TipoObra FOREIGN KEY(TipObr) REFERENCES TipoObra);

DESC Obra;
 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODOBR                                    NOT NULL NUMBER(2)
 NOMOBR                                    NOT NULL CHAR(35)
 TIPOBR                                    NOT NULL NUMBER(1)

INSERT INTO Obra
	VALUES(1, 'Estado de Minas', 1);

INSERT INTO Obra
	VALUES(2, 'IEEC', 3);

INSERT INTO Obra
	VALUES(3, 'Sistemas de Banco de Dados',2);

INSERT INTO Obra
	VALUES(4, 'Luna Brava', 3);

INSERT INTO Obra
	VALUES(5, 'Entidade e Relacionamentos', 2);

INSERT INTO Obra
	VALUES(6, 'Vinte poemas de Amor', 3);

INSERT INTO Obra
	VALUES(7, 'Can��o General', 3);

INSERT INTO Obra
	VALUES(8, 'Cem sonetos de Amor', 3);

INSERT INTO Obra
	VALUES(9, 'Meu p� de Laranja Lima', 2);

INSERT INTO Obra
	VALUES(10, 'Doid�o', 2);

INSERT INTO Obra
	VALUES(11, 'Menino do Engenho', 3);

INSERT INTO Obra
	VALUES(12, 'Doidinho', 3);

INSERT INTO Obra
	VALUES(13, 'Iracema', 3);

INSERT INTO Obra
	VALUES(14, 'O Guarani', 3);

INSERT INTO Obra
	VALUES(15, 'Senhora', 3);

INSERT INTO Obra
	VALUES(16, 'Luc�ola', 3);

INSERT INTO Obra
	VALUES(17, 'A pata da Gazela', 3);

INSERT INTO Obra
	VALUES(18, 'Encarna��o', 3);

INSERT INTO Obra
	VALUES(19, 'Luz e Sombra', 3);

INSERT INTO Obra
	VALUES(20, 'Os Rodrigues', 3);

INSERT INTO Obra
	VALUES(21, 'D. Lola', 3);

INSERT INTO Obra
	VALUES(22, 'O Estado de S�o Paulo', 1);

INSERT INTO Obra
	VALUES(23, 'A Folha de S�o Paulo', 3);

INSERT INTO Obra
	VALUES(24, 'Jard�n de invierno', 3);

INSERT INTO Obra
	VALUES(25, 'Tentativa del hombre infinito', 3);

INSERT INTO Obra
	VALUES(26, 'Crepusculario', 3);

INSERT INTO Obra
	VALUES(27, 'Grande Sert�o Veredas', 3);

COMMIT;

SELECT CodObr, NomObr
	FROM Obra
	ORDER BY NomObr;

    CODOBR NOMOBR
---------- -----------------------------------
        23 A Folha de S�o Paulo
        17 A pata da Gazela
         7 Can��o General
         8 Cem sonetos de Amor
        26 Crepusculario
        21 D. Lola
        10 Doid�o
        12 Doidinho
        18 Encarna��o
         5 Entidade e Relacionamentos
         1 Estado de Minas

    CODOBR NOMOBR
---------- -----------------------------------
        27 Grande Sert�o Veredas
         2 IEEC
        13 Iracema
        24 Jard�n de invierno
        16 Luc�ola
         4 Luna Brava
        19 Luz e Sombra
        11 Menino do Engenho
         9 Meu p� de Laranja Lima
        22 O Estado de S�o Paulo
        14 O Guarani

    CODOBR NOMOBR
---------- -----------------------------------
        20 Os Rodrigues
        15 Senhora
         3 Sistemas de Banco de Dados
        25 Tentativa del hombre infinito
         6 Vinte poemas de Amor


20) Inserir mais 5 obras dos autores.

INSERT INTO Obra
	VALUES(28, 'Hunter X Hunter', 2);

INSERT INTO Obra
	VALUES(29, 'Yuyu Hakush�', 2);

INSERT INTO Obra
	VALUES(30, 'Senhor dos An�is', 3);

INSERT INTO Obra
	VALUES(31, 'One Piece', 2);

INSERT INTO Obra
	VALUES(32, 'Dragon Ball Z', 2);

COMMIT;

SELECT *
	FROM Obra;

    CODOBR NOMOBR                                  TIPOBR
---------- ----------------------------------- ----------
         1 Estado de Minas                              1
         2 IEEC                                         3
         3 Sistemas de Banco de Dados                   2
         4 Luna Brava                                   3
         5 Entidade e Relacionamentos                   2
         6 Vinte poemas de Amor                         3
         7 Can��o General                               3
         8 Cem sonetos de Amor                          3
         9 Meu p� de Laranja Lima                       2
        10 Doid�o                                       2
        11 Menino do Engenho                            3

    CODOBR NOMOBR                                  TIPOBR
---------- ----------------------------------- ----------
        12 Doidinho                                     3
        13 Iracema                                      3
        14 O Guarani                                    3
        15 Senhora                                      3
        16 Luc�ola                                      3
        17 A pata da Gazela                             3
        18 Encarna��o                                   3
        19 Luz e Sombra                                 3
        20 Os Rodrigues                                 3
        21 D. Lola                                      3
        22 O Estado de S�o Paulo                        1

    CODOBR NOMOBR                                  TIPOBR
---------- ----------------------------------- ----------
        23 A Folha de S�o Paulo                         3
        24 Jard�n de invierno                           3
        25 Tentativa del hombre infinito                3
        26 Crepusculario                                3
        27 Grande Sert�o Veredas                        3
        28 Hunter X Hunter                              2
        29 Yuyu Hakush�                                 2
        30 Senhor dos An�is                             3
        31 One Piece                                    2
        32 Dragon Ball Z                                2


21) Criando e populando a tabela Autoria.

CREATE TABLE Autoria(
	CodObr     number(2)        not null,
	CodAut     number(2)        not null,
	CONSTRAINT PK_Autoria       PRIMARY KEY(CodObr, CodAut),
	CONSTRAINT FK_Autoria_Autor FOREIGN KEY(CodAut) REFERENCES Autor,
	CONSTRAINT FK_Autor_Obra    FOREIGN KEY(CodObr) REFERENCES Obra ON DELETE CASCADE);

INSERT INTO Autoria
	VALUES(1, 4);

INSERT INTO Autoria
	VALUES(2, 4);

INSERT INTO Autoria
	VALUES(3, 5);

INSERT INTO Autoria
	VALUES(4, 7);

INSERT INTO Autoria
	VALUES(5, 5);

INSERT INTO Autoria
	VALUES(6, 6);

INSERT INTO Autoria
	VALUES(7, 7);

INSERT INTO Autoria
	VALUES(8, 6);

INSERT INTO Autoria
	VALUES(9, 3);

INSERT INTO Autoria
	VALUES(10, 3);

INSERT INTO Autoria
	VALUES(11, 1);

INSERT INTO Autoria
	VALUES(12, 1);

INSERT INTO Autoria
	VALUES(13, 10);

INSERT INTO Autoria
	VALUES(14, 10);

INSERT INTO Autoria
	VALUES(15, 10);

INSERT INTO Autoria
	VALUES(16, 10);

INSERT INTO Autoria
	VALUES(17, 10);

INSERT INTO Autoria
	VALUES(18, 10);

INSERT INTO Autoria
	VALUES(19, 9);

INSERT INTO Autoria
	VALUES(20, 9);

INSERT INTO Autoria
	VALUES(21, 7);

INSERT INTO Autoria
	VALUES(22, 6);

INSERT INTO Autoria
	VALUES(23, 5);

INSERT INTO Autoria
	VALUES(24, 8);

INSERT INTO Autoria
	VALUES(25, 6);

INSERT INTO Autoria
	VALUES(26, 6);

INSERT INTO Autoria
	VALUES(27, 8);

COMMIT;


22)
// erro: viola��o de integridade, n�o possui autor 49
INSERT INTO Autoria
	VALUES(3, 49);

INSERT INTO Autoria
*
ERRO na linha 1:
ORA-02291: restri��o de integridade (LUIZGUSTAVO.FK_AUTORIA_AUTOR) violada -
chave m�e n�o localizada

// erro: viola��o de integridade, n�o existe a obra 89
INSERT INTO Autoria
	VALUES(89, 4);

INSERT INTO Autoria
*
ERRO na linha 1:
ORA-02291: restri��o de integridade (LUIZGUSTAVO.FK_AUTOR_OBRA) violada - chave
m�e n�o localizada

/* seleciona nome do autor e nome da obra que el fez que esteja inserido em
 autoria e obra */
SELECT NomObr, NomAut
	FROM Autor NATURAL JOIN
	Autoria NATURAL JOIN Obra
	ORDER BY NomObr;

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
A Folha de S�o Paulo                Ramez Elmasri
A pata da Gazela                    Jos� de Alencar
Can��o General                      Machado de Assis
Cem sonetos de Amor                 Pablo Neruda
Crepusculario                       Pablo Neruda
D. Lola                             Machado de Assis
Doid�o                              Jos� Mauro de Vasconcelos
Doidinho                            Jos� Lins do Rego
Encarna��o                          Jos� de Alencar
Entidade e Relacionamentos          Ramez Elmasri
Estado de Minas                     Shamkant B. Navathe

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
Grande Sert�o Veredas               Guimar�es Rosa
IEEC                                Shamkant B. Navathe
Iracema                             Jos� de Alencar
Jard�n de invierno                  Guimar�es Rosa
Luc�ola                             Jos� de Alencar
Luna Brava                          Machado de Assis
Luz e Sombra                        Maria Jos� Dupr�
Menino do Engenho                   Jos� Lins do Rego
Meu p� de Laranja Lima              Jos� Mauro de Vasconcelos
O Estado de S�o Paulo               Pablo Neruda
O Guarani                           Jos� de Alencar

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
Os Rodrigues                        Maria Jos� Dupr�
Senhora                             Jos� de Alencar
Sistemas de Banco de Dados          Ramez Elmasri
Tentativa del hombre infinito       Pablo Neruda
Vinte poemas de Amor                Pablo Neruda


23)
INSERT INTO Autoria
	VALUES(28, 12);

INSERT INTO Autoria
	VALUES(29, 12);

INSERT INTO Autoria
	VALUES(30, 10);

INSERT INTO Autoria
	VALUES(31, 10);

INSERT INTO Autoria
	VALUES(32, 10);

COMMIT;

SELECT NomObr, NomAut
	FROM Autor NATURAL JOIN
	Autoria NATURAL JOIN Obra
	ORDER BY NomObr;

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
A Folha de S�o Paulo                Ramez Elmasri
A pata da Gazela                    Jos� de Alencar
Can��o General                      Machado de Assis
Cem sonetos de Amor                 Pablo Neruda
Crepusculario                       Pablo Neruda
D. Lola                             Machado de Assis
Doid�o                              Jos� Mauro de Vasconcelos
Doidinho                            Jos� Lins do Rego
Dragon Ball Z                       Jos� de Alencar
Encarna��o                          Jos� de Alencar
Entidade e Relacionamentos          Ramez Elmasri

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
Estado de Minas                     Shamkant B. Navathe
Grande Sert�o Veredas               Guimar�es Rosa
Hunter X Hunter                     Yoshihiro Togashi
IEEC                                Shamkant B. Navathe
Iracema                             Jos� de Alencar
Jard�n de invierno                  Guimar�es Rosa
Luc�ola                             Jos� de Alencar
Luna Brava                          Machado de Assis
Luz e Sombra                        Maria Jos� Dupr�
Menino do Engenho                   Jos� Lins do Rego
Meu p� de Laranja Lima              Jos� Mauro de Vasconcelos

NOMOBR                              NOMAUT
----------------------------------- -----------------------------------
O Estado de S�o Paulo               Pablo Neruda
O Guarani                           Jos� de Alencar
One Piece                           Jos� de Alencar
Os Rodrigues                        Maria Jos� Dupr�
Senhor dos An�is                    Jos� de Alencar
Senhora                             Jos� de Alencar
Sistemas de Banco de Dados          Ramez Elmasri
Tentativa del hombre infinito       Pablo Neruda
Vinte poemas de Amor                Pablo Neruda
Yuyu Hakush�                        Yoshihiro Togashi


24) Experimentando a integridade referencial

DELETE FROM Autor
	WHERE CodAut = 3;

DELETE FROM Autor
*
ERRO na linha 1:
ORA-02292: restri��o de integridade (LUIZGUSTAVO.FK_AUTORIA_AUTOR) violada -
registro filho localizado


25) Criando e populando a tabela Editora

CREATE TABLE Editora(
	CodEdi     number(2)  not null,
	NomEdi     char(35)   not null,
	CONSTRAINT PK_Editora PRIMARY KEY(CodEdi));

DESC Editora;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODEDI                                    NOT NULL NUMBER(2)
 NOMEDI                                    NOT NULL CHAR(35)

INSERT INTO Editora
	VALUES(1, 'Editora Atlas');

INSERT INTO Editora
	VALUES(2, 'Editora FTC');

INSERT INTO Editora
	VALUES(3, 'Editora LTC');

INSERT INTO Editora
	VALUES(4, 'Editora Vozes');

INSERT INTO Editora
	VALUES(5, 'Editora Cascais');

INSERT INTO Editora
	VALUES(6, 'Ediouro');

INSERT INTO Editora
	VALUES(7, 'Editora Cortez');

INSERT INTO Editora
	VALUES(8, 'Brasiliense');

INSERT INTO Editora
	VALUES(9, 'Editora Ateli�');

INSERT INTO Editora
	VALUES(10, 'Editora �tica');

COMMIT;

SELECT *
	FROM Editora;

    CODEDI NOMEDI
---------- -----------------------------------
         1 Editora Atlas
         2 Editora FTC
         3 Editora LTC
         4 Editora Vozes
         5 Editora Cascais
         6 Ediouro
         7 Editora Cortez
         8 Brasiliense
         9 Editora Ateli�
        10 Editora �tica

SELECT NomEdi, CodEdi
	FROM Editora
	ORDER BY NomEdi;

NOMEDI                                  CODEDI
----------------------------------- ----------
Brasiliense                                  8
Ediouro                                      6
Editora Ateli�                               9
Editora Atlas                                1
Editora Cascais                              5
Editora Cortez                               7
Editora FTC                                  2
Editora LTC                                  3
Editora �tica                               10
Editora Vozes                                4


26) Inserir mais tr�s editoras

INSERT INTO Editora
	VALUES(11, 'Conrad');

INSERT INTO Editora
	VALUES(12, 'Panini');

INSERT INTO Editora
	VALUES(13, 'JBC');

COMMIT;

SELECT NomEdi, CodEdi
	FROM Editora
	ORDER BY NomEdi;

NOMEDI                                  CODEDI
----------------------------------- ----------
Brasiliense                                  8
Conrad                                      11
Ediouro                                      6
Editora Ateli�                               9
Editora Atlas                                1
Editora Cascais                              5
Editora Cortez                               7
Editora FTC                                  2
Editora LTC                                  3
Editora �tica                               10
Editora Vozes                                4

NOMEDI                                  CODEDI
----------------------------------- ----------
JBC                                         13
Panini                                      12


27) Criando e populando a tabela exemplar

CREATE TABLE Exemplar(
	NumExe     number(2)           not null,
	CodObr     number(2)           not null,
	AnoEdi     number(4)           not null,
	CodEdi     number(2)           not null,
	CodUni     number(2)           not null,
	ValExe     number(6, 2)        not null,
	CONSTRAINT PK_Exemplar         PRIMARY KEY(NumExe),
	CONSTRAINT FK_Exemplar_Editora FOREIGN KEY(CodEdi) REFERENCES Editora,
	CONSTRAINT FK_Exemplar_Obra    FOREIGN KEY(CodObr) REFERENCES Obra,
	CONSTRAINT FK_Exemplar_Unidade FOREIGN KEY(CodUni) REFERENCES Unidade);

DESC Exemplar;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 NUMEXE                                    NOT NULL NUMBER(2)
 CODOBR                                    NOT NULL NUMBER(2)
 ANOEDI                                    NOT NULL NUMBER(4)
 CODEDI                                    NOT NULL NUMBER(2)
 CODUNI                                    NOT NULL NUMBER(2)
 VALEXE                                    NOT NULL NUMBER(6,2)

INSERT INTO Exemplar
	VALUES(1, 1, 2009, 1, 1, 120.50);

INSERT INTO Exemplar
	VALUES(2, 1, 2010, 1, 1, 110);

INSERT INTO Exemplar
	VALUES(3, 1, 2011, 1, 2, 110.30);

INSERT INTO Exemplar
	VALUES(4, 1, 2011, 1, 2, 130);

INSERT INTO Exemplar
	VALUES(5, 1, 2009, 2, 3, 80.80);

INSERT INTO Exemplar
	VALUES(10, 2, 2008, 2, 1, 90);

INSERT INTO Exemplar
	VALUES(6, 2, 2010, 3, 1, 80.80);

INSERT INTO Exemplar
	VALUES(7, 3, 2011, 3, 1, 50);

INSERT INTO Exemplar
	VALUES(8, 3, 2012, 5, 2, 70.90);

INSERT INTO Exemplar
	VALUES(9, 3, 2009, 3, 4, 50);

COMMIT;


28) Inserir mais 30 exemplares.

INSERT INTO Exemplar
	VALUES(11, 4, 2000, 2, 1, 200.20);

INSERT INTO Exemplar
	VALUES(12, 5, 1950, 1, 1, 20);

INSERT INTO Exemplar
	VALUES(13, 6, 1943, 1, 1, 30);

INSERT INTO Exemplar
	VALUES(14, 7, 1930, 1, 1, 25);

INSERT INTO Exemplar
	VALUES(15, 8, 1816, 1, 1, 23);

INSERT INTO Exemplar
	VALUES(16, 9, 1987, 1, 1, 45.60);

INSERT INTO Exemplar
	VALUES(17, 10, 1920, 1, 1, 25.99);

INSERT INTO Exemplar
	VALUES(18, 11, 1798, 1, 1, 36.80);

INSERT INTO Exemplar
	VALUES(19, 32, 2007, 1, 1, 12.90);

INSERT INTO Exemplar
	VALUES(20, 12, 2012, 1, 1, 20.07);

INSERT INTO Exemplar
	VALUES(21, 13, 2013, 1, 1, 50.10);

INSERT INTO Exemplar
	VALUES(22, 14, 2000, 1, 1, 80.60);

INSERT INTO Exemplar
	VALUES(23, 15, 2007, 1, 1, 60.20);

INSERT INTO Exemplar
	VALUES(24, 16, 1996, 1, 1, 40.90);

INSERT INTO Exemplar
	VALUES(25, 17, 1993, 1, 1, 99);

INSERT INTO Exemplar
	VALUES(26, 18, 1995, 1, 1, 50.20);

INSERT INTO Exemplar
	VALUES(27, 19, 1973, 1, 1, 30.10);

INSERT INTO Exemplar
	VALUES(28, 20, 1964, 1, 1, 80.30);

INSERT INTO Exemplar
	VALUES(29, 21, 1933, 1, 1, 100.25);

INSERT INTO Exemplar
	VALUES(30, 22, 1820, 1, 1, 110);

INSERT INTO Exemplar
	VALUES(31, 23, 1999, 1, 1, 19.90);

INSERT INTO Exemplar
	VALUES(32, 24, 1923, 1, 1, 155);

INSERT INTO Exemplar
	VALUES(33, 25, 1940, 1, 1, 22);

INSERT INTO Exemplar
	VALUES(34, 26, 1939, 1, 1, 45);

INSERT INTO Exemplar
	VALUES(35, 27, 1991, 1, 1, 33.90);

INSERT INTO Exemplar
	VALUES(36, 28, 1990, 1, 1, 45.60);

INSERT INTO Exemplar
	VALUES(37, 29, 2006, 1, 1, 12.90);

INSERT INTO Exemplar
	VALUES(38, 30, 2001, 1, 1, 12.90);

INSERT INTO Exemplar
	VALUES(39, 31, 2004, 1, 1, 12.90);

COMMIT;


29) Criando e populando a tabela emprestimo.

CREATE TABLE Emprestimo(
	CodUsu     number(2)              not null,
	NumExe     number(2)              not null,
	DatEmp     date                   default sysdate,
	DatPreDev  date                   default (sysdate + 10),
	DatDev     date,
	CONSTRAINT PK_Emprestimo          PRIMARY KEY(CodUsu, NumExe, DatEmp),
	CONSTRAINT FK_Emprestimo_Exemplar FOREIGN KEY(NumExe) REFERENCES Exemplar,
	CONSTRAINT FK_Emprestimo_Usuario  FOREIGN KEY(CodUsu) REFERENCES Usuario,
	CONSTRAINT CK_DatDev              CHECK(DatDev is null OR DatDev >= DatEmp));

DESC Emprestimo;

 Nome                                      Nulo?    Tipo
 ----------------------------------------- -------- ----------------------------
 CODUSU                                    NOT NULL NUMBER(2)
 NUMEXE                                    NOT NULL NUMBER(2)
 DATEMP                                    NOT NULL DATE
 DATPREDEV                                          DATE
 DATDEV                                             DATE

// formata o tipo de entrada de datas
ALTER session SET nls_date_format='ddmmyyyy';

INSERT INTO Emprestimo
	VALUES(1, 2, '01092009', '11092009', '08092009');

INSERT INTO Emprestimo
	VALUES(3, 1, default, default, null);

INSERT INTO Emprestimo
*
ERRO na linha 1:
ORA-02290: restri��o de verifica��o (LUIZGUSTAVO.CK_DATDEV) violada

INSERT INTO Emprestimo
	VALUES(2, 2, '01092010', '11092010', '08092010');

INSERT INTO Emprestimo
	VALUES(4, 5, default, default, null);

INSERT INTO Emprestimo
	VALUES(4, 2, '01092011', '11092011', '08092011');

INSERT INTO Emprestimo
	VALUES(3, 1, '01012013', '10012013', '08012013');

INSERT INTO Emprestimo
	VALUES(1, 2, '01022012', '11022012', '08022012');

INSERT INTO Emprestimo
	VALUES(3, 3, '01092011', '11092011', '08092011');

INSERT INTO Emprestimo
	VALUES(2, 3, '01012012', '11012012', '08012012');

INSERT INTO Emprestimo
	VALUES(1, 4, '01032012', '11032012', '08032012');

INSERT INTO Emprestimo
	VALUES(1, 8, '01102011', '11102011', '08102011');

SELECT *
	FROM Emprestimo;

    CODUSU     NUMEXE DATEMP   DATPREDE DATDEV
---------- ---------- -------- -------- --------
         1          2 01092009 11092009 08092009
         3          1 25092017 05102017
         2          2 01092010 11092010 08092010
         4          5 25092017 05102017
         4          2 01092011 11092011 08092011
         3          1 01012013 10012013 08012013
         1          2 01022012 11022012 08022012
         3          3 01092011 11092011 08092011
         2          3 01012012 11012012 08012012
         1          4 01032012 11032012 08032012
         1          8 01102011 11102011 08102011


30)
// erro: a data de devolu��o � anterior ao emprestimo
INSERT INTO Emprestimo
	VALUES(4, 2, '10092009', default, '08092009');

INSERT INTO Emprestimo
*
ERRO na linha 1:
ORA-02290: restri��o de verifica��o (LUIZGUSTAVO.CK_DATDEV) violada


31) Inserir 15 emprestimos.

INSERT INTO Emprestimo
	VALUES(21, 28, '15092017', '20092017', '19092017');

INSERT INTO Emprestimo
	VALUES(22, 9, '10092017', '15092017', '13092017');

INSERT INTO Emprestimo
	VALUES(20, 10, '20092017', '27092017', '25092017');

INSERT INTO Emprestimo
	VALUES(25, 8, '20092017', '27092017', null);

INSERT INTO Emprestimo
	VALUES(26, 7, '01092017', '10092017', '10092017');

INSERT INTO Emprestimo
	VALUES(23, 21, '23092017', '30092017', null);

INSERT INTO Emprestimo
	VALUES(35, 27, '23092017', '30092017', '24092017');

INSERT INTO Emprestimo
	VALUES(34, 28, '23092017', '30092017', null);

INSERT INTO Emprestimo
	VALUES(32, 29, '07082017', '15082017', null);

INSERT INTO Emprestimo
	VALUES(36, 30, '07082017', '15082017', '14082017');

INSERT INTO Emprestimo
	VALUES(28, 30, '08082017', '16082017', '16082017');

INSERT INTO Emprestimo
	VALUES(29, 4, '08082017', '16082017', '16082017');

INSERT INTO Emprestimo
	VALUES(30, 3, '08092017', '16092017', '09092017');

INSERT INTO Emprestimo
	VALUES(31, 2, '09092017', '19092017', '10092017');

INSERT INTO Emprestimo
	VALUES(24, 11, '20082017', '25082017', '22082017');

COMMIT;

SELECT *
	FROM Emprestimo;

    CODUSU     NUMEXE DATEMP   DATPREDE DATDEV
---------- ---------- -------- -------- --------
         1          2 01092009 11092009 08092009
         3          1 25092017 05102017
         2          2 01092010 11092010 08092010
         4          5 25092017 05102017
         4          2 01092011 11092011 08092011
         3          1 01012013 10012013 08012013
         1          2 01022012 11022012 08022012
         3          3 01092011 11092011 08092011
         2          3 01012012 11012012 08012012
         1          4 01032012 11032012 08032012
         1          8 01102011 11102011 08102011

    CODUSU     NUMEXE DATEMP   DATPREDE DATDEV
---------- ---------- -------- -------- --------
        22          9 10092017 15092017 13092017
        20         10 20092017 27092017 25092017
        25          8 20092017 27092017
        26          7 01092017 10092017 10092017
        23         21 23092017 30092017
        35         27 23092017 30092017 24092017
        34         28 23092017 30092017
        32         29 07082017 15082017
        36         30 07082017 15082017 14082017
        29          4 08082017 16082017 16082017
        30          3 08092017 16092017 09092017

    CODUSU     NUMEXE DATEMP   DATPREDE DATDEV
---------- ---------- -------- -------- --------
        31          2 09092017 19092017 10092017
        24         11 20082017 25082017 22082017
        28         30 08082017 16082017 16082017
        21         28 15092017 20092017 19092017