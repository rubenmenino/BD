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
