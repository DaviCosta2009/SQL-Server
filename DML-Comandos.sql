create database bdLojaGuaia;

use bdLojaGuaia;

create table tbprodutu(
	id int identity(1,1),
	nome varchar(40),
	valor varchar(40),
	qtddd int,

	--descricão
);

--ALTER DATABASE bdLojaGuaia MODIFY NAME = bdLoja;

--ALTER TABLE tbProduto ALTER COLUMN id INT NOT NULL;

--EXEC sp_rename 'tbProduto.id', 'idProduto','COLUMN';

--EXEC sp_rename 'tbProdutu' , 'tbProduto';

--ALTER TABLE tbProduto ADD CONSTRAINT pk_tbProduto PRIMARY KEY(idProduto);
