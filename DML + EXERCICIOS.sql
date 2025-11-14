CREATE DATABASE bdLojaSimples
GO

USE bdLojaSimples
GO

--Tabela Cliente
CREATE TABLE tbCliente (
    idCliente INT PRIMARY KEY IDENTITY(1,1)
    ,nomeCliente VARCHAR(60)
    ,telefoneCliente VARCHAR(15)
);

--Tabela Produto
CREATE TABLE tbProduto (
    idProduto INT  PRIMARY KEY IDENTITY(1,1)
    ,nomeProduto VARCHAR(50)
    ,precoProduto MONEY
    ,estoqueAtual INT
);

--Tabela Caixa
CREATE TABLE tbCaixa (
    idCaixa INT PRIMARY KEY IDENTITY(1,1)
    ,dataAbertura DATE
	,horaAbertura TIME
	,valorAbertura MONEY
	,dataFechamento DATE
	,horaFechamento TIME
	,valorFechamento MONEY
);

--Tabela Venda
CREATE TABLE tbVenda (
    idVenda INT PRIMARY KEY IDENTITY(1,1)
    ,dataVenda DATE
    ,valorTotal MONEY
	,idCliente INT FOREIGN KEY (idCliente) REFERENCES tbCliente(idCliente)
	,idCaixa INT FOREIGN KEY REFERENCES tbCaixa(idCaixa)
    
);

--Tabela ItensVenda
CREATE TABLE tbItensVenda(
	idItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
);

--Tabela Forma de Pagamento
CREATE TABLE tbFormaPagamento(
	idFormaPagamento INT PRIMARY KEY IDENTITY(1,1)
	,descricaoFormaPagamento VARCHAR(40)
);

--Tabela Parcela
CREATE TABLE tbParcela(
	idParcela INT PRIMARY KEY IDENTITY(1,1)
	,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVEnda)
	,idFormaPagamento INT FOREIGN KEY REFERENCES tbFormaPagamento(idFormaPagamento)
);

--INSERT INTO tbCliente(nomeCliente,telefoneCliente) VALUES ('Ricardo Mendes','11944446060')

--INSERT INTO tbProduto(nomeProduto,precoProduto,estoqueAtual) VALUES ('Notebook Dell Inspiron','4200','5')

--INSERT INTO tbCaixa(dataAbertura,horaAbertura,valorAbertura,dataFechamento,horaFechamento,valorFechamento) VALUES ('2025-11-07','08:00','450','2025-11-07','18:20','2800')

--INSERT INTO tbVenda(dataVenda,valorTotal,idCliente,idCaixa) VALUES ('2025-11-06','129.9','7','6')

--INSERT INTO tbItensVenda(idProduto,idVenda) VALUES ('6','6')

--INSERT INTO tbFormaPagamento(descricaoFormaPagamento) VALUES ('Vale Presente')

--INSERT INTO tbParcela(idVenda,idFormaPagamento) VALUES ('7','3')



DELETE FROM tbVenda WHERE idVenda = '2'

--DBCC CHECKIDENT ('tbVenda', RESEED, 0) --REINICIAR ID

SELECT * FROM tbProduto



--A partir daqui são os comandos do exercicio

--Exercicio 1


UPDATE tbCliente
SET telefoneCliente = '11990001111' WHERE idCliente = 1

--Exercicio 2

UPDATE tbProduto
SET nomeProduto = 'Pendrive 64GB Sandisk' WHERE idProduto = 6

--Exercicio 3

DELETE FROM tbProduto WHERE idProduto NOT IN (SELECT idProduto FROM "tbItensVenda") -- olha o id do produto que não está na tabela de itens de venda e deleta ele

--Exercicio 4

UPDATE tbProduto
SET precoProduto = precoProduto * 1.05

--Exercicio 5

UPDATE tbProduto
SET estoqueAtual = estoqueAtual+10 WHERE nomeProduto = 'Cabo HDMI 2m'

--Exercicio 6

DELETE FROM tbFormaPagamento WHERE idFormaPagamento IN (5,6,7) -- DELETA VARIOS DE UMA VEZ

--Exercicio 7

UPDATE tbParcela
SET idFormaPagamento = 4 WHERE idVenda = 3

--Exercicio 8

UPDATE tbVenda
SET valorTotal = 350 WHERE idVenda = 1 

--Exercicio 9

UPDATE tbCaixa
SET horaFechamento = '18:15' WHERE idCaixa = 5

--Exercicio 10

DELETE FROM tbCliente WHERE idCliente = 7  -- exerc. 10 - não da pra deletar essa tabela, da erro pois está em conflito com outra

--Exercicio 11

DELETE FROM tbParcela WHERE idVenda = 2

DELETE FROM tbItensVenda WHERE idVenda =2

DELETE FROM tbVenda WHERE idVenda = 2

--execicio 12

DELETE FROM tbCaixa WHERE idCaixa = 7

--exercicio 13

DELETE FROM tbParcela WHERE idVenda IN (SELECT idVenda FROM tbVenda WHERE "valorTotal"> 3000) -- comando de deletar com outras tabelas e dados inclusos

--exercicio 14

DELETE FROM tbProduto WHERE estoqueAtual = 0

--exercicio 15

DELETE FROM tbCliente WHERE nomeCliente = 'Maria Oliveira'
