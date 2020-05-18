
-- CREATE SCHEMA projeto;
GO



DROP TABLE IF EXISTS Pessoa
DROP TABLE IF EXISTS Toca1
DROP TABLE IF EXISTS Toca2
DROP TABLE IF EXISTS Instrumento
DROP TABLE IF EXISTS Tem
DROP TABLE IF EXISTS Participa1
DROP TABLE IF EXISTS Participa2
DROP TABLE IF EXISTS Grupo
DROP TABLE IF EXISTS Disciplina
DROP TABLE IF EXISTS Turma
DROP TABLE IF EXISTS Pertence1
DROP TABLE IF EXISTS Pertence2
DROP TABLE IF EXISTS Direcao
DROP TABLE IF EXISTS Login
DROP TABLE IF EXISTS Request
DROP TABLE IF EXISTS Evento
DROP TABLE IF EXISTS Aluno
DROP TABLE IF EXISTS Professor



CREATE TABLE Pessoa (
	PESSOA_Codigo		INT IDENTITY(1,1)	NOT NULL,
	Data_Nasc			DATE				NOT NULL,
	Telemovel			VARCHAR(15),
	Nome				VARCHAR(50)			NOT NULL,
	Sexo				CHAR(1)				NOT NULL,
	NIF					INT					NOT NULL,
	Email				VARCHAR(100)		NOT NULL,
	Morada				VARCHAR(200)		NOT NULL,
	PRIMARY KEY(PESSOA_Codigo),
	CHECK(PESSOA_Codigo > 0)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Toca1(
	INSTRUMENTO_Nome	VARCHAR(30)		 NOT NULL,
	ALUNO_Codigo		INT NOT NULL,
	PRIMARY KEY(INSTRUMENTO_Nome, ALUNO_Codigo )
)



---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE Toca2(
	INSTRUMENTO_Nome	VARCHAR(30)		 NOT NULL,
	PROFESSOR_Codigo	INT NOT NULL,
	PRIMARY KEY(INSTRUMENTO_Nome, PROFESSOR_Codigo)
)

---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE Instrumento (
	INSTRUMENTO_Nome	VARCHAR(30) NOT NULL, 
	INSTRUMENTO_Tipo	VARCHAR(30),
	PRIMARY KEY(INSTRUMENTO_Nome)
	
)


---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE Disciplina (
	ID					INT         NOT NULL,
	Nome				VARCHAR(30) NOT NULL,
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(ID)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Participa1 (
	Representante		VARCHAR(30) NOT NULL,
	ALUNO_CODIGO		INT,
	PRIMARY KEY(Representante, ALUNO_CODIGO)
	
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Participa2 (
	Representante		VARCHAR(30) NOT NULL,
	PROFESSOR_CODIGO		INT,
	PRIMARY KEY(Representante, PROFESSOR_CODIGO)	
)



---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Grupo (
	Representante		VARCHAR(30),
	GRUPO_Tipo			VARCHAR(30),
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(Representante)
	
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Turma (
	Numero				INT NOT NULL,
	Capacidade			INT NOT NULL,
	DISCILINA_ID		INT,
	PRIMARY KEY(Numero,DISCILINA_ID),
	CHECK(Numero > 0),
	CHECK(Capacidade > 0)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Pertence1 (
	CODIGO_Funcionario	INT,
	Ano					DATE,
	Cargo				VARCHAR(30),
	PRIMARY KEY(Cargo, CODIGO_Funcionario)
	
)


---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE Pertence2 (
	CODIGO_Professor	INT,
	Ano					DATE,
	Cargo				VARCHAR(30),
	PRIMARY KEY(Cargo, CODIGO_Professor)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Direcao (
	Cargo				VARCHAR(30)	NOT NULL,
	Ano					DATE		NOT NULL,
	PRIMARY KEY(Cargo)

)


	
---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Login (
	Utilizador			VARCHAR(30) NOT NULL,
	PasswordHash		VARCHAR(30)	NOT NULL,
	PRIMARY KEY(Utilizador)
)




---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Request (
	Ano					DATE,	
	PROFESSOR_Codigo	INT,
	Aceite				BIT NOT NULL ,
	PRIMARY KEY(Aceite, Ano, PROFESSOR_Codigo)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Evento (
	EVENTO_Nome			VARCHAR(30),
	Local				VARCHAR(30)	NOT NULL,
	EVENTO_Data			DATE,
	Caracteristica		VARCHAR(30) NOT NULL,
	EVENTO_Ano			DATE,
	Aceite				BIT			NOT NULL,
	PRIMARY KEY(EVENTO_Nome)

)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Aluno (
	ALUNO_Codigo		INT NOT NULL,
	Mensalidade			INT NOT NULL,
	TURMA_Numero		INT,
	TURMA_ID			INT,
	PRIMARY KEY(ALUNO_Codigo),
	CHECK(Mensalidade > 20)
)



---------------------------------------------------------
---------------------------------------------------------
CREATE TABLE Participa1 (
	Representante		VARCHAR(30) NOT NULL,
	ALUNO_CODIGO		INT,
	PRIMARY KEY(Representante, ALUNO_CODIGO)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Participa2 (
	Representante		VARCHAR(30) NOT NULL,
	PROFESSOR_CODIGO		INT,
	PRIMARY KEY(Representante, PROFESSOR_CODIGO)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Tem (
	ALUNO_Codigo		INT,
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(ALUNO_Codigo, PROFESSOR_Codigo)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Professor (
	Salario				INT			NOT NULL,
	PROFESSOR_Codigo		INT,
	DISCIPLINA_ID		INT,
	DIRECAO_Cargo		VARCHAR(30),
	DIRECAO_Codigo		INT,
	PRIMARY KEY(PROFESSOR_Codigo),
	CHECK(Salario > 350)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE Funcionario (
	Salario				INT			NOT NULL,
	FUNCIONARIO_Codigo		INT,
	LOGIN_Utilizador	VARCHAR(30),
	PRIMARY KEY(FUNCIONARIO_Codigo)
)


ALTER TABLE Toca1 ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES Instrumento(INSTRUMENTO_Nome)
ALTER TABLE Toca1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Aluno(ALUNO_Codigo)
ALTER TABLE Toca2 ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES Instrumento(INSTRUMENTO_Nome)
ALTER TABLE Toca2 ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Aluno(PROFESSOR_Codigo)
ALTER TABLE Instrumento ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES Toca1(INSTRUMENTO_Nome)
ALTER TABLE Instrumento ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES Toca2(INSTRUMENTO_Nome)
ALTER TABLE Participa1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Aluno(ALUNO_Codigo)
ALTER TABLE Participa1 ADD FOREIGN KEY(Representante) REFERENCES Grupo(Representante)
ALTER TABLE Participa2 ADD FOREIGN KEY(PROFESSOR_CODIGO) REFERENCES Aluno(PROFESSOR_Codigo)
ALTER TABLE Participa2 ADD FOREIGN KEY(Representante) REFERENCES Grupo(Representante)
ALTER TABLE Grupo ADD FOREIGN KEY(Representante) REFERENCES Participa1(Representante)
ALTER TABLE Grupo ADD FOREIGN KEY(Representante) REFERENCES Participa2(Representante)
ALTER TABLE Turma ADD FOREIGN KEY(DISCILINA_ID) REFERENCES Disciplina(ID)
ALTER TABLE Pertence1 ADD FOREIGN KEY(Cargo) REFERENCES Direcao(Cargo)
ALTER TABLE Pertence1 ADD FOREIGN KEY(CODIGO_Funcionario) REFERENCES Funcionario(CODIGO_Funcionario)
ALTER TABLE Pertence2 ADD FOREIGN KEY(Cargo) REFERENCES Direcao(Cargo)
ALTER TABLE Pertence2 ADD FOREIGN KEY(CODIGO_Professor) REFERENCES Funcionario(CODIGO_Professor)
ALTER TABLE Direcao ADD FOREIGN KEY(Cargo) REFERENCES Pertence1(Cargo)
ALTER TABLE Direcao ADD FOREIGN KEY(Cargo) REFERENCES Pertence2(Cargo)
ALTER TABLE Evento ADD FOREIGN KEY(EVENTO_Ano) REFERENCES Direcao(Ano)
ALTER TABLE Evento ADD  FOREIGN KEY(Aceite) REFERENCES Request(Aceite)
ALTER TABLE Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Pessoa(PESSOA_Codigo)
ALTER TABLE Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Tem(ALUNO_Codigo)
ALTER TABLE Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Toca1(ALUNO_Codigo)
ALTER TABLE Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Participa1(ALUNO_Codigo)
ALTER TABLE Aluno ADD FOREIGN KEY(TURMA_Numero) REFERENCES Turma(Numero)
ALTER TABLE Aluno ADD FOREIGN KEY(TURMA_ID) REFERENCES Turma(DISCILINA_ID)
ALTER TABLE Participa1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Aluno(ALUNO_Codigo)
ALTER TABLE Participa1 ADD FOREIGN KEY(Representante) REFERENCES Grupo(Representante)
ALTER TABLE Participa2 ADD FOREIGN KEY(PROFESSOR_CODIGO) REFERENCES Aluno(PROFESSOR_Codigo)
ALTER TABLE Participa2 ADD FOREIGN KEY(Representante) REFERENCES Grupo(Representante)
ALTER TABLE Tem ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES Aluno(ALUNO_Codigo)
ALTER TABLE Tem ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Aluno(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Pessoa(PESSOA_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Pertence2(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Tem(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Disciplina(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Participa2(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Toca2(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Request(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES Grupo(PROFESSOR_Codigo)
ALTER TABLE Professor ADD FOREIGN KEY(DISCIPLINA_ID) REFERENCES Disciplina(ID)
ALTER TABLE Professor ADD FOREIGN KEY(DIRECAO_Cargo) REFERENCES Direcao(Cargo)
ALTER TABLE Funcionario ADD FOREIGN KEY(FUNCIONARIO_Codigo) REFERENCES Pertence1(FUNCIONARIO_Codigo)
ALTER TABLE Funcionario ADD FOREIGN KEY(FUNCIONARIO_Codigo) REFERENCES Pessoa(PESSOA_Codigo)
ALTER TABLE Funcionario ADD FOREIGN KEY(LOGIN_Utilizador) REFERENCES Login(Utilizador)

GO







