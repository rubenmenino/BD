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
LEFT JOIN projeto.Toca
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



DROP VIEW listaEventos
CREATE VIEW listaEventos
AS
	SELECT projeto.Evento.*, projeto.Request.PROFESSOR_Codigo 
	FROM projeto.Evento
	INNER JOIN projeto.Request
	ON Evento.EVENTO_Nome = Request.EVENTO_Nome_rq
GO


DROP VIEW listaTurma
CREATE VIEW listaTurma
AS
	SELECT projeto.Turma.*
	FROM projeto.Turma


-------------------------------------------------- instrumentos professores
drop view projeto.profInst 
CREATE VIEW projeto.profInst 
AS
	SELECT projeto.Professor.PROFESSOR_Codigo, projeto.Toca.INTRUMENTO_Nome 
	FROM projeto.Professor
	inner JOIN projeto.Toca
	ON Toca.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo
	
	
	
	-- instrumentos alunos
	drop view projeto.alunInst
	CREATE VIEW projeto.alunInst 
	AS
	SELECT projeto.Aluno.ALUNO_Codigo, projeto.Aluno.Nome, projeto.Aluno.Telemovel, projeto.Toca.INTRUMENTO_Nome
	FROM projeto.Aluno
	inner JOIN projeto.Toca
	ON Toca.ALUNO_Codigo = Aluno.ALUNO_Codigo

-- lista de alunos do professor x
DROP VIEW projeto.listaDeAlunosPorProfessor