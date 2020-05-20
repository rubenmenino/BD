
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
	Sexo				VARCHAR(20)				NOT NULL,
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




ALTER TABLE projeto.Toca1 ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES projeto.Instrumento(INSTRUMENTO_Nome)
ALTER TABLE projeto.Toca1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Aluno(ALUNO_Codigo)
ALTER TABLE projeto.Toca2 ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES projeto.Instrumento(INSTRUMENTO_Nome)
ALTER TABLE projeto.Toca2 ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Aluno(PROFESSOR_Codigo)
ALTER TABLE projeto.Instrumento ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES projeto.Toca1(INSTRUMENTO_Nome)
ALTER TABLE projeto.Instrumento ADD FOREIGN KEY(INSTRUMENTO_Nome) REFERENCES projeto.Toca2(INSTRUMENTO_Nome)
ALTER TABLE projeto.Participa1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Aluno(ALUNO_Codigo)
ALTER TABLE projeto.Participa1 ADD FOREIGN KEY(Representante) REFERENCES projeto.Grupo(Representante)
ALTER TABLE projeto.Participa2 ADD FOREIGN KEY(PROFESSOR_CODIGO) REFERENCES projeto.Aluno(PROFESSOR_Codigo)
ALTER TABLE projeto.Participa2 ADD FOREIGN KEY(Representante) REFERENCES projeto.Grupo(Representante)
ALTER TABLE projeto.Grupo ADD FOREIGN KEY(Representante) REFERENCES projeto.Participa1(Representante)
ALTER TABLE projeto.Grupo ADD FOREIGN KEY(Representante) REFERENCES projeto.Participa2(Representante)
ALTER TABLE projeto.Turma ADD FOREIGN KEY(DISCILINA_ID) REFERENCES projeto.Disciplina(ID)
ALTER TABLE projeto.Pertence1 ADD FOREIGN KEY(Cargo) REFERENCES projeto.Direcao(Cargo)
ALTER TABLE projeto.Pertence1 ADD FOREIGN KEY(CODIGO_Funcionario) REFERENCES projeto.Funcionario(CODIGO_Funcionario)
ALTER TABLE projeto.Pertence2 ADD FOREIGN KEY(Cargo) REFERENCES projeto.Direcao(Cargo)
ALTER TABLE projeto.Pertence2 ADD FOREIGN KEY(CODIGO_Professor) REFERENCES projeto.Funcionario(CODIGO_Professor)
ALTER TABLE projeto.Direcao ADD FOREIGN KEY(Cargo) REFERENCES projeto.Pertence1(Cargo)
ALTER TABLE projeto.Direcao ADD FOREIGN KEY(Cargo) REFERENCES projeto.Pertence2(Cargo)
ALTER TABLE projeto.Evento ADD FOREIGN KEY(EVENTO_Ano) REFERENCES projeto.Direcao(Ano)
ALTER TABLE projeto.Evento ADD  FOREIGN KEY(Aceite) REFERENCES projeto.Request(Aceite)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Pessoa(PESSOA_Codigo)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Tem(ALUNO_Codigo)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Toca1(ALUNO_Codigo)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Participa1(ALUNO_Codigo)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(TURMA_Numero) REFERENCES projeto.Turma(Numero)
ALTER TABLE projeto.Aluno ADD FOREIGN KEY(TURMA_ID) REFERENCES projeto.Turma(DISCILINA_ID)
ALTER TABLE projeto.Participa1 ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Aluno(ALUNO_Codigo)
ALTER TABLE projeto.Participa1 ADD FOREIGN KEY(Representante) REFERENCES projeto.Grupo(Representante)
ALTER TABLE projeto.Participa2 ADD FOREIGN KEY(PROFESSOR_CODIGO) REFERENCES projeto.Aluno(PROFESSOR_Codigo)
ALTER TABLE projeto.Participa2 ADD FOREIGN KEY(Representante) REFERENCES projeto.Grupo(Representante)
ALTER TABLE projeto.Tem ADD FOREIGN KEY(ALUNO_Codigo) REFERENCES projeto.Aluno(ALUNO_Codigo)
ALTER TABLE projeto.Tem ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Aluno(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Pessoa(PESSOA_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Pertence2(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Tem(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Disciplina(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Participa2(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Toca2(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Request(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(PROFESSOR_Codigo) REFERENCES projeto.Grupo(PROFESSOR_Codigo)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(DISCIPLINA_ID) REFERENCES projeto.Disciplina(ID)
ALTER TABLE projeto.Professor ADD FOREIGN KEY(DIRECAO_Cargo) REFERENCES projeto.Direcao(Cargo)
ALTER TABLE projeto.Funcionario ADD FOREIGN KEY(FUNCIONARIO_Codigo) REFERENCES projeto.Pertence1(FUNCIONARIO_Codigo)
ALTER TABLE projeto.Funcionario ADD FOREIGN KEY(FUNCIONARIO_Codigo) REFERENCES projeto.Pessoa(PESSOA_Codigo)
ALTER TABLE projeto.Funcionario ADD FOREIGN KEY(LOGIN_Utilizador) REFERENCES projeto.Login(Utilizador)

GO







