CREATE DATABASE bdEscola
GO

USE bdEscola

CREATE TABLE tbCurso (
    codCurso INT PRIMARY KEY IDENTITY(1,1),
    nomeCurso VARCHAR(50),
    cargahorariaCurso INT,
    valorCurso DECIMAL(10,2)
)

CREATE TABLE tbAluno (
    codAluno INT PRIMARY KEY IDENTITY(1,1),
    nomeAluno VARCHAR(70),
    dataNascimentoAluno DATE,
    rgAluno VARCHAR(15),
    naturalidadeAluno VARCHAR(40)
)

CREATE TABLE tbTurma (
    codTurma INT PRIMARY KEY IDENTITY(1,1),
    nomeTurma VARCHAR(50),
    codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso),
    horarioTurma TIME
)


CREATE TABLE tbMatricula (
    codMatricula INT PRIMARY KEY IDENTITY(1,1),
    dataMatricula DATE,
    codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno),
    codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)



INSERT INTO tbCurso (nomeCurso, cargahorariaCurso, valorCurso) VALUES 
    ('Inglês', 2000, 356.00),
    ('Alemão', 3000, 478.00)


INSERT INTO tbAluno (nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno) VALUES 
    ('Paulo Santos', '2000-10-03', '82.292.122-0', 'SP'),
    ('Maria da Gloria', '1999-03-10', '45.233.123-0', 'SP'),
    ('Perla Nogueira Silva', '1998-04-04', '23.533.211-9', 'SP'),
    ('Gilson Barros Silva', '1995-09-09', '34.221.111-x', 'PE'),
    ('Mariana Barbosa Santos', '2001-10-10', '54.222.122-9', 'RJ')

INSERT INTO tbTurma (nomeTurma, codCurso, horarioTurma) VALUES 
    ('1IA', 1, '12:00:00'),
    ('1IB', 1, '18:00:00'),
    ('1AA', 2, '19:00:00')

INSERT INTO tbMatricula (dataMatricula, codAluno, codTurma) VALUES 
    ('2015-03-10', 1, 1),
    ('2014-04-05', 2, 1),
    ('2012-03-05', 3, 2),
    ('2016-03-03', 1, 3),
    ('2015-07-05', 4, 2),
    ('2015-05-07', 4, 3),
    ('2015-06-06', 5, 1),
    ('2015-05-05', 5, 3)

SELECT nomeAluno, rgAluno, dataNascimentoAluno FROM tbAluno WHERE naturalidadeAluno = 'SP'

SELECT nomeAluno, rgAluno FROM tbAluno WHERE nomeAluno LIKE 'P%'

SELECT nomeCurso FROM tbCurso WHERE cargahorariaCurso > 2000

SELECT nomeAluno, rgAluno FROM tbAluno WHERE nomeAluno LIKE '%Silva'


SELECT nomeAluno, dataNascimentoAluno FROM tbAluno WHERE MONTH(dataNascimentoAluno) = 3 -- o month serve pra tirar somente o més do aniversário do aluno, mês 3 no caso é o mês de março