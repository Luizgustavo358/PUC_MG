/********************************************
  *             Relatorio 1                 *
  * ----------------------------------------*
  * Materia: Banco de Dados                 *
  *					    *
  * Nome: Luiz Gustavo Bragan�a dos Santos  *
  * Matricula: 524507                       *
  * Turno: Manh�                            *
  *******************************************/

1) DDL

-- Minha primeira tabela
Create table Pais(
	CodPai     number(2) not null,
	NomPai     char(30)  not null,
	Constraint PK_Pais   primary key(CodPai));


2) 
-- para mostrar a descricao da tabela
desc Pais


3) 
-- inserindo na tabela
Insert into Pais
	values(1, 'Brasil');


4)
-- inserindo na tabela
Insert into Pais
	values(2, 'Argentina');


4)a)
-- vai dar erro de codigo do pais
Insert into Pais
	values(1, 'EUA');


4)b)
-- precisa de dois elementos
Insert into Pais
	values(3); 

5)
-- salvando 
commit;

5)a)
-- mostrando a tabela
Select *  
	from Pais;

6)
Insert into Pais
	values(3, 'Chile');

7)
Select *
	from Pais;

8)
-- volta ate o commit
rollback;

9)
Select * 
	from Pais;

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
commit;

12) Criando tabela Autor
Create table Autor(
	CodAut     number(2)     not null,
	NomAut 	   char(35)      not null,
	CodPai     number(2)     not null,
	Constraint PK_Autor      primary key(CodAut),
	Constraint FK_Autor_Pais foreign key(CodPai) references Pais);


13)
Insert into Autor
	values(1, 'Jos� Luis do Rego', 1);


14)
Insert into Autor
	values(2, 'Leandro Dupr�', 1);


15) -- vai dar erro
Insert into Autor
	values(3);


16)-- erro
Insert into Autor
	values(3, 'Elman', 14);


17)-- erro
Insert into Autor
	values(3, 'Elman');


18)
commit;


19) -- mostra todos os nomes de autores ordenados de forma decrescente
Select NomAut
	from Autor
	order by NomAut desc;


20) -- mostra o nome dos autores e de qual pa�s s�o
Select NomAut, NomPai
	from Autor join Pais
	on Autor.CodPai = Pais.CodPai;


21) -- mostra todos autores 
Select * 
	from Autor join Pais
	on Pais.CodPai = Autor.CodPai;


22)
Select * 
	from Pais natural join Autor;


23) Para alterar conte�do dos dados
Update Pais
	set NomPai = 'Brazil'
	where codPai = 1;

24)
Select *
	from Pais;

25)
Rollback;


26) repetir 24


27) Para eliminar uma linha
Delete Pais
	where CodPai = 1;

28) repetir 25, 24