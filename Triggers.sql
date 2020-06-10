/*	
* Gabriel Saudade 89304
* Ruben Menino 
*
*		TRIGGERS
*/



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


GO
CREATE TRIGGER projeto.VerProfessor ON projeto.Professor
AFTER INSERT, UPDATE 
AS	
	IF (EXISTS(SELECT Aluno_Codigo FROM projeto.Aluno WHERE Aluno_Codigo in (SELECT PROFESSOR_Codigo FROM inserted)))
		BEGIN
			RAISERROR ('Professor não pode ser inserido/atualizado - já existe um aluno com esse numero', 16,1);
			ROLLBACK TRAN;
		END

GO
CREATE TRIGGER projeto.VerAluno ON projeto.Aluno 
AFTER INSERT, UPDATE 
AS	
	IF (EXISTS(SELECT PROFESSOR_Codigo FROM projeto.Professor WHERE PROFESSOR_Codigo in (SELECT ALUNO_Codigo FROM inserted)))
		BEGIN
			RAISERROR ('Aluno não pode ser inserido/atualizado - já existe um professor com esse numero.', 16,1);
			ROLLBACK TRAN;
		END


