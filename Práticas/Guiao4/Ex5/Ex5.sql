--DROP TABLE IF EXISTS E4_5.Artigo_Cientifico
CREATE TABLE Artigo_Cientificoo(
	titulo				VARCHAR(30),
	numeroDeRegisto		INT,
	PRIMARY KEY(numeroDeRegisto),
	CHECK(numeroDeRegisto > 0),
	UNIQUE(titulo)
);

--DROP TABLE IF EXISTS E4_5.Estudante
CREATE TABLE Estudantee(
	comprovativo		VARCHAR(20) NOT NULL,	
	morada				VARCHAR(20),
	dataInsercao		DATE,
	email				VARCHAR(20) NOT NULL,
	FOREIGN KEY(email) REFERENCES Pessoaa(email)
);

--DROP TABLE IF EXISTS E4_5.NaoEstudante
CREATE TABLE NaoEstudantee(
	referenciaTransicaoBancaria	VARCHAR(20) NOT NULL,
	morada						VARCHAR(20),
	dataInsercao				DATE,
	email						VARCHAR(20) NOT NULL,
	FOREIGN KEY(email) REFERENCES Pessoaa(email)
);

--DROP TABLE IF EXISTS E4_5.Autor
CREATE TABLE Autorr(
	email_a		VARCHAR(20) NOT NULL,
	registo		INT,	
	PRIMARY KEY(email_a,registo),
	FOREIGN KEY(email_a) REFERENCES Pessoaa(email),
	FOREIGN KEY(registo) REFERENCES Artigo_Cientificoo(numeroDeRegisto)
);

--DROP TABLE IF EXISTS E4_5.Instituicao
CREATE TABLE Instituicaoo(
	nome		VARCHAR(20) NOT NULL,
	endereco	VARCHAR(20) NOT NULL,
	PRIMARY KEY(nome)
);

--DROP TABLE IF EXISTS E4_5.Pessoa
CREATE TABLE Pessoaa(
	email				VARCHAR(20) NOT NULL,
	nome				VARCHAR(20) NOT NULL,
	instituicao			VARCHAR(20) NOT NULL,
	PRIMARY KEY(email),
	FOREIGN KEY(instituicao) REFERENCES Instituicaoo(nome)
);












































































