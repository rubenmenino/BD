-- view para mostrar a lista de alunos

CREATE VIEW listaAlunos AS
SELECT projeto.Aluno.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Aluno
INNER JOIN projeto.Toca
ON Toca.ALUNO_Codigo = ALUNO.ALUNO_Codigo


----------------------------------------------------------------
----------------------------------------------------------------

---- view para mostrar a lista de professores 
-- nao consegui por a mostrar os intrumentos, idk why
drop view listaProfessores
CREATE VIEW listaProfessores AS
SELECT projeto.Professor.*, projeto.Toca.INTRUMENTO_Nome
FROM projeto.Professor
INNER JOIN projeto.Toca
ON Toca.PROFESSOR_Codigo = Professor.PROFESSOR_Codigo
