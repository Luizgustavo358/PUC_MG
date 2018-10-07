/********************************************
  *             Relatorio 3                 *
  * ----------------------------------------*
  * Materia: Banco de Dados                 *
  *				                            	    *
  * Nome: Luiz Gustavo Bragança dos Santos  *
  * Matricula: 524507                       *
  * Turno: Manhã                            *
  *******************************************/


--- 32 ---
SELECT codEdi, nomEdi
  FROM Editora
  WHERE codEdi IN
        (SELECT codEdi
          FROM Exemplar
          WHERE numExe IN
                (SELECT numExe
                  FROM Emprestimo
                  WHERE matUsu IN
                        (SELECT CodUsu
                          FROM Usuario
                          WHERE nomUsu LIKE '%Vilarinho%')))
ORDER BY nomEdi;


--- 34 ---
SELECT nomPai
  FROM Pais
  WHERE codPai IN
        (SELECT codPai
          FROM Autor
          WHERE codAut IN
                (SELECT codAut
                  FROM Autoria
                  WHERE codObr IN
                        (SELECT codObr
                          FROM Obra
                          WHERE nomObr = 'Web 2.0')))
ORDER BY nomPai;


--- 36 ---
SELECT P.codPai, P.nomPai
  FROM Pais P
  WHERE EXISTS
    (SELECT *
      FROM Autor
      WHERE codPai = P.codPai)
ORDER BY P.nomPai;


--- 38 ---
SELECT U.CodUsu, U.nomUsu
  FROM Usuario U
  WHERE NOT EXISTS
    (SELECT *
      FROM Emprestimo
      WHERE CodUsu = U.CodUsu)
ORDER BY U.nomUsu;


--- 59 ---
SELECT E.codEdi, E.nomEdi
  FROM Editora  E,
       Exemplar X,
       Obra     O
  WHERE E.codEdi = X.codEdi
  AND X.codObr IN
      (SELECT O.codObr
        FROM Obra
        WHERE nomObr LIKE '% Sistema %')
ORDER BY E.nomEdi;


--- 61 ---
SELECT O.nomObr, A.nomAut
  FROM Obra    O,
       Autor   A,
       Autoria U
  WHERE O.codObr = U.codObr
  AND   A.codAut = U.codAut
  AND   A.codPai IN (SELECT P.codPai
                      FROM Pais P
                      WHERE A.codPai = P.codPai
                      AND   P.nomPai = 'Brasil'
                      OR    P.nomPai = 'Espanha')
ORDER BY nomAut, nomObr;


--- 68 ---
SELECT U.codUsu, U.nomUsu
  FROM Usuario     U,
       TipoUsuario T,
       Emprestimo  E
  WHERE T.desTipUsu = 'Aluno'
  AND T.tipUsu = U.tipUsu
  AND NOT EXISTS
    (SELECT *
      FROM Emprestimo)
ORDER BY U.codUsu, U.nomUsu;


--- 77 ---
SELECT DISTINCT Obra.CodObr,
                Obra.nomObr,
                Editora.CodEdi,
                Editora.NomEdi
  FROM Pais INNER JOIN Autor
    ON nomPai = 'Chile'
    AND Pais.codPai = Autor.codPai
    INNER JOIN Autoria
    ON Autor.codAut = Autoria.codAut
    INNER JOIN Exemplar
    ON Autoria.codObr = Exemplar.codObr
    INNER JOIN Editora
    ON Editora.codEdi = Exemplar.codEdi
ORDER BY nomObr, nomEdi;


--- 81 ---
SELECT Obra.codObr, Obra.nomObr
  FROM Obra INNER JOIN Autoria
    ON Obra.codObr = Autoria.codObr
  INNER JOIN Autor
    ON Autoria.codAut = Autor.codAut
  INNER JOIN Pais
    ON Autor.codPai = Pais.codPai
    AND nomPai = 'Portugal'
    OR nomPai  = 'Brasil'
ORDER BY Obra.codObr, Obra.nomObr;


--- 83 ---
SELECT U.codUsu, U.nomUsu
  FROM Usuario U JOIN TipoUsuario T
    ON  T.desTipUsu = 'Aluno'
    AND U.tipUsu = T.tipUsu
    WHERE NOT EXISTS
      (SELECT *
        FROM Emprestimo)
ORDER BY U.codUsu, U.nomUsu;


--- 85 ---
SELECT Autor.nomAut, Autor.codAut
  FROM Autor INNER JOIN Obra
    ON nomObr LIKE '%Sistema%'
    INNER JOIN Editora
    ON nomEdi = 'Acaiaca'
ORDER BY Autor.nomAut, Autor.codAut;


--- 91 ---
SELECT DISTINCT nomObr, nomAut
  FROM Pais    NATURAL JOIN
       Autor   NATURAL JOIN
       Autoria NATURAL JOIN Obra
  WHERE nomPai = 'Brasil'
  OR nomPai = 'Espanha'
ORDER BY nomObr;


--- 93 ---
SELECT nomPai, codPai, nomAut
  FROM Autor NATURAL JOIN Pais
  WHERE nomPai = 'Portugal'
  AND nomAut LIKE '% Maria %'
ORDER BY nomPai;


--- 95 ---
SELECT codUsu, nomUsu
  FROM Usuario NATURAL JOIN Emprestimo
  WHERE codUsu IN
        (SELECT codUsu
          FROM Emprestimo
          WHERE datDev > datPreDev)
ORDER BY nomUsu;


--- 111 ---
SELECT COUNT(codUsu)
  FROM Usuario
  WHERE sexUsu = 'F';


--- 115 ---
SELECT AVG(valExe)
  FROM Exemplar;


--- 117 ---



--- 121 ---
SELECT COUNT(codObr)
  FROM Obra    NATURAL JOIN
       Autoria NATURAL JOIN Autor
  WHERE nomAut = 'José de Alencar';


--- 125 ---
SELECT DISTINCT Usuario.codUsu, Usuario.nomUsu, MAX(valExe)
  FROM Usuario INNER JOIN
       Emprestimo INNER JOIN
       Exemplar INNER JOIN Obra
  WHERE Usuario.sexUsu = 'F'
  AND Usuario.codUsu IN
        (SELECT *
          FROM Emprestimo)
ORDER BY Usuario.nomUsu;


--- 129 ---
SELECT codObr, nomObr, MAX(valExe), MIN(valExe), AVG(valExe)
  FROM Exemplar NATURAL JOIN
       Obra     NATURAL JOIN
       Autoria  NATURAL JOIN
       Autor    NATURAL JOIN Pais
  WHERE nomPai = 'Brasil'
  GROUP BY codObr, nomObr
ORDER BY nomObr;


--- 141 ---


--- 142 ---


--- 143 ---


--- 144 ---


--- 145 ---
SELECT codObr, nomObr
  FROM Obra NATURAL JOIN Exemplar
  GROUP BY codObr, nomObr
  HAVING count(numExe) < 6
ORDER BY nomObr;


--- 147 ---


--- 149 ---


--- 155 ---


--- 161 ---
