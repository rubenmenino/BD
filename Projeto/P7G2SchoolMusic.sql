USE [master]
GO
/****** Object:  Database [p7g2]    Script Date: 12/06/2020 20:07:57 ******/
CREATE DATABASE [p7g2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p7g2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p7g2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p7g2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p7g2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [p7g2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p7g2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p7g2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p7g2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p7g2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p7g2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p7g2] SET ARITHABORT OFF 
GO
ALTER DATABASE [p7g2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [p7g2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p7g2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p7g2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p7g2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p7g2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p7g2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p7g2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p7g2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p7g2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p7g2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p7g2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p7g2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p7g2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p7g2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p7g2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p7g2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p7g2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p7g2] SET  MULTI_USER 
GO
ALTER DATABASE [p7g2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p7g2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p7g2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p7g2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p7g2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [p7g2] SET QUERY_STORE = OFF
GO
USE [p7g2]
GO
/****** Object:  User [p7g2]    Script Date: 12/06/2020 20:07:58 ******/
CREATE USER [p7g2] FOR LOGIN [p7g2] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p7g2]
GO
/****** Object:  Schema [projeto]    Script Date: 12/06/2020 20:07:58 ******/
CREATE SCHEMA [projeto]
GO
/****** Object:  Rule [data_Evento]    Script Date: 12/06/2020 20:07:58 ******/
CREATE RULE [dbo].[data_Evento] 
AS
@VALOR > 0






































GO
/****** Object:  Rule [salarioProf]    Script Date: 12/06/2020 20:07:58 ******/
CREATE RULE [dbo].[salarioProf] 
AS
@VALOR >= 0
GO
/****** Object:  UserDefinedFunction [projeto].[getCountAlunosProf]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [projeto].[getCountAlunosProf](@PROFESSOR_Codigo SMALLINT)
RETURNS INT 
AS 
BEGIN 
	DECLARE @returnValue SMALLINT;
	SET @returnValue = (SELECT COUNT (ALUNO_Codigo) from projeto.alunInst
						WHERE INTRUMENTO_Nome = (SELECT INTRUMENTO_Nome FROM projeto.profInst WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo))

	IF (@returnValue IS NULL)
	BEGIN
		SET @returnValue = 0;
	END
	
	RETURN @returnValue * 25
END
GO
/****** Object:  Table [projeto].[Request]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Request](
	[Ano] [int] NULL,
	[PROFESSOR_Codigo] [smallint] NULL,
	[Aceitar] [bit] NOT NULL,
	[EVENTO_Nome_rq] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EVENTO_Nome_rq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Evento]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Evento](
	[EVENTO_Nome] [varchar](30) NOT NULL,
	[Local] [varchar](30) NOT NULL,
	[EVENTO_inicio] [date] NULL,
	[EVENTO_fim] [date] NULL,
	[Caracteristica] [varchar](30) NOT NULL,
	[EVENTO_Ano] [int] NULL,
	[Aceite] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EVENTO_Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listaEventosAceites]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaEventosAceites]
AS
	SELECT projeto.Evento.*  FROM projeto.Evento
	INNER JOIN projeto.Request
	ON Evento.Aceite = Request.Aceite

GO
/****** Object:  Table [projeto].[Professor]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Professor](
	[PROFESSOR_Codigo] [smallint] IDENTITY(100,1) NOT NULL,
	[Data_Nasc] [date] NOT NULL,
	[Telemovel] [varchar](15) NULL,
	[Nome] [varchar](50) NOT NULL,
	[Sexo] [varchar](20) NOT NULL,
	[NIF] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Morada] [varchar](200) NOT NULL,
	[Salario] [int] NOT NULL,
	[DISCIPLINA_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PROFESSOR_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listaProfs]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaProfs] AS
SELECT * FROM projeto.Professor

GO
/****** Object:  Table [projeto].[Toca]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Toca](
	[INTRUMENTO_Nome] [varchar](30) NULL,
	[ALUNO_Codigo] [int] NULL,
	[PROFESSOR_Codigo] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Aluno]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Aluno](
	[ALUNO_Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Data_Nasc] [date] NOT NULL,
	[Telemovel] [varchar](15) NULL,
	[Nome] [varchar](50) NOT NULL,
	[Sexo] [varchar](20) NOT NULL,
	[NIF] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Morada] [varchar](200) NOT NULL,
	[Mensalidade] [int] NOT NULL,
	[TURMA_Numero] [int] NULL,
	[TURMA_disciplina] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ALUNO_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listaAlunos]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaAlunos] AS
SELECT projeto.Aluno.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Aluno
left JOIN projeto.Toca
ON Toca.ALUNO_Codigo = ALUNO.ALUNO_Codigo
GO
/****** Object:  View [projeto].[AlunosProfessor]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [projeto].[AlunosProfessor] AS
(SELECT PROFESSOR_Codigo AS ID FROM projeto.Professor UNION ALL SELECT ALUNO_Codigo FROM projeto.Aluno) 
GO
/****** Object:  Table [projeto].[Grupo]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Grupo](
	[Representante] [int] NOT NULL,
	[GRUPO_Tipo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Representante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[PertenceGrupo]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[PertenceGrupo](
	[Representante] [int] NULL,
	[GRUPO_Tipo] [varchar](30) NULL,
	[CodigoP] [smallint] NULL,
	[CodigoA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [projeto].[gruposVer]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [projeto].[gruposVer] AS
SELECT projeto.Grupo.*, projeto.PertenceGrupo.CodigoA, projeto.PertenceGrupo.CodigoP
FROM projeto.Grupo
left JOIN projeto.PertenceGrupo 
ON Grupo.Representante = PertenceGrupo.Representante
GO
/****** Object:  Table [projeto].[Turma]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Turma](
	[Numero] [int] NOT NULL,
	[Capacidade] [int] NOT NULL,
	[DISCIPLINA_Nome] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listaTurma]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaTurma]
AS
	SELECT projeto.Turma.*
	FROM projeto.Turma
GO
/****** Object:  UserDefinedFunction [dbo].[GetAlunosInstrumento]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                CREATE FUNCTION [dbo].[GetAlunosInstrumento](@ALUNO_Codigo INT) RETURNS TABLE 
                AS 
                RETURN ( Select c.ALUNO_Codigo
                FROM projeto.Aluno as c JOIN projeto.Toca1 as e ON c.ALUNO_Codigo=e.ALUNO_Codigo
                WHERE c.ALUNO_Codigo=@ALUNO_Codigo 
                
                ) 
GO
/****** Object:  View [projeto].[alunInst]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [projeto].[alunInst] 
	AS
	SELECT projeto.Aluno.ALUNO_Codigo, projeto.Aluno.Nome, projeto.Aluno.Telemovel, projeto.Toca.INTRUMENTO_Nome
	FROM projeto.Aluno
	inner JOIN projeto.Toca
	ON Toca.ALUNO_Codigo = Aluno.ALUNO_Codigo
GO
/****** Object:  View [dbo].[listaEventos]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaEventos]
AS
	SELECT projeto.Evento.*, projeto.Request.PROFESSOR_Codigo 
	FROM projeto.Evento
	INNER JOIN projeto.Request
	ON Evento.EVENTO_Nome = Request.EVENTO_Nome_rq

GO
/****** Object:  View [dbo].[ListaDeAlunos]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ListaDeAlunos] AS
	SELECT * FROM projeto.Aluno
GO
/****** Object:  View [projeto].[ListaDeAlunos]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [projeto].[ListaDeAlunos] AS
	SELECT * FROM projeto.Aluno
GO
/****** Object:  View [projeto].[profInst]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [projeto].[profInst] AS
SELECT projeto.Professor.PROFESSOR_Codigo, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Professor
left JOIN projeto.Toca
ON Toca.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo

GO
/****** Object:  View [dbo].[listaProfessores]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[listaProfessores] AS
SELECT projeto.Professor.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Professor
LEFT JOIN projeto.Toca
ON Toca.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo


GO
/****** Object:  Table [projeto].[Direcao]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Direcao](
	[Cargo] [varchar](30) NOT NULL,
	[Ano] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Disciplina]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Disciplina](
	[ID] [int] NOT NULL,
	[Nome] [varchar](30) NOT NULL,
	[PROFESSOR_Codigo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Instrumento]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Instrumento](
	[INSTRUMENTO_Nome] [varchar](30) NOT NULL,
	[INSTRUMENTO_Tipo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTRUMENTO_Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Login]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Login](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Utilizador] [varchar](30) NOT NULL,
	[PasswordHash] [binary](64) NOT NULL,
	[Fname] [varchar](30) NULL,
	[Lname] [varchar](30) NULL,
	[Salt] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Utilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Pertence]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Pertence](
	[CODIGO_Professor] [smallint] NOT NULL,
	[Ano] [int] NULL,
	[Cargo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_Professor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[PertenceDirecao]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[PertenceDirecao](
	[CODIGO_Professor] [smallint] NOT NULL,
	[Ano] [int] NOT NULL,
	[Cargo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_Professor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[PertenceTurma]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[PertenceTurma](
	[CODIGO_Aluno] [int] NOT NULL,
	[TURMA_Numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_Aluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [projeto].[Tem]    Script Date: 12/06/2020 20:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [projeto].[Tem](
	[ALUNO_Codigo] [int] NOT NULL,
	[PROFESSOR_Codigo] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ALUNO_Codigo] ASC,
	[PROFESSOR_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [projeto].[Aluno] ON 

INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (1, CAST(N'1961-03-26' AS Date), N'910707891', N'João Afonso', N'Masculino', 198254059, N'joaoafonso@gmail.pt', N'Rua Jorge Sena 28', 25, 6, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (2, CAST(N'1961-09-18' AS Date), N'913433635', N'Ricardo Pereira', N'Masculino', 176225153, N'ricardopereira@ua.pt', N'R Nogueiras 112', 25, 1, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (3, CAST(N'1962-07-17' AS Date), N'913918064', N'Ruben Menino', N'Masculino', 171506707, N'ruben.menino@ua.pt', N'R Combatentes G Guerra 87', 25, 1, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (5, CAST(N'1966-03-17' AS Date), N'915554569', N'José Miguel', N'Masculino', 125074948, N'josemiguel@outlook.pt', N'R Oliveirinhas 80', 25, 6, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (6, CAST(N'1968-11-11' AS Date), N'921227682', N'Guilherme Tomas', N'Masculino', 179777203, N'gui@ua.pt', N'Rua do Carmo 1', 25, 1, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (7, CAST(N'1972-05-13' AS Date), N'927387927', N'Augusto Miguel', N'Masculino', 174462379, N'augusto@hotmail.pt', N'Rua da Amélia 34', 25, 0, N'')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (8, CAST(N'1974-06-01' AS Date), N'926433280', N'José Algarve', N'Masculino', 133888452, N'zeze@ua.pt', N'Rua Andrade da Poeira 45', 25, 10, N'x')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (9, CAST(N'1975-03-31' AS Date), N'924539227', N'João Terra', N'Masculino', 164930280, N'terrajoao@gmail.pt', N'Rua da Santissima Trindade 199', 25, 0, N'')
INSERT [projeto].[Aluno] ([ALUNO_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Mensalidade], [TURMA_Numero], [TURMA_disciplina]) VALUES (15, CAST(N'1999-06-12' AS Date), N'91245678', N'Ruben Ferreira', N'Masculino', 123456789, N'rf@gmail.com', N'Rua do Ruben', 25, 7, N'x')
SET IDENTITY_INSERT [projeto].[Aluno] OFF
INSERT [projeto].[Direcao] ([Cargo], [Ano]) VALUES (N'Presidente', 2020)
INSERT [projeto].[Direcao] ([Cargo], [Ano]) VALUES (N'SubPresidente', 2020)
INSERT [projeto].[Direcao] ([Cargo], [Ano]) VALUES (N'Diretor', 2020)
INSERT [projeto].[Direcao] ([Cargo], [Ano]) VALUES (N'Tesoureiro', 2020)
INSERT [projeto].[Direcao] ([Cargo], [Ano]) VALUES (N'Secretario', 2020)
INSERT [projeto].[Disciplina] ([ID], [Nome], [PROFESSOR_Codigo]) VALUES (1, N'Aula Prática', 100)
INSERT [projeto].[Disciplina] ([ID], [Nome], [PROFESSOR_Codigo]) VALUES (2, N'Aula teórica', 101)
INSERT [projeto].[Disciplina] ([ID], [Nome], [PROFESSOR_Codigo]) VALUES (3, N'Coro', 102)
INSERT [projeto].[Evento] ([EVENTO_Nome], [Local], [EVENTO_inicio], [EVENTO_fim], [Caracteristica], [EVENTO_Ano], [Aceite]) VALUES (N'BD', N'Escola', CAST(N'2020-06-12' AS Date), CAST(N'2020-06-12' AS Date), N'Ensaio', 2020, 1)
INSERT [projeto].[Evento] ([EVENTO_Nome], [Local], [EVENTO_inicio], [EVENTO_fim], [Caracteristica], [EVENTO_Ano], [Aceite]) VALUES (N'Ensaio', N'Santa Cecilia', CAST(N'2020-06-09' AS Date), CAST(N'2020-06-09' AS Date), N'Ensaio ', 2020, 1)
INSERT [projeto].[Evento] ([EVENTO_Nome], [Local], [EVENTO_inicio], [EVENTO_fim], [Caracteristica], [EVENTO_Ano], [Aceite]) VALUES (N'Ensaio2', N'tasfa', CAST(N'2020-06-09' AS Date), CAST(N'2020-06-09' AS Date), N'ensaio', 2020, 1)
INSERT [projeto].[Evento] ([EVENTO_Nome], [Local], [EVENTO_inicio], [EVENTO_fim], [Caracteristica], [EVENTO_Ano], [Aceite]) VALUES (N'Xpto', N'Escola', CAST(N'2020-06-12' AS Date), CAST(N'2020-06-12' AS Date), N'Ensaio', 2020, 1)
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (116, N'tttt')
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (118, N'teste')
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (119, N'este')
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (120, N'qqq')
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (122, N'xpto')
INSERT [projeto].[Grupo] ([Representante], [GRUPO_Tipo]) VALUES (123, N'BD')
SET IDENTITY_INSERT [projeto].[Login] ON 

INSERT [projeto].[Login] ([UserID], [Utilizador], [PasswordHash], [Fname], [Lname], [Salt]) VALUES (5, N'gabriel', 0x1844372A1BAB53CADBF1EEF1A0495215B6116568D2D7EA6F5FDEC61B145A80E8B01A0ADCD8270D5A1ABB7D1647DFDD86363B90C6E10C8E926AF2D4540E58FFDD, N'Gabriel', N'Saudade', N'1906a91a-2833-4bbe-b682-fffaf6f20fdc')
SET IDENTITY_INSERT [projeto].[Login] OFF
INSERT [projeto].[PertenceDirecao] ([CODIGO_Professor], [Ano], [Cargo]) VALUES (115, 2020, N'Presidente')
INSERT [projeto].[PertenceDirecao] ([CODIGO_Professor], [Ano], [Cargo]) VALUES (116, 2020, N'SubPresidente')
INSERT [projeto].[PertenceDirecao] ([CODIGO_Professor], [Ano], [Cargo]) VALUES (119, 2020, N'Diretor')
INSERT [projeto].[PertenceDirecao] ([CODIGO_Professor], [Ano], [Cargo]) VALUES (122, 2020, N'Tesoureiro')
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (119, N'este', 7, NULL)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (120, N'qqq', NULL, 9)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (120, N'qqq', NULL, 119)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (119, N'este', NULL, 119)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (116, N'tttt', 115, NULL)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (116, N'tttt', NULL, 6)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (122, N'xpto', NULL, 6)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (122, N'xpto', 121, NULL)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (118, N'teste', NULL, 7)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (118, N'teste', 118, NULL)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (123, N'BD', NULL, 15)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (123, N'BD', NULL, 15)
INSERT [projeto].[PertenceGrupo] ([Representante], [GRUPO_Tipo], [CodigoP], [CodigoA]) VALUES (118, N'teste', 118, NULL)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (1, 6)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (2, 1)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (3, 1)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (4, 4)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (5, 6)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (6, 1)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (8, 10)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (9, 1)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (15, 7)
INSERT [projeto].[PertenceTurma] ([CODIGO_Aluno], [TURMA_Numero]) VALUES (18, 3)
SET IDENTITY_INSERT [projeto].[Professor] ON 

INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (115, CAST(N'1994-05-09' AS Date), N'968413692', N'Sara Correia', N'Masculino', 168387190, N'sarocas@ua.pt', N'Rua dos atletas 1', 75, NULL)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (116, CAST(N'1996-05-05' AS Date), N'960053692', N'Joana Matos', N'Masculino', 177730617, N'joaninha335@gmail.pt', N'Rua da escola 64', 50, NULL)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (118, CAST(N'1998-06-11' AS Date), N'964781004', N'Rafael Josefina', N'F', 115290540, N'rafaelamulher@outlook.pt', N'Rua Vazia 0', 0, NULL)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (119, CAST(N'2000-02-08' AS Date), N'964521446', N'Márcia Joana', N'F', 198674503, N'joaninhamarciana@outlook.pt', N'Rua das nespereiras 69', 0, NULL)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (120, CAST(N'1999-06-09' AS Date), N'231412', N'Gabriel', N'Masculino', 214124, N'gabriel@gmail.,com', N'hasfhash', 25, 1)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (121, CAST(N'1975-06-12' AS Date), N'912345678', N'Victor', N'Masculino', 123456789, N'victor@gmail.com', N'Rua do Victor', 50, 1)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (122, CAST(N'1999-06-12' AS Date), N'12345678', N'Joao', N'Masculino', 123456789, N'j@gmail.com', N'Rua do Joao', 50, 1)
INSERT [projeto].[Professor] ([PROFESSOR_Codigo], [Data_Nasc], [Telemovel], [Nome], [Sexo], [NIF], [Email], [Morada], [Salario], [DISCIPLINA_ID]) VALUES (123, CAST(N'1999-06-12' AS Date), N'91234567', N'Gabriel Saudade', N'Masculino', 123456789, N'gs@gmail.com', N'Rua do Gabriel', 25, 1)
SET IDENTITY_INSERT [projeto].[Professor] OFF
INSERT [projeto].[Request] ([Ano], [PROFESSOR_Codigo], [Aceitar], [EVENTO_Nome_rq]) VALUES (2020, 155, 1, N'BD')
INSERT [projeto].[Request] ([Ano], [PROFESSOR_Codigo], [Aceitar], [EVENTO_Nome_rq]) VALUES (2020, 115, 1, N'Ensaio')
INSERT [projeto].[Request] ([Ano], [PROFESSOR_Codigo], [Aceitar], [EVENTO_Nome_rq]) VALUES (2020, 115, 1, N'Ensaio2')
INSERT [projeto].[Request] ([Ano], [PROFESSOR_Codigo], [Aceitar], [EVENTO_Nome_rq]) VALUES (2020, 115, 1, N'Xpto')
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Violino', 3, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Violino', 1, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Piano', 2, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Canto', NULL, 123)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Fagote', 5, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Bateria', 6, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Piano', 7, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Saxofone', 8, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Violino', 9, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Violino', NULL, 100)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Violino', NULL, 115)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Piano', NULL, 116)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Bateria', 9, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Guitarra', NULL, 120)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Guitarra', 9, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Fagote', NULL, 122)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Bateria', NULL, 121)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Fagote', 9, NULL)
INSERT [projeto].[Toca] ([INTRUMENTO_Nome], [ALUNO_Codigo], [PROFESSOR_Codigo]) VALUES (N'Canto', 15, NULL)
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (1, 20, N'Aula Prática')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (2, 20, N'Coro')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (3, 20, N'Coro')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (4, 20, N'Aula Prática')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (6, 12, N'Aula teórica')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (7, 20, N'Coro')
INSERT [projeto].[Turma] ([Numero], [Capacidade], [DISCIPLINA_Nome]) VALUES (10, 10, N'Aula Prática')
ALTER TABLE [projeto].[Aluno] ADD  DEFAULT ((25)) FOR [Mensalidade]
GO
ALTER TABLE [projeto].[Aluno]  WITH CHECK ADD CHECK  (([Mensalidade]>(20)))
GO
ALTER TABLE [projeto].[Turma]  WITH CHECK ADD CHECK  (([Capacidade]>(0)))
GO
ALTER TABLE [projeto].[Turma]  WITH CHECK ADD CHECK  (([Numero]>(0)))
GO
/****** Object:  StoredProcedure [projeto].[addInstrumento]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[addInstrumento](@id INT, @instrumento VARCHAR(30))
AS	

	IF @id IS NOT NULL
	BEGIN

		IF @id > 99
		BEGIN 
			IF EXISTS (SELECT PROFESSOR_Codigo FROM projeto.Toca
				WHERE INTRUMENTO_Nome = @instrumento AND ALUNO_Codigo = null)
				BEGIN
					RETURN -1
				END

			UPDATE projeto.Toca 
			SET INTRUMENTO_Nome = @instrumento
			WHERE PROFESSOR_Codigo = @id
		END

		IF @id < 100
		BEGIN
			
			IF  EXISTS (
				SELECT * FROM projeto.Toca
				WHERE ALUNO_Codigo = @id AND INTRUMENTO_Nome = @instrumento
			)
			BEGIN
				PRINT'Aluno já toca o instrumento selecinado!'
				RETURN 
			END

			INSERT INTO projeto.Toca (INTRUMENTO_Nome, ALUNO_Codigo, PROFESSOR_Codigo) VALUES(@instrumento, @id, NULL)	
		END

			
	END

GO
/****** Object:  StoredProcedure [projeto].[addProfesorDirecao]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[addProfesorDirecao](@id SMALLINT, @cargo VARCHAR(30), @ano INT)
AS
	IF NOT EXISTS(
		SELECT CODIGO_Professor FROM projeto.PertenceDirecao
		WHERE CODIGO_Professor = @id AND Ano = @ano
	)
	BEGIN
		INSERT INTO projeto.PertenceDirecao(CODIGO_Professor, Ano, Cargo) VALUES(@id, @ano, @cargo)
		RETURN
	END

	PRINT 'Professor já desempenha um cargo na direcao'
GO
/****** Object:  StoredProcedure [projeto].[addProfessorDirecao]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[addProfessorDirecao](@id SMALLINT, @cargo VARCHAR(30), @ano INT)AS		IF NOT EXISTS(		SELECT PROFESSOR_Codigo FROM projeto.Professor		WHERE PROFESSOR_Codigo = @id	)	BEGIN		PRINT 'PROFESSOR NÂO EXISTE'		RETURN	END		IF EXISTS(		SELECT * FROM projeto.PertenceDirecao		WHERE Cargo = @cargo AND Ano = @ano	)	BEGIN		PRINT 'CARGO JÁ ESTÁ PREENCHIDO!'		RETURN	END	IF EXISTS(		SELECT * FROM projeto.PertenceDirecao		WHERE CODIGO_Professor = @id AND Ano = @ano	)	BEGIN		PRINT 'PROFESSOR JÁ DESEMPENHA UM CARGO NA DIRECAO!'		RETURN 	END	INSERT INTO projeto.PertenceDirecao(CODIGO_Professor,  Ano, Cargo) VALUES(@id, @ano, @cargo)
GO
/****** Object:  StoredProcedure [projeto].[adicionarAlunoTurma]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[adicionarAlunoTurma](@id INT, @TURMA_Numero INT, @disciplinaID VARCHAR(30))
AS
	IF @id IS NOT NULL
	BEGIN
		IF EXISTS(
			SELECT * FROM projeto.PertenceTurma
			WHERE @id = CODIGO_Aluno AND @TURMA_Numero = TURMA_Numero 
		)
		BEGIN
			print 'Aluno já pertence à turma!'
			RETURN
		END


		IF NOT EXISTS(
			SELECT ALUNO_Codigo FROM projeto.Aluno
			WHERE ALUNO_Codigo = @id
		)
		BEGIN
			PRINT 'ID do aluno não é valido'
			RETURN
		END

		IF NOT EXISTS(
			SELECT CODIGO_Aluno FROM projeto.PertenceTurma
			WHERE CODIGO_Aluno = @id
		)
		BEGIN

			INSERT INTO projeto.PertenceTurma (CODIGO_Aluno, TURMA_Numero) VALUES (@id, @TURMA_Numero)
			RETURN
		END

		UPDATE projeto.PertenceTurma
		SET TURMA_Numero = @TURMA_Numero
		WHERE CODIGO_Aluno = @id

		UPDATE projeto.Aluno
		SET TURMA_disciplina = @disciplinaID, TURMA_Numero = @TURMA_Numero
		WHERE ALUNO_Codigo = @id

	END
	

GO
/****** Object:  StoredProcedure [projeto].[adicionarCodigoGrupo]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[adicionarCodigoGrupo] (@codigoP SMALLINT, @codigoA INT, @tipo VARCHAR(30))
AS
	
BEGIN
	declare @representante INT
	SET @representante = (SELECT Representante FROM projeto.Grupo WHERE @tipo = GRUPO_Tipo)
	IF EXISTS (SELECT * FROM projeto.PertenceGrupo
				WHERE @codigoP = CodigoP AND @codigoA = CodigoA)
		BEGIN
			PRINT 'Já pertence ao grupo'
			RETURN
		END

	IF @codigoA > 99
		BEGIN
			INSERT INTO projeto.PertenceGrupo(Representante, GRUPO_Tipo, CodigoP, CodigoA) VALUES (@representante, @tipo, @codigoP, null)
		END

	IF @codigoA < 100
		BEGIN
			INSERT INTO projeto.PertenceGrupo(Representante, GRUPO_Tipo, CodigoP, CodigoA) VALUES (@representante, @tipo, null, @codigoA)
		END	
	
END
GO
/****** Object:  StoredProcedure [projeto].[adicionarRegisto]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [projeto].[adicionarRegisto]
    @pLogin NVARCHAR(50), 
    @pPassword NVARCHAR(50),
    @pFirstName NVARCHAR(40) = NULL, 
    @pLastName NVARCHAR(40) = NULL,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY
        INSERT INTO projeto.Login (Utilizador, PasswordHash, Salt, Fname, Lname)
        VALUES(@pLogin, HASHBYTES('SHA2_512', @pPassword+CAST(@salt AS NVARCHAR(36))), @salt, @pFirstName, @pLastName)
       SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH
END

GO
/****** Object:  StoredProcedure [projeto].[atualizarSalario]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[atualizarSalario]
AS
	DECLARE @max_id SMALLINT
	SET @max_id = (SELECT MAX(projeto.Professor.PROFESSOR_Codigo) FROM projeto.Professor)


	DECLARE @current SMALLINT
	SET @current = (SELECT MIN(projeto.Professor.PROFESSOR_Codigo) FROM projeto.Professor)

	WHILE(@current <= @max_id) 
	BEGIN

		DECLARE @salario INT
		SET @salario = projeto.getCountAlunosProf(@current)

		UPDATE projeto.Professor
		SET Salario = @salario
		WHERE PROFESSOR_Codigo = @current

		SET @current = @current + 1
	END
GO
/****** Object:  StoredProcedure [projeto].[criarAluno]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[criarAluno] (@Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Mensalidade INT, @TURMA_Numero INT, @TURMA_ID VARCHAR(30))
AS	
	INSERT INTO projeto.Aluno (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada, Mensalidade, TURMA_Numero, TURMA_disciplina) VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @Mensalidade, @TURMA_Numero, @TURMA_ID);

GO
/****** Object:  StoredProcedure [projeto].[criarEvento]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[criarEvento] (@id INT, @nome VARCHAR(30), @local VARCHAR(30), @data_inicio DATETIME, @data_fim DATETIME, @caract VARCHAR(30), @ano INT)AS	IF EXISTS(		SELECT EVENTO_Nome FROM projeto.Evento		WHERE EVENTO_Nome = @nome	)	BEGIN		print'Evento com o mesmo nome'		return	END	INSERT INTO projeto.Evento(EVENTO_Nome, Local, EVENTO_inicio, EVENTO_fim, Caracteristica, EVENTO_Ano, Aceite) VALUES(@nome, @Local, @Data_inicio, @Data_fim, @caract, @ano, 0)	INSERT INTO projeto.Request(Ano, PROFESSOR_Codigo, Aceitar, EVENTO_Nome_rq) VALUES(@ano, @id, 0, @nome)
GO
/****** Object:  StoredProcedure [projeto].[criarGrupo]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[criarGrupo](@representante int, @tipo varchar(30))
AS

IF NOT EXISTS(
		SELECT PROFESSOR_Codigo FROM projeto.Professor
		WHERE PROFESSOR_Codigo = @representante
	)
	BEGIN
		PRINT 'PROFESSOR NÂO EXISTE'
		RETURN
	END


IF EXISTS(
		SELECT GRUPO_Tipo FROM projeto.Grupo
		WHERE GRUPO_Tipo = @tipo
	)
		BEGIN
		print'Grupo com o mesmo nome'
		return
	END

	INSERT INTO projeto.Grupo(Representante, GRUPO_Tipo) VALUES (@representante, @tipo )
GO
/****** Object:  StoredProcedure [projeto].[criarProfessor]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[criarProfessor] (@Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Salario INT, @DISCIPLINA_ID INT)
AS
	

	INSERT INTO projeto.Professor (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada, Salario, DISCIPLINA_ID) VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @Salario, @DISCIPLINA_ID);


	DECLARE @id SMALLINT
	SET @id = (SELECT MAX(projeto.Professor.PROFESSOR_Codigo) FROM projeto.Professor)
	

	IF EXISTS(
		SELECT * FROM projeto.Toca
		WHERE @id = PROFESSOR_Codigo
	)
	BEGIN
		DELETE FROM projeto.Toca
		WHERE PROFESSOR_Codigo = @id
	END


	INSERT INTO projeto.TOCA(INTRUMENTO_Nome, ALUNO_Codigo, PROFESSOR_Codigo) VALUES(null, null, @id)


GO
/****** Object:  StoredProcedure [projeto].[criarTurma]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[criarTurma](@numero INT, @capacidade INT, @disciplina VARCHAR(30))AS	IF EXISTS(		SELECT Numero FROM projeto.Turma		WHERE Numero = @numero	)	BEGIN		print 'Numero de turma já existe'		return	END	INSERT INTO projeto.Turma(Numero, Capacidade, DISCIPLINA_Nome) VALUES (@numero, @capacidade, @disciplina)	-- EXEC projeto.adicionarAlunoTurma @id = @id, @TURMA_Numero = @numero, @disciplinaID = @disciplina
GO
/****** Object:  StoredProcedure [projeto].[deleteAluno]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[deleteAluno] (@id INT, @Instrumento VARCHAR(30))AS	DECLARE @num_ints INT	SET @num_ints =  (SELECT COUNT(ALUNO_Codigo) FROM projeto.Toca WHERE ALUNO_Codigo = @id) 	IF @num_ints > 1 	BEGIN		DELETE FROM projeto.Toca WHERE ALUNO_Codigo = @id AND INTRUMENTO_Nome = @instrumento		RETURN	END	IF @num_ints <= 1 	BEGIN 		DELETE FROM projeto.Aluno WHERE ALUNO_Codigo = @id		DELETE FROM projeto.Toca WHERE ALUNO_Codigo = @id	END
GO
/****** Object:  StoredProcedure [projeto].[deleteProfessor]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[deleteProfessor](@id INT)AS		DELETE FROM projeto.Professor WHERE PROFESSOR_Codigo = @id	DELETE FROM projeto.Toca WHERE PROFESSOR_Codigo = @id
GO
/****** Object:  StoredProcedure [projeto].[getAlunosProf]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[getAlunosProf](@PROFESSOR_Codigo SMALLINT)
AS
		SELECT * FROM projeto.alunInst
	WHERE INTRUMENTO_Nome = (SELECT INTRUMENTO_Nome FROM projeto.profInst WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo)
GO
/****** Object:  StoredProcedure [projeto].[logar]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [projeto].[logar]
    @pLoginName NVARCHAR(254),
    @pPassword NVARCHAR(50),
    @responseMessage NVARCHAR(250)='' OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @userID INT
    IF EXISTS (SELECT TOP 1 UserID FROM projeto.Login WHERE Utilizador=@pLoginName)
    BEGIN
        SET @userID=(SELECT UserID FROM projeto.Login WHERE Utilizador=@pLoginName AND PasswordHash=HASHBYTES('SHA2_512', @pPassword+CAST(Salt AS NVARCHAR(36))))

       IF(@userID IS NULL)
           SET @responseMessage='Incorrect password'
       ELSE 
           SET @responseMessage='User successfully logged in'
    END
    ELSE
       SET @responseMessage='Invalid login'
END
	


GO
/****** Object:  StoredProcedure [projeto].[updateAluno]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[updateAluno] (@ALUNO_Codigo INT, @Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Mensalidade INT, @TURMA_Numero INT, @TURMA_ID VARCHAR(30), @inst VARCHAR(30))
AS
	

	UPDATE projeto.Aluno
	SET Data_Nasc = @Data_Nasc, Telemovel = @Telemovel, Nome = @Nome, Sexo = @Sexo, NIF = @NIF, Email = @Email, Morada = @Morada, Mensalidade = @Mensalidade, TURMA_Numero = @TURMA_Numero, TURMA_disciplina = @TURMA_ID
	WHERE ALUNO_Codigo = @ALUNO_Codigo

	
	EXEC projeto.addInstrumento @id=@ALUNO_Codigo, @instrumento=@inst

GO
/****** Object:  StoredProcedure [projeto].[updateEvento]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[updateEvento] (@id SMALLINT, @nome VARCHAR(30), @local VARCHAR(30), @data_inicio DATETIME, @data_fim DATETIME, @caract VARCHAR(30), @ano INT, @accept BIT)
AS
	
	
	UPDATE projeto.Evento 
	SET EVENTO_Nome = @nome, Local= @local, EVENTO_inicio = @data_inicio, EVENTO_fim = @data_fim, Caracteristica = @caract, EVENTO_Ano = @ano, Aceite = @accept
	WHERE EVENTO_Nome = @nome

	IF @accept = 1
	BEGIN
		UPDATE projeto.Request
		SET Ano = @ano, PROFESSOR_Codigo = @id, Aceitar = @accept, EVENTO_Nome_rq = @nome
		WHERE EVENTO_Nome_rq = @nome
	END
	
GO
/****** Object:  StoredProcedure [projeto].[updateProfessor]    Script Date: 12/06/2020 20:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [projeto].[updateProfessor] (@PROFESSOR_Codigo INT, @Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @DISCIPLINA_ID INT, @inst VARCHAR(30))
AS
	IF NOT EXISTS(
		SELECT PROFESSOR_Codigo FROM projeto.Toca
		WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo
	)
	BEGIN
		INSERT INTO projeto.TOCA(INTRUMENTO_Nome, ALUNO_Codigo, PROFESSOR_Codigo) VALUES(null, null, @PROFESSOR_Codigo)	
	END


	DECLARE @Salario INT	SET @Salario = projeto.getCountAlunosProf(@PROFESSOR_Codigo)


	UPDATE projeto.Professor 
	SET Data_Nasc = @Data_Nasc, Telemovel = @Telemovel, Nome = @Nome, Sexo = @Sexo, NIF = @NIF, Email = @Email, Morada = @Morada, Salario = @Salario
	WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo

	EXEC projeto.addInstrumento @id=@PROFESSOR_Codigo, @instrumento=@inst

GO
USE [master]
GO
ALTER DATABASE [p7g2] SET  READ_WRITE 
GO
