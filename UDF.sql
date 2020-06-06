/*  TESTAR DEPOIS

GO
-- obter o organizaor do evento
DROP FUNCTION projeto.getCriadorEvento
CREATE FUNCTION projeto.getCriadorEvento (@PROFESSOR_Codigo SMALLINT) RETURNS @ReturnValues TABLE (Evento_Nome VARCHAR(30), Local VARCHAR(30), EVENTO_inicio date, EVENTO_fim date)
AS
	BEGIN
		INSERT @ReturnValues 
		SELECT Evento_Nome, Local, EVENTO_inicio, EVENTO_fim
		FROM projeto.Evento
		INNER JOIN projeto.Request ON Evento.Aceite = Request.Aceite
		INNER JOIN projeto.Professor ON Request.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo
		WHERE Professor.PROFESSOR_Codigo = @PROFESSOR_Codigo
		RETURN;
	END

SELECT * FROM projeto.getCriadorEvento(101);

*/

DROP FUNCTION projeto.getCountAlunosProf CREATE FUNCTION projeto.getCountAlunosProf(@PROFESSOR_Codigo SMALLINT)RETURNS INT AS BEGIN 	DECLARE @returnValue INT;		SET @returnValue = (SELECT COUNT (ALUNO_Codigo) from projeto.alunInst		WHERE INTRUMENTO_Nome = (SELECT INTRUMENTO_Nome FROM projeto.profInst WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo))	RETURN @returnValueEND


SELECT projeto.getCountAlunosProf(149);
