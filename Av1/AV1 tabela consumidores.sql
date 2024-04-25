CREATE TABLE CONSUMIDORES(
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(80),
    Cidade VARCHAR(15),
    Estado CHAR(2)
);

CREATE TABLE REVENDEDORAS(
    CNPJ CHAR(14) PRIMARY KEY,
    nome VARCHAR(80),
    Cidade VARCHAR(15),
    Estado CHAR(2)
);

CREATE TABLE NEG�CIOS(
    CNPJ CHAR(14),
    CPF CHAR(11),
    Autom�vel VARCHAR(15),
    DataCompra DATE,
    Pre�o NUMERIC,
    PRIMARY KEY (CPF, CNPJ),
    FOREIGN KEY (CPF) REFERENCES CONSUMIDORES(CPF),
    FOREIGN KEY (CNPJ) REFERENCES REVENDEDORAS(CNPJ)
);


INSERT INTO CONSUMIDORES (CPF, nome, Cidade, Estado)
VALUES ('12345678901', 'Roberto', 'Rio de Janeiro', 'RJ'),
       ('11145678901', 'Ana', 'Niter�i', 'RJ'),
       ('13345678901', 'Ricardo', 'Rio de Janeiro', 'RJ'),
       ('12245678901', 'Rachel', 'Niter�i', 'RJ'),
       ('16645678901', 'Ninho', 'Niter�i', 'RJ');

INSERT INTO REVENDEDORAS (CNPJ, nome, Cidade, Estado)
VALUES ('12345678901234', 'Loja Bob Auto', 'Rio de Janeiro', 'RJ'),
       ('44445678904444', 'Loja Senac Auto', 'Niter�i', 'RJ');

INSERT INTO NEG�CIOS (CPF, CNPJ, Autom�vel, DataCompra, Pre�o)
VALUES ('12345678901', '12345678901234', 'Honda FIT', '2023-01-10', 80000),
       ('13345678901', '12345678901234', 'Honda CIVIC', '2023-03-10', 100000),
       ('12245678901', '44445678904444', 'Honda CRV', '2023-04-10', 130000),
       ('16645678901', '44445678904444', 'Toyota Corolla', '2023-01-15', 85000);


UPDATE NEG�CIOS SET Pre�o = 90000 WHERE CPF = '12345678901' AND CNPJ = '12345678901234';

DELETE FROM CONSUMIDORES WHERE nome = 'Ana';

UPDATE REVENDEDORAS SET nome = 'Loja Senac Auto' WHERE nome = 'Loja SenacAuto';

SELECT * FROM CONSUMIDORES

SELECT * FROM NEG�CIOS

SELECT * FROM REVENDEDORAS