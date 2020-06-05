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