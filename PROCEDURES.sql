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

go 

CREATE PROCEDURE projeto.MostrarAlunos
AS
	SELECT * FROM projeto.Aluno
	RETURN
GO

CREATE PROCEDURE projeto.MostrarProfessores
AS
	SELECT * FROM projeto.Professor
	RETURN
GO

CREATE PROCEDURE projeto.MostrarEventos
AS
	SELECT * FROM projeto.Evento
	RETURN
GO
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





