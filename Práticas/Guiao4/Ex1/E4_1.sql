CREATE SCHEMA E4_1;
GO

DROP TABLE IF EXISTS E4_1.Cliente
CREATE TABLE E4_1.Cliente(
	nome			VARCHAR(15)	NOT NULL,
	endereço		VARCHAR(30) NOT NULL,
	num_Carta		INT UNIQUE NOT NULL ,
	NIF				INT,
	PRIMARY KEY(NIF), 
	CHECK(num_carta > 0),
	CHECK(NIF > 0)
);


DROP TABLE IF EXISTS E4_1.Balcao
CREATE TABLE E4_1.Balcao(
	nome			VARCHAR(15) NOT NULL,
	numero			INT	IDENTITY(1,1),
	endereço		VARCHAR(20) NOT NULL,
	PRIMARY KEY(numero),
	CHECK(numero >= 0)
);


DROP TABLE IF EXISTS E4_1.Aluguer
CREATE TABLE E4_1.Aluguer(
	numero_A		INT	IDENTITY(1,1)	NOT NULL,
	duracao			INT					NOT NULL,
	data_A			DATE				NOT NULL,
	nif_C			INT					NOT NULL,
	numero_B		INT					NOT NULL,
	matricula_V		VARCHAR(6)			NOT NULL,
	PRIMARY KEY(numero_A),
	FOREIGN KEY(nif_C)			REFERENCES E4_1.Cliente(NIF),
	FOREIGN KEY(numero_B)		REFERENCES E4_1.Balcao(numero),
	FOREIGN KEY(matricula_V)	REFERENCES E4_1.Veiculo(matricula),
	CHECK(numero_A >= 0),
	CHECK(nif_C >= 0),
	CHECK(numero_B >= 0)
);

DROP TABLE IF EXISTS E4_1.Veiculo
CREATE TABLE E4_1.Veiculo(
	matricula		VARCHAR(6)			NOT NULL,
	ano				INT					NOT NULL,
	marca			CHAR(15)			NOT NULL,
	codigo_TV		INT,
	PRIMARY KEY(matricula),
	FOREIGN KEY(codigo_TV)			REFERENCES E4_1.Tipo_Veiculo(codigo)
);



DROP TABLE IF EXISTS E4_1.Tipo_Veiculo
CREATE TABLE E4_1.Tipo_Veiculo(
	designacao		VARCHAR(15)	NOT NULL,
	arCondicionado	BIT			NOT NULL,
	codigo			INT NOT NULL,
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS E4_1.Ligeiro
CREATE TABLE E4_1.Ligeiro(
	num_Lugares		INT				NOT NULL,
	portas			INT				NOT NULL,
	combustivel		VARCHAR(15),
	codigo_TV1		INT				NOT NULL,
	PRIMARY KEY(codigo_TV1),
	FOREIGN KEY(codigo_TV1)		REFERENCES	E4_1.Tipo_Veiculo(codigo),
	CHECK(num_Lugares BETWEEN 2 and 5),
	CHECK(portas BETWEEN 1 and 5),
	CHECK(codigo_TV1 >= 0)
);

DROP TABLE IF EXISTS E4_1.Pesado
CREATE TABLE E4_1.Pesado(
	peso			INT,
	passageiros		INT,
	codigo_TV2		INT,
	PRIMARY KEY(codigo_TV2),
	FOREIGN KEY(codigo_TV2) REFERENCES E4_1.Tipo_Veiculo(codigo),
	CHECK(passageiros BETWEEN 2 and 9)
);


