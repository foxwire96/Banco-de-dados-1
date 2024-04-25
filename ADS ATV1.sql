CREATE TABLE AUTOR (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(80),
    CPF CHAR(11) UNIQUE,
    Endereco VARCHAR(80),
    DataNasc DATE,
    Nacionalidade VARCHAR(30)
);

CREATE TABLE EDITORA (
    Editora INT PRIMARY KEY,
    Nome VARCHAR(80)
);

CREATE TABLE LIVRO (
    Codigo INT PRIMARY KEY,
    Titulo VARCHAR(80) NOT NULL,
    Preco NUMERIC,
    Lancamento DATE,
    Assunto VARCHAR(50),
    CodEditora INT,
    FOREIGN KEY (CodEditora) REFERENCES EDITORA(Editora)
);

CREATE TABLE AUTOR_LIVRO (
    CodLivro INT,
    CodAutor INT
    FOREIGN KEY (CodLivro) REFERENCES LIVRO(Codigo),
    FOREIGN KEY (CodAutor) REFERENCES AUTOR(Matricula)
);

ALTER TABLE LIVRO
ADD Edicao INT CHECK (Edicao < 20);

ALTER TABLE LIVRO
DROP COLUMN Edicao;

DROP TABLE EDITORA;

CREATE TABLE EDITORA (
    Editora INT PRIMARY KEY,
    Nome VARCHAR(80),
    Edicao INT
);

UPDATE LIVRO SET Preco = Preco * 1.10 WHERE Assunto = 'Medicina';


INSERT INTO AUTOR (Matricula, Nome, CPF, Endereco, DataNasc, Nacionalidade) VALUES
(911, 'Roberto', '12345678901', 'Rua A num 1', '1966-09-18', 'Brasileira'),
(922, 'Simone', '22345678901', 'Rua B num 1', '1976-08-08', 'Brasileira'),
(933, 'Fernando', '32345678901', 'Rua C num 1', '1996-07-13', 'Brasileira'),
(954, 'Felipe', '42345678901', 'Rua D num 1', '1967-02-28', 'Brasileira'),
(965, 'Fabio', '52345678901', 'Rua E num 1', '1988-03-08', 'Brasileira'),
(976, 'Fernanda', '62345678901', 'Rua E num 1', '1988-03-08', 'Brasileira'),
(997, 'Julio', '22345678901', 'Rua E num 1', '1988-03-08', 'Brasileira'),
(1001, 'Dario', '21345678901', 'Rua E num 1', '1998-03-08', 'Brasileira');

INSERT INTO EDITORA (Editora, Nome, Edicao) VALUES
(001, 'Addison', 1),
(002, 'Globo', 1),
(003, 'Pearson', 2),
(004, 'Abril', 10);

INSERT INTO LIVRO (Codigo, Titulo, Preco, Lancamento, Assunto, CodEditora) VALUES
(100, 'Sistemas de Banco de Dados', 99.00, '2015-01-01', 'Informática', 003),
(200, 'Rede de Computadores', 199.00, '2002-05-01', 'Informática', 003),
(300, 'Corpo Humano', 89.00, '2011-09-01', 'Medicina', 004),
(400, 'Leis da Física', 95.00, '2015-10-01', 'Ciência', 002),
(500, 'Física Quântica', 95.00, '2015-10-01', 'Ciência', 005),
(600, 'O Coração', 289.00, '1999-09-01', 'Medicina', 004);

INSERT INTO AUTOR_LIVRO (CodLivro, CodAutor) VALUES
(100, 911),
(600, 965),
(100, 954),
(200, 933),
(200, 911),
(300, 922),
(400, 976),
(500, 976),
(300, 965);


SELECT * FROM AUTOR
SELECT * FROM EDITORA
SELECT * FROM LIVRO
SELECT * FROM AUTOR_LIVRO

