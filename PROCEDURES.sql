--DROP FUNCTION projeto.GetAlunosInstrumento 
--                GO
--                CREATE FUNCTION projeto.GetAlunosInstrumento(@ALUNO_Codigo INT) RETURNS TABLE 
--                AS 
--                RETURN ( Select c.ALUNO_Codigo
--                FROM projeto.Aluno as c JOIN projeto.Toca1 as e ON c.ALUNO_Codigo=e.ALUNO_Codigo
--                WHERE c.ALUNO_Codigo=@ALUNO_Codigo 
                
--                ) 
--                GO 
--                SELECT * FROM GetAlunosInstrumento(3)
--                GO;



--CREATE PROCEDURE projeto.inserirAluno (@Data_Nasc date, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo varchar(20), 
--@NIF int, @Email VARCHAR(100), @Morada VARCHAR(200), @Mensalidade INT,  @id int OUTPUT)
--AS  
--BEGIN      
--	Insert projeto.Aluno (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada, Mensalidade) VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, 
--							   @NIF, @Email, @Morada, @Mensalidade);  
	
--	SET @id = SCOPE_IDENTITY();  
--END


-----------------------------
-----------------------------
-- o procedimento armazenado pega a senha como parâmetro de entrada
-- e insere-a na base de dados em um formato criptografado - HASHBYTES 
-----------------------------
-----------------------------

DROP PROCEDURE projeto.adicionarRegisto
CREATE PROCEDURE projeto.adicionarRegisto
	@pLogin			VARCHAR(30),
	@pPassword		VARCHAR(30),
	@pFirstName				VARCHAR(30),
	@pLastName				VARCHAR(30),
	@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO projeto.Login (Utilizador, PasswordHash , Fname, Lname)
		VALUES(@pLogin, HASHBYTES('SHA2_512', @pPassword), @pFirstName, @pLastName)
		SET @responseMessage = 'Success'
	END TRY
	BEGIN CATCH
		SET @responseMessage = ERROR_MESSAGE()
	END CATCH
END

GO
---------------------------
---------------------------

DECLARE @responseMessage NVARCHAR(250)
EXEC projeto.adicionarRegisto
          @pLogin = N'Admin',
          @pPassword = N'123',
          @pFirstName = N'Admin',
          @pLastName = N'Administrator',
          @responseMessage=@responseMessage OUTPUT
go
SELECT * FROM projeto.Login
go

---------------------------
---------------------------
-- alterar atabela e o procedimento armazenado para usar um salt na criptografia de senha. 
-- gerado aleatoriamente e uma sequência única.
---------------------------
---------------------------

GO
ALTER TABLE projeto.Login ADD Salt UNIQUEIDENTIFIER 
GO

ALTER PROCEDURE projeto.adicionarRegisto
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

-----------------------------------
-----------------------------------
go

TRUNCATE TABLE projeto.Login
DECLARE @responseMessage NVARCHAR(250)
EXEC projeto.adicionarRegisto
          @pLogin = N'Admin',
          @pPassword = N'123',
          @pFirstName = N'Admin',
          @pLastName = N'Administrator',
          @responseMessage=@responseMessage OUTPUT
SELECT UserID, Utilizador, PasswordHash, Salt, Fname, Lname
FROM projeto.Login

go


-----------------------------------
-----------------------------------
-- Para poder usar o salt para fazer login na base de dados
--
-----------------------------------
-----------------------------------


DROP PROCEDURE projeto.logar
CREATE PROCEDURE projeto.logar
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

-------------------------------------
-------------------------------------
-- Testar
--
-------------------------------------
-------------------------------------

/*
DECLARE	@responseMessage nvarchar(250)

--Correct login and password
EXEC	projeto.logar
		@pLoginName = N'Admin',
		@pPassword = N'123',
		@responseMessage = @responseMessage OUTPUT

SELECT	@responseMessage as N'@responseMessage'

--Incorrect login
EXEC	projeto.logar
		@pLoginName = N'Admin1', 
		@pPassword = N'123',
		@responseMessage = @responseMessage OUTPUT

SELECT	@responseMessage as N'@responseMessage'

--Incorrect password
EXEC	projeto.logar
		@pLoginName = N'Admin', 
		@pPassword = N'1234',
		@responseMessage = @responseMessage OUTPUT

SELECT	@responseMessage as N'@responseMessage'

*/


-------------------------------------
-------------------------------------

-- stored procedure para criar um aluno
DROP PROC projeto.criarAluno
CREATE PROC projeto.criarAluno (@Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Mensalidade INT, @TURMA_Numero INT, @TURMA_ID INT)
AS	
	INSERT INTO projeto.Aluno (Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada, Mensalidade, TURMA_Numero, TURMA_ID) VALUES (@Data_Nasc, @Telemovel, @Nome, @Sexo, @NIF, @Email, @Morada, @Mensalidade, @TURMA_Numero, @TURMA_ID);
GO

-------------------------------------
-------------------------------------

--stored procedure para criar um professor
DROP PROC projeto.criarProfessor
CREATE PROC projeto.criarProfessor (@Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Salario INT, @DISCIPLINA_ID INT)
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



-------------------------------------
-------------------------------------


--stored procedure para adicionar turma ao aluno
DROP PROC projeto.adicionarAlunoTurma
CREATE PROC projeto.adicionarAlunoTurma(@id INT, @TURMA_ID INT, @TURMA_Numero INT)
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

		INSERT INTO projeto.PertenceTurma (CODIGO_Aluno, TURMA_Numero) VALUES (@id, @TURMA_Numero)

	END

GO

--stored procedure para adicionar intrumento ao aluno
DROP PROC projeto.addInstrumento
CREATE PROC projeto.addInstrumento(@id INT, @instrumento VARCHAR(30))
AS	

	IF @id IS NOT NULL
	BEGIN

		IF @id > 99
		BEGIN 
			IF EXISTS (SELECT * FROM projeto.Toca
			   WHERE INTRUMENTO_Nome = @instrumento)
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



-- procedure para dar update ao professor
DROP PROC projeto.updateProfessor
CREATE PROC projeto.updateProfessor (@PROFESSOR_Codigo INT, @Data_Nasc DATE, @Telemovel VARCHAR(15), @Nome VARCHAR(50), @Sexo VARCHAR(20), @NIF INT, @Email VARCHAR(100), @Morada VARCHAR(200), @Salario INT, @DISCIPLINA_ID INT, @inst VARCHAR(30))
AS
	

	UPDATE projeto.Professor 
	SET Data_Nasc = @Data_Nasc, Telemovel = @Telemovel, Nome = @Nome, Sexo = @Sexo, NIF = @NIF, Email = @Email, Morada = @Morada, Salario = @Salario
	WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo

	EXEC projeto.addInstrumento @id=@PROFESSOR_Codigo, @instrumento=@inst
GO




--stored procedure para ver o numero de alunos por professor e retornar 