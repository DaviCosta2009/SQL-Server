CREATE DATABASE bdEstoque
GO

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente VARCHAR(50),
	cpfCliente VARCHAR (11) UNIQUE,
	emailCliente VARCHAR(150),
	sexoCliente VARCHAR(20),
	dataNascimentoCliente DATE,

)

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY(1,1),
	dataVenda DATE,
	valorTotalVenda DECIMAL(8,2),
	codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
)

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1,1),
	nomeFabricante VARCHAR(70),
)

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY(1,1),
	nomeFornecedor VARCHAR(70),
	contatoFornecedor VARCHAR(100),
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1),
	descricaoProduto VARCHAR(250),
	valorProduto DECIMAL(8,2),
	quantidadeProduto INT,
	codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante),
	codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (codFornecedor),
)

CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1,1),
	codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda),
	codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto),
	quantidadeItensVenda INT,
	subTotalItensVenda DECIMAL (8,2),
)

--inserindo dados

--SELECT * FROM tbCliente

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Armando José Santana', '12345678900', 'armandojsantana@outlook.com','m','1961-02-21')

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com','f','1978-09-13')

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com','m','1981-09-03')

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com','f','1962-07-07')

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com','f','1977-04-09')

--INSERT INTO tbCliente(nomeCliente,cpfCliente,emailCliente,sexoCliente,dataNascimentoCliente) VALUES ('Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com','m','1987-02-02')


--SELECT * FROM tbFabricante

--INSERT INTO tbFabricante (nomeFabricante) VALUES ('Unilever')

--INSERT INTO tbFabricante (nomeFabricante) VALUES ('P&G')

--INSERT INTO tbFabricante (nomeFabricante) VALUES ('Bunge')


--SELECT * FROM tbFornecedor

--INSERT INTO tbFornecedor (nomeFornecedor,contatoFornecedor) VALUES ('Atacadão','Carlos Santos')

--INSERT INTO tbFornecedor (nomeFornecedor,contatoFornecedor) VALUES ('Assai','Maria Stella')

--INSERT INTO tbFornecedor (nomeFornecedor,contatoFornecedor) VALUES ('Roldão','Paulo César')


--SELECT * FROM tbProduto

--DBCC CHECKIDENT ('tbProduto', RESEED, 0) --REINICIAR ID

--DELETE FROM tbProduto where codProduto = 1

--ALTER TABLE tbProduto ADD quantidadeProduto INT;

--ALTER TABLE tbProduto ALTER COLUMN valorProduto DECIMAL(8, 2)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Amaciante Downy',5.76,1500,2,1)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Amaciante Comfort',5.45,2300,1,1)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Sabão em pó OMO',5.99,1280,1,2)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Margarina Qually',4.76,2500,3,1)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Salsicha Hot Dog Sadia',6.78,2900,3,2)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Mortadela Perdigão',2.50,1200,3,3)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Hamburguer Sadia',9.89,1600,3,1)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Fralda Pampers',36,340,2,3)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Xampu',5.89,800,1,2)

--INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor) VALUES ('Condicionador Seda',6.50,700,1,3)


--SELECT * FROM tbVenda

--ALTER TABLE tbVenda ALTER COLUMN valorTotalVenda DECIMAL(8, 2)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('01/02/2014',4500,1)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('03/02/2014',3400,1)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('10/02/2014',2100,2)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('15/02/2014',2700,3)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('17/03/2014',560,3)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('09/04/2014',1200,4)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('07/05/2014',3500,5)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('07/05/2014',3400,1)

--INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente) VALUES ('05/05/2014',4000,2)

--UPDATE tbVenda
--SET dataVenda = '07/05/2014' WHERE codVenda = 8 


--SELECT * FROM tbItensVenda


--ALTER TABLE tbItensVenda ALTER COLUMN subTotalItensVenda DECIMAL(8, 2)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (1,1,200,1500)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (1,2,300,3000)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (2,4,120,1400)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (2,2,200,1000)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (2,3,130,1000)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (3,5,200,2100)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (4,4,120,1000)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (4,5,450,700)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (5,5,200,560)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (6,7,200,600)

--INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda) VALUES (6,6,300,600)


