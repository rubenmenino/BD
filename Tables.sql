
-- CREATE SCHEMA projeto;
GO



DROP TABLE IF EXISTS projeto.Pessoa
DROP TABLE IF EXISTS projeto.Toca1
DROP TABLE IF EXISTS projeto.Toca2
DROP TABLE IF EXISTS projeto.Instrumento
DROP TABLE IF EXISTS projeto.Tem
DROP TABLE IF EXISTS projeto.Participa1
DROP TABLE IF EXISTS projeto.Participa2
DROP TABLE IF EXISTS projeto.Grupo
DROP TABLE IF EXISTS projeto.Disciplina
DROP TABLE IF EXISTS projeto.Turma
DROP TABLE IF EXISTS projeto.Pertence1
DROP TABLE IF EXISTS projeto.Pertence2
DROP TABLE IF EXISTS projeto.Direcao
DROP TABLE IF EXISTS projeto.Login
DROP TABLE IF EXISTS projeto.Request
DROP TABLE IF EXISTS projeto.Evento
DROP TABLE IF EXISTS projeto.Aluno
DROP TABLE IF EXISTS projeto.Professor



CREATE TABLE projeto.Pessoa (
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

CREATE TABLE projeto.Toca1(
	INSTRUMENTO_Nome	VARCHAR(30)		 NOT NULL,
	ALUNO_Codigo		INT NOT NULL,
	PRIMARY KEY(INSTRUMENTO_Nome, ALUNO_Codigo )
)



---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE projeto.Toca2(
	INSTRUMENTO_Nome	VARCHAR(30)		 NOT NULL,
	PROFESSOR_Codigo	INT NOT NULL,
	PRIMARY KEY(INSTRUMENTO_Nome, PROFESSOR_Codigo)
)

---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE projeto.Instrumento (
	INSTRUMENTO_Nome	VARCHAR(30) NOT NULL, 
	INSTRUMENTO_Tipo	VARCHAR(30),
	PRIMARY KEY(INSTRUMENTO_Nome)
	
)


---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE projeto.Disciplina (
	ID					INT         NOT NULL,
	Nome				VARCHAR(30) NOT NULL,
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(ID)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Participa1 (
	Representante		VARCHAR(30) NOT NULL,
	ALUNO_CODIGO		INT,
	PRIMARY KEY(Representante, ALUNO_CODIGO)
	
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Participa2 (
	Representante		VARCHAR(30) NOT NULL,
	PROFESSOR_CODIGO		INT,
	PRIMARY KEY(Representante, PROFESSOR_CODIGO)	
)



---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Grupo (
	Representante		VARCHAR(30),
	GRUPO_Tipo			VARCHAR(30),
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(Representante)
	
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Turma (
	Numero				INT NOT NULL,
	Capacidade			INT NOT NULL,
	DISCILINA_ID		INT,
	PRIMARY KEY(Numero,DISCILINA_ID),
	CHECK(Numero > 0),
	CHECK(Capacidade > 0)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Pertence1 (
	CODIGO_Funcionario	INT,
	Ano					DATE,
	Cargo				VARCHAR(30),
	PRIMARY KEY(Cargo, CODIGO_Funcionario)
	
)


---------------------------------------------------------
---------------------------------------------------------


CREATE TABLE projeto.Pertence2 (
	CODIGO_Professor	INT,
	Ano					DATE,
	Cargo				VARCHAR(30),
	PRIMARY KEY(Cargo, CODIGO_Professor)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Direcao (
	Cargo				VARCHAR(30)	NOT NULL,
	Ano					DATE		NOT NULL,
	PRIMARY KEY(Cargo)

)


	
---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Login (
	Utilizador			VARCHAR(30) NOT NULL,
	PasswordHash		VARCHAR(30)	NOT NULL,
	PRIMARY KEY(Utilizador)
)




---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Request (
	Ano					DATE,	
	PROFESSOR_Codigo	INT,
	Aceite				BIT NOT NULL ,
	PRIMARY KEY(Aceite, Ano, PROFESSOR_Codigo)
)


---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Evento (
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

CREATE TABLE projeto.Aluno (
	ALUNO_Codigo		INT NOT NULL,
	Mensalidade			INT NOT NULL,
	TURMA_Numero		INT,
	TURMA_ID			INT,
	PRIMARY KEY(ALUNO_Codigo),
	CHECK(Mensalidade > 20)
)



---------------------------------------------------------
---------------------------------------------------------
CREATE TABLE projeto.Participa1 (
	Representante		VARCHAR(30) NOT NULL,
	ALUNO_CODIGO		INT,
	PRIMARY KEY(Representante, ALUNO_CODIGO)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Participa2 (
	Representante		VARCHAR(30) NOT NULL,
	PROFESSOR_CODIGO		INT,
	PRIMARY KEY(Representante, PROFESSOR_CODIGO)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Tem (
	ALUNO_Codigo		INT,
	PROFESSOR_Codigo	INT,
	PRIMARY KEY(ALUNO_Codigo, PROFESSOR_Codigo)

)

---------------------------------------------------------
---------------------------------------------------------

CREATE TABLE projeto.Professor (
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

CREATE TABLE projeto.Funcionario (
	Salario				INT			NOT NULL,
	FUNCIONARIO_Codigo		INT,
	LOGIN_Utilizador	VARCHAR(30),
	PRIMARY KEY(FUNCIONARIO_Codigo)
)







