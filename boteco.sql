CREATE TABLE VENDA (
	BAR INT PRIMARY KEY, NOT NULL
	MARCA VARCHAR(60), NOT NULL
);

CREATE TABLE GOSTAM (
	PESSOA INT PRIMARY KEY, NOT NULL
	MARCA, NOT NULL
);

alter table VENDA 
add constraint PK_1 primary key (bar,marca) 

alter table GOSTAM 
add constraint PK_2 primary key (pessoa,marca) 

INSERT INTO VENDA VALUES ('BarArroz','Antarctica')
INSERT INTO VENDA VALUES ('BarArroz','Cintra')
INSERT INTO VENDA VALUES ('BarArroz','Belco')
INSERT INTO VENDA VALUES ('Boteco','Bohemia')
INSERT INTO VENDA VALUES ('Boteco','Itaipava')
INSERT INTO VENDA VALUES ('Boteco','Schincariol')
INSERT INTO VENDA VALUES ('Boteco','Kaiser')
INSERT INTO VENDA VALUES ('Boteco','Cerpa')
INSERT INTO VENDA VALUES ('BardoZe','Bavaria')
INSERT INTO VENDA VALUES ('BardoZe','Cerpa')
INSERT INTO VENDA VALUES ('BardoZe','Kaiser')
INSERT INTO VENDA VALUES ('BardoZe','Crystal')
INSERT INTO VENDA VALUES ('Esquina','Crystal')
INSERT INTO VENDA VALUES ('Esquina','Brahma')
INSERT INTO VENDA VALUES ('Esquina','Polar')
INSERT INTO VENDA VALUES ('Boludo','Antarctica')
INSERT INTO VENDA VALUES ('Boludo','Skol')
INSERT INTO VENDA VALUES ('Boludo','Cerpa')

INSERT INTO GOSTAM VALUES ('Carlos','Antarctica')
INSERT INTO GOSTAM VALUES ('Carlos','Brahma')
INSERT INTO GOSTAM VALUES ('Roberto','Bohemia')
INSERT INTO GOSTAM VALUES ('Roberto','Cerpa')
INSERT INTO GOSTAM VALUES ('Andrea','Bavaria')
INSERT INTO GOSTAM VALUES ('Andrea','Cintra')
INSERT INTO GOSTAM VALUES ('Bruno','Polar')
INSERT INTO GOSTAM VALUES ('Fernando','Kaiser')
INSERT INTO GOSTAM VALUES ('Fernando','Schincariol')
INSERT INTO GOSTAM VALUES ('Fernando','Itaipava')
INSERT INTO GOSTAM VALUES ('Carlos','Skol')
INSERT INTO GOSTAM VALUES ('Alex','Crystal')
INSERT INTO GOSTAM VALUES ('Fernando','Belco')
INSERT INTO GOSTAM VALUES ('Bruno','Kaiser')
INSERT INTO GOSTAM VALUES ('Joao','Kaiser')
INSERT INTO GOSTAM VALUES ('Lula','Kaiser')
INSERT INTO GOSTAM VALUES ('Lula','Bohemia')
INSERT INTO GOSTAM VALUES ('Jim','Bohemia')
INSERT INTO GOSTAM VALUES ('Jim','Schincariol')

SELECT * FROM VENDA
SELECT * FROM GOSTAM