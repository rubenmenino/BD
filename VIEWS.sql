-- view para mostrar a lista de alunos
DROP VIEW listaAlunos
CREATE VIEW listaAlunos AS
SELECT projeto.Aluno.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Aluno
left JOIN projeto.Toca
ON Toca.ALUNO_Codigo = ALUNO.ALUNO_Codigo


----------------------------------------------------------------
----------------------------------------------------------------

---- view para mostrar a lista de professores 
drop view listaProfessores
CREATE VIEW listaProfessores AS
SELECT projeto.Professor.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Professor
inner JOIN projeto.Toca
ON Toca.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo


select * from projeto.Toca

CREATE VIEW listaProfs AS
SELECT * FROM projeto.Professor
GO
-----------------------------------------------------------------
-----------------------------------------------------------------

--- view para mostrar os Eventos Aceites

DROP VIEW listaEventosAceites
CREATE VIEW listaEventosAceites
AS
	SELECT projeto.Evento.*  FROM projeto.Evento
	INNER JOIN projeto.Request
	ON Evento.Aceite = Request.Aceite
GO




CREATE VIEW listaEventos
AS
	SELECT projeto.Evento.* FROM projeto.Evento
GO
