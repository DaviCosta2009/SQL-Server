CREATE DATABASE bdLojaRoupas
GO

USE bdLojaRoupas

DROP DATABASE bdLojaRoupas

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente VARCHAR(50),
	idadeCliente INT,
)

CREATE TABLE tbVendedor(
	codVendedor INT PRIMARY KEY IDENTITY(1,1),
	nomeVendedor VARCHAR(50),
)

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY(1,1),
	dataVenda DATE,
	codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente),
	codVendedor INT FOREIGN KEY REFERENCES tbVendedor(codVendedor),
	totalVenda DECIMAL(8,2),
)

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1,1),
	nomeFabricante VARCHAR(70),
)

CREATE TABLE tbFuncionario(
	codFuncionario INT PRIMARY KEY IDENTITY(1,1),
	nomeFuncionario VARCHAR(50),
	idadeFuncionario INT,
	dataAdmissaoFuncionario DATE,
	salarioFuncionario DECIMAL(8,2),
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1),
	nomeProduto VARCHAR(70),
	precoProduto DECIMAL(8,2),
	dataEntradaProduto DATE,
	codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario),
	codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante),
)

CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1,1),
	codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda),
	codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto),
	quantidadeItensItensVenda INT,
	subTotalItensVenda DECIMAL(8,2),
)

INSERT INTO tbFabricante(nomeFabricante) VALUES ('Malwee'),('Marisol'),('Cia da Malha')

SELECT * FROM tbProduto

INSERT INTO tbFuncionario(nomeFuncionario,idadeFuncionario,dataAdmissaoFuncionario,salarioFuncionario) VALUES ('Evenildo',17,'06/07/2025',1059),('Emernegildo',55,'03/10/2025',1500),('Emenuel',47,'08/01/2025',1400),('Jose',60,'18/10/2022',2500),('Bruno',30,'25/03/2025',1750),('Mariana',15,'29/03/2026',1621)

INSERT INTO tbFuncionario(nomeFuncionario,idadeFuncionario,dataAdmissaoFuncionario,salarioFuncionario) VALUES ('Mariana',15,'29/03/2026',1621)

INSERT INTO tbCliente(nomeCliente,idadeCliente)	VALUES ('Girotto',16),('Davi',21),('Cristian',19),('Andre',18),('Gabriel',17)

INSERT INTO tbVendedor(nomeVendedor) VALUES ('João Santana'),('Raquel Torres.')

--DBCC CHECKIDENT ('tbVendedor', RESEED, 0) --REINICIAR ID


INSERT INTO tbProduto(nomeProduto,precoProduto,dataEntradaProduto,codFuncionario,codFabricante) VALUES 
	('Camisa Polo',80,'06/03/2026',1,1) -- malwee
	('Camiseta Social',90,'06/03/2026',2,1),
	('Calça Jeans Feminina',80,'06/03/2026',3,1),

	('Calça Social Masculina',90,'08/03/2026',3,2), -- marisol
	('Calça Jeans Masculina',80,'09/03/2026',2,2),
	('Bermuda Masculina',75,'09/03/2026',1,2),

	('Camiseta Feminina',90,'08/03/2026',3,3), -- Cia da Malha
	('Vestido Feminino',80,'07/03/2026',1,3),
	('Bermuda de Praia',75,'08/03/2026',1,3)

INSERT INTO tbVenda(dataVenda, codCliente, codVendedor, totalVenda) VALUES 
    ('2026-03-29', 1, 1, 160.00),
    ('2026-03-29', 2, 2, 170.00),
    ('2026-03-29', 3, 1, 155.00),
    ('2026-03-29', 4, 2, 170.00),
    ('2026-03-29', 5, 1, 155.00)

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensItensVenda, subTotalItensVenda) VALUES
    (1, 1, 1, 80.00), (1, 3, 1, 80.00), 
    (2, 2, 1, 90.00), (2, 5, 1, 80.00), 
    (3, 6, 1, 75.00), (3, 8, 1, 80.00), 
    (4, 4, 1, 90.00), (4, 5, 1, 80.00), 
    (5, 9, 1, 75.00), (5, 8, 1, 80.00)  




UPDATE tbFabricante
SET nomeFabricante = 'Turma da Malha' WHERE codFabricante = 3 -- primeiro exercicio

UPDATE tbVenda
SET totalVenda = totalVenda * 0.90 WHERE codCliente = 1 -- segundo exercicio

UPDATE tbProduto
SET precoProduto = precoProduto * 1.20 WHERE codFabricante = 2 --terceiro exercicio


UPDATE tbItensVenda 
SET quantidadeItensItensVenda = quantidadeItensItensVenda - 10 WHERE codProduto = 3 --quarto exercico


DELETE FROM tbItensVenda WHERE codItensVenda = 2 --quinto exercicio


DELETE FROM tbItensVenda WHERE codVenda = 3 -- sexto exrcicio


DELETE FROM tbFabricante WHERE codFabricante = 1  -- setimo exrcicio




--resposta exercico 7

--Não foi possível remover o fabricante de código 1, ocorreu um erro de conflito de restrição de chave estrangeira
--Isso acontece porque existem produtos na tabela 'tbProduto' que dependem desse fabricante. 



