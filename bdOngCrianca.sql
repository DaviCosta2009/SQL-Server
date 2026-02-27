--CRIANDO BANCO DE DADOS E TABELAS
CREATE DATABASE bdOngCrianca
GO

USE bdOngCrianca

CREATE TABLE tbStatusCrianca(
	idStatusCrianca INT PRIMARY KEY IDENTITY(1,1),
	descricaoStatus VARCHAR(30) NOT NULL
	)
CREATE TABLE tbSexo(
	idSexo INT PRIMARY KEY IDENTITY(1,1),
	descricaoSexo VARCHAR(40)
	)
CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY(1,1),
	nomeCrianca VARCHAR(60) NOT NULL,
	dtNascCrianca SMALLDATETIME,
	idStatusCrianca INT FOREIGN KEY 
		REFERENCES tbStatusCrianca(idStatusCrianca),
	idSexo INT FOREIGN KEY 
		REFERENCES tbSexo(idSexo)
)

CREATE TABLE tbDoenca(
	codDoenca INT PRIMARY KEY IDENTITY(1,1),
	nomeDoenca VARCHAR(50),
	cid VARCHAR(10)
	
)

CREATE TABLE tbProntuario(
	idProntuario INT PRIMARY KEY IDENTITY(1,1),
	dataAbertura SMALLDATETIME,
	idCrianca INT FOREIGN KEY
		REFERENCES tbCrianca(idCrianca) UNIQUE,
	
	obsProunturario VARCHAR(300)
)

CREATE TABLE tbProntuarioDoenca(
    idProntuarioDoenca INT PRIMARY KEY IDENTITY(1,1),
    idProntuario INT FOREIGN KEY REFERENCES tbProntuario(idProntuario),
    codDoenca INT FOREIGN KEY REFERENCES tbDoenca(codDoenca),
    dataAcometimento DATE
)

CREATE TABLE tbGenitor(
	codGenitor INT PRIMARY KEY IDENTITY(1,1),
	nomeGenitor VARCHAR(100),
	cpfGenitor CHAR(14)
)

CREATE TABLE tbFiliacao(
	codFiliacao INT PRIMARY KEY IDENTITY(1,1),
	codCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca),
	codGenitor INT FOREIGN KEY REFERENCES tbGenitor(codGenitor)
)

CREATE TABLE tbPadrinho(
	codPadrinhho INT PRIMARY KEY IDENTITY(1,1),
	nomePadrinho VARCHAR(100),
	cpfPadrinho CHAR(14)
)

CREATE TABLE tbApadrinhamento(
	codApadrinhamento INT PRIMARY KEY IDENTITY(1,1),
	codPadrinho INT FOREIGN KEY REFERENCES tbPadrinho(codPadrinhho),
	codCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)

)


SELECT * FROM tbApadrinhamento

INSERT INTO tbStatusCrianca (descricaoStatus) VALUES ('Ativo');

INSERT INTO tbSexo (descricaoSexo) VALUES ('Masculino');

INSERT INTO tbCrianca (nomeCrianca,dtNascCrianca,idSexo,idStatusCrianca) VALUES ('Emenegildo','1945-06-04',1,1)

INSERT INTO tbPadrinho (nomePadrinho,cpfPadrinho) VALUES ('Bianca','36533084315')

INSERT INTO tbApadrinhamento(codPadrinho,codCrianca) VALUES (1,1)

INSERT INTO tbGenitor (nomeGenitor,cpfGenitor) VALUES ('Everina','36597054309')

INSERT INTO tbFiliacao (codCrianca,codGenitor) VALUES (1,1)

INSERT INTO tbProntuario (dataAbertura,idCrianca,obsProunturario) VALUES ('1945-07-08',1,'gripento')

INSERT INTO tbDoenca (nomeDoenca,cid) VALUES ('Gripe','J-11')

INSERT INTO tbProntuarioDoenca (codDoenca,idProntuario,dataAcometimento) VALUES (1,1,'1946-08-15')

--DELETE FROM tbProntuarioDoenca WHERE idProntuarioDoenca IN (1,2,3,4,5,6)

--DBCC CHECKIDENT ('tbProntuarioDoenca', RESEED, 0) --REINICIAR ID
