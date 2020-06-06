-- TRIGGERS 


GO
CREATE Trigger removePrevious ON projeto.Toca
	AFTER INSERT, UPDATE
		AS
		BEGIN
			DECLARE @INSTRUMENTO_Nome AS VARCHAR(30);
			DECLARE @ALUNO_Codigo AS INT;
			
			SELECT @INSTRUMENTO_Nome, @ALUNO_Codigo FROM inserted;


			if @ALUNO_Codigo IN (SELECT ALUNO_Codigo FROM projeto.Toca WHERE ALUNO_Codigo = @ALUNO_Codigo)
			BEGIN
				DELETE FROM projeto.Toca  WHERE ALUNO_Codigo = @ALUNO_Codigo
				DELETE FROM projeto.Aluno WHERE ALUNO_Codigo = @ALUNO_Codigo
			END


			INSERT INTO projeto.Toca(INTRUMENTO_Nome, ALUNO_Codigo, PROFESSOR_Codigo) VALUES(@INSTRUMENTO_Nome, @ALUNO_Codigo, null)
		END

GO


