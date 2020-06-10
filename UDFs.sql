/*	
* Gabriel Saudade 89304
* Ruben Menino 
*
*		UDF
*/


-- Retorna o número de alunos de um professor
DROP FUNCTION projeto.getCountAlunosProf CREATE FUNCTION projeto.getCountAlunosProf(@PROFESSOR_Codigo SMALLINT)RETURNS INT AS BEGIN 	DECLARE @returnValue INT;		SET @returnValue = (SELECT COUNT (ALUNO_Codigo) from projeto.alunInst		WHERE INTRUMENTO_Nome = (SELECT INTRUMENTO_Nome FROM projeto.profInst WHERE PROFESSOR_Codigo = @PROFESSOR_Codigo))	IF @returnValue = NULL	BEGIN		RETURN 0	END	RETURN @returnValue * 25END


SELECT projeto.getCountAlunosProf(149);



