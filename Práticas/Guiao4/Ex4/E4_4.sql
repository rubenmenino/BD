
CREATE TABLE Farmacia(
	NIF					INT NOT NULL,	
	nome				VARCHAR(15)	NOT NULL,
	endereço			VARCHAR(30)	NOT NULL,
	telefone			VARCHAR(9),	
	PRIMARY KEY(NIF),
	CHECK(telefone > 0),
	CHECK(NIF > 0)
);

CREATE TABLE Medico(
	numeroID			INT IDENTITY(1,1) NOT NULL,				
	nome				VARCHAR(15)	NOT NULL,
	especialidade		VARCHAR(20),
	PRIMARY KEY(numeroID),
	CHECK(numeroID > 0)
);

CREATE TABLE Prescriçao(
	numeroPrescricao			INT IDENTITY(1,1) NOT NULL,		
	numeroIdentificacaoM		INT NOT NULL,
	NIF_F						INT NOT NULL,
	numeroUtenteP				INT NOT NULL,
	Data_a						DATE,
	PRIMARY KEY(numeroPrescricao),
    FOREIGN KEY(numeroIdentificacaoM)	REFERENCES Medico(numeroID),
    FOREIGN KEY(numeroUtenteP)			REFERENCES Paciente(numeroUtente),
    FOREIGN KEY(NIF_F)					REFERENCES Farmacia(NIF),
	CHECK(numeroPrescricao >= 0),
	CHECK(NIF_F >= 0)
);
CREATE TABLE Paciente(
	numeroUtente		INT	IDENTITY(1,1) NOT NULL,
	nome				VARCHAR(15)	NOT NULL,
	dataNascimento		DATE NOT NULL,	
	endereço			VARCHAR(40),
	PRIMARY KEY(numeroUtente),
	CHECK(numeroUtente >= 0)
);
CREATE TABLE Farmaceutica(
	numeroRegistoNacional	INT IDENTITY(1,1) NOT NULL,
	nome					VARCHAR(15)	NOT NULL,
	endereço				VARCHAR(40)	NOT NULL,
	telefone				DECIMAL(9,0) UNIQUE,
	PRIMARY KEY(numeroRegistoNacional),
	CHECK(numeroRegistoNacional >= 0),
	CHECK(telefone >= 0)
);


CREATE TABLE Farmaco(
	formula					VARCHAR(15)	NOT NULL,	
	nomeComercial			VARCHAR(20) NOT NULL,
	numeroRegistoNacional	INT IDENTITY(1,1) NOT NULL,
	PRIMARY KEY(nomeComercial,numeroRegistoNacional),
	FOREIGN KEY(numeroRegistoNacional) REFERENCES Farmaceutica(numeroRegistoNacional)
);

DROP TABLE IF EXISTS Tem
CREATE TABLE E4_3.Tem (
    numeroPrescricao			INT,
    numeroRegistoNacional       INT,
    nomeComercial				INT NOT NULL,
    PRIMARY KEY(numeroPrescricao, numeroRegistoNacional, nomeComercial),
	FOREIGN KEY(nomeComercial, numeroRegistoNacional) REFERENCES Farmaco(nomeComercial,numeroRegistoNacional),
	FOREIGN KEY(numeroPrescricao) REFERENCES Prescriçao(numeroPrescricao)
);
