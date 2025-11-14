CREATE DATABASE bdMercado
GO
USE bdMercado

CREATE TABLE tbProduto(
, idProduto INT PRIMARY KEY IDENTITY(1,1)
, nomeProduto VARCHAR(50)
, precoCustoProduto VARCHAR (10)
, marcaProduto VARCHAR (50)
, corProduto VARCHAR (25)
, unidadeMedidaProduto VARCHAR (30)
, idCategoria INT FOREIGN KEY REFERENCES tbCategoria (idCategoria)
, statusProduto VARCHAR (30)
, precoVendaProduto VARCHAR (10)
, codigoBarraProduto VARCHAR (13)
, dataCadastroProduto DATE
)

CREATE TABLE tbCategoria(
, idCategoria INT PRIMARY KEY IDENTITY(1,1)
, nomeCategoria VARCHAR (50)
, descCategoria VARCHAR (100)
)

CREATE TABLE tbEstoque(
,idEstoque INT PRIMARY KEY IDENTITY(1,1)
,idProduto INT FOREIGN KEY REFERENCES tbProduto (idProduto)
,qtdEstoque VARCHAR(15)
,descEstoque VARCHAR(100)
)


CREATE TABLE tbCliente(
, idCliente INT PRIMARY KEY IDENTITY(1,1)
, nomeCliente VARCHAR (50)
, cpfCliente VARCHAR (11) UNIQUE
, lograCliente VARCHAR (50)
, ruaCliente VARCHAR (50)
, bairoCliente VARCHAR (20)
, cepCliente VARCHAR (8)
, numCliente VARCHAR (6)
, ufCliente CHAR (2)
, cidadeCliente VARCHAR (15)
, dataCadastroCliente DATE 
)



CREATE TABLE tbFoneCliente(
, idFoneCliente INT PRIMARY KEY IDENTITY(1,1)
, idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
, numFoneClient CHAR(9)
)




CREATE TABLE tbCartao(
, idCartao INT PRIMARY KEY IDENTITY(1,1)
, idCliente  INT FOREIGN KEY REFERENCES tbCliente (idCliente)
, quantPontoCartao VARCHAR (6)
)

CREATE TABLE tbPagamento(
, idPagamento  INT PRIMARY KEY IDENTITY(1,1)
, idVenda INT FOREIGN KEY REFERENCES tbVenda (idVenda)
, valorPagoPagamento VARCHAR (10)
, trocoPagamento VARCHAR (10)
, dataPagamento DATE
)

CREATE TABLE tbFornecedor(
,idFornecedor INT PRIMARY KEY IDENTITY(1,1)
,nomeFornecedor VARCHAR(50)
,cnpjFornecedor VARCHAR(14) UNIQUE 
,lograFornecedor VARCHAR(50)
,cepFornecedor VARCHAR(8)
,ruaFornecedor VARCHAR(50)
,bairroFornecedor VARCHAR(50)
,ufFornecedor CHAR(2)
,cidadeFornecedor VARCHAR(50)
,emailFornecedor VARCHAR(50)
)

CREATE TABLE tbFoneFornecedor(
,idFoneFornecedor INT PRIMARY KEY IDENTITY(1,1)
,numFoneFornecedor CHAR(9)
,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (idFornecedor)
)

CREATE TABLE tbSede(
,idSede INT PRIMARY KEY IDENTITY(1,1)
,nomeSede VARCHAR(50)
,lograSede VARCHAR(50)
)

CREATE TABLE tbFuncionario(
,idFuncionario INT PRIMARY KEY IDENTITY(1,1)
,nomeFuncionario VARCHAR(50)
,salarioFuncionario VARCHAR(15) --não sei se está correta essa parte...
,cpfFuncionario VARCHAR(11)
,lograFuncionario VARCHAR(50)
,ruaFuncionario VARCHAR(50)
,bairroFuncionario VARCHAR(50)
,cepFuncionario VARCHAR(50)
,ufFuncionario CHAR(2)
,numFuncionario CHAR(9)
,dataRegistroFuncionario DATE
,statusFuncinario VARCHAR (50)
,periodoFuncionario VARCHAR (30)
)

CREATE TABLE tbCargo(
,idCargo INT PRIMARY KEY IDENTITY(1,1)
,descCargo
,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (idFuncionario)
)

CREATE TABLE tbFoneFuncionario(
,idFoneFuncionario INT PRIMARY KEY IDENTITY(1,1)
,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (idFuncionario)
,numFoneFuncionario CHAR(9)
)

CREATE TABLE tbPontoFuncionario(
,idPontoFuncionario INT PRIMARY KEY IDENTITY(1,1)
,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (idFuncionario)
,dataPontoFuncionario DATE
,horaEntradaPontoFuncionario DATETIME
,horaSaidaPontoFuncionario DATETIME
,almocoInicioPontoFuncionario DATETIME
,almocoFimPontoFuncionario DATETIME
)

CREATE TABLE tbDependentes(
,idDependentes INT PRIMARY KEY IDENTITY(1,1)
,nomeDependentes VARCHAR(50)
,dataNascDependentes DATE
,cpfDependentes VARCHAR(11)
,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (idFuncionario)
)

CREATE TABLE tbVendas(
,idVendas INT PRIMARY KEY IDENTITY(1,1)
,idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario (idFuncionario)
,dataVendas DATE
,valorTotalVendas VARCHAR(15)
,descontoVendas VARCHAR(15)
,statusVendas VARCHAR(30)
)

CREATE TABLE tbVendaProduto(
,idVendaProduto INT PRIMARY KEY IDENTITY(1,1)
,idVendas INT FOREIGN KEY REFERENCES tbVendas (idVendas)
,precoUnitarioProduto VARCHAR(15)
,idProduto INT FOREIGN KEY REFERENCES tbProduto (idProduto)
,qtdVendaProduto VARCHAR(15)
)

CREATE TABLE tbTipoVenda(
,idTipoVenda INT PRIMARY KEY IDENTITY(1,1)
,nomeTipoVenda VARCHAR (50)
,descTipoVenda VARCHAR(100)
,idVendas INT FOREIGN KEY REFERENCES tbVendas (idVendas)
)




