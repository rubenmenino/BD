-- USE projeto
DELETE FROM projeto.Aluno 	
-- PESSOA_Codigo, Data_Nasc, Telemovel, Nome, Sexo, NIF, Email, Morada	
INSERT INTO projeto.Aluno VALUES 
		('1961-03-26', '910707891', 'João Afonso', 'M', 198254059, 'joaoafonso@gmail.pt', 'Rua Jorge Sena 28', 25, NULL, NULL),
		('1961-09-18', '913433635', 'Ricardo Pereira', 'M', 176225153, 'ricardopereira@ua.pt', 'R Nogueiras 112', 25, NULL, NULL),
		('1962-07-17', '913918064', 'Ruben Menino', 'M', 171506707, 'ruben.menino@ua.pt', 'R Combatentes G Guerra 87', 25, NULL, NULL),
		('1964-01-29', '916478685', 'Gabriel Saudade', 'M', 195021711, 'gabrielsaudade@ua.pt', 'Rua Igreja 120', 25, NULL, NULL),
		('1966-03-17', '915554569', 'José Miguel', 'M', 125074948, 'josemiguel@outlook.pt', 'R Oliveirinhas 80', 25, NULL, NULL),
		('1968-11-11', '921227682', 'Guilherme Tomas', 'M', 179777203, 'gui@ua.pt', 'Rua do Carmo 1', 25, NULL, NULL),
		('1972-05-13', '927387927', 'Augusto Miguel', 'M', 174462379, 'augusto@hotmail.pt', 'Rua da Amélia 34', 25, NULL, NULL),
		('1974-06-01', '926433280', 'José Algarve', 'M', 133888452, 'zeze@ua.pt', 'Rua Andrade da Poeira 45', 25, NULL, NULL),
		('1975-03-31', '924539227', 'João Terra', 'M', 164930280, 'terrajoao@gmail.pt', 'Rua da Santissima Trindade 199', 25, NULL, NULL),
		('1976-06-22', '925001831', 'Gustavo Miguel', 'M', 169833623, 'miguelgustavo@ua.pt', 'Rua da forca 3', 25, NULL, NULL),
		('1976-08-03', '936946112', 'Florinda Leite', 'F', 118741080, 'florescasa@gmail.pt', 'Rua Professor Celso Santos 24', 25, NULL, NULL),
		('1979-04-13', '935528427', 'Maria Alfredo', 'F', 106426150, 'mariaalfredo@ua.pt', 'Rua da macierinha 2', 25, NULL, NULL);
DBCC CHECKIDENT([projeto.Aluno], RESEED, 0)


---------------------------------------------------------------------------------------
DELETE FROM projeto.Professor

INSERT INTO projeto.Professor VALUES
	('1994-05-09', '968413692', 'Sara Correia', 'F', 168387190, 'sarocas@ua.pt', 'Rua dos atletas 1', 600, NULL),
	('1996-05-05', '960053692', 'Joana Matos', 'F', 177730617, 'joaninha335@gmail.pt', 'Rua da escola 64', 600, NULL),
	('1997-07-21', '964382496', 'Juliana Pereira', 'F', 179959476, 'julianaperas@hotmail.pt', 'Rua do nada 1', 600, NULL),
	('1998-06-11', '964781004', 'Rafael Josefina', 'F', 115290540, 'rafaelamulher@outlook.pt', 'Rua Vazia 0', 600, NULL),
	('2000-02-08', '964521446', 'Márcia Joana', 'F', 198674503, 'joaninhamarciana@outlook.pt', 'Rua das nespereiras 69', 600, NULL
	);
	
DBCC CHECKIDENT([projeto.Professor], RESEED, 0)
go

dbcc checkident([projeto.Professor], reseed, 105)

---------------------------------------------------------------------------------------

DELETE FROM projeto.Toca
-- INSTRUMENTO_Nome	, ALUNO_Codigo		
INSERT INTO projeto.Toca VALUES 
		('Trompa', NULL, 1), 
		('Clarinete', 2, NULL), 
		('Clarinete', 3, NULL), 
		('Violino', NULL, 4), 
		('Harpa', 5, NULL), 
		('Trombone',NULL, 6), 
		('Tuba', 7, NULL), 
		('Saxofone', NULL, 8), 
		('Bateria', NULL, 9), 
		('Xilofone', 10, NULL), 
		('Flauta Transversal', 11, NULL), 
		('Maracas', NULL, 12), 
		('Violoncelo', 13, NULL),
		('Triangulo',NULL, 14),
		('Fagote', 15, NULL), 
		('Tambor', 16, NULL), 
		('Bombo', 17, NULL), 
		('Tímpano', 18, NULL),
		('Trompete', 19, NULL), 
		('Trompa', 20, NULL
		);



--------------------------------------------------------------------------------------------

DELETE FROM projeto.Disciplina 
-- ID, Nome, PROFESSOR_Codigo
INSERT INTO projeto.Disciplina VALUES 
		(1, 'Aula Prática', 1),
		(2, 'Aula teórica', 3),
		(3, 'Coro', 6
		);
		
------------------------------------------------------------------------------------------------

DELETE FROM projeto.Participa
-- Representante, ALUNO_CODIGO		
INSERT INTO projeto.Participa VALUES 
		('José Miguel', 1, 100),
		('Rafaela Josefina', 2, 101),
		('Branca Barros', 3, NULL),
		('Gabriel Saudade', NULL, 100),
		('Ruben Menino', NULL, 102),
		('Florinda Delgado', 3, NULL
		);
		

SELECT * FROM projeto.Participa

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Grupo
-- Representante, GRUPO_Tipo, PROFESSOR_Codigo
INSERT INTO projeto.Grupo VALUES 
		('Márcia Joana', 'Ensaio', 100),
		('Augusto Miguel', ' Banda', 102),
		('João Terra', 'Ensaio', 103
		);
		

SELECT * FROM projeto.Grupo

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Turma 
-- Numero, Capacidade, DISCILINA_ID
INSERT INTO projeto.Turma VALUES 
		(1, 20, 1),
		(4, 25, 2),
		(2, 13, 3
		);
		

SELECT * FROM projeto.Turma

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.PertenceDirecao

-- CODIGO_Funcionario, Ano, Cargo		
INSERT INTO projeto.PertenceDirecao VALUES 
		(100, '2012', 'SubPresidente'),
		(104, '2016', 'Tesoureiro'),
		(102, '2010', 'Presidente'),
		(104, '2012', 'SubPresidente'),
		(106, '2016', 'Tesoureiro'),
		(109, '2010', 'Presidente'
		);
		

SELECT * FROM projeto.PertenceDirecao

DELETE FROM projeto.Direcao
INSERT INTO projeto.Direcao VALUES
	('Presidente', 2020),
	('SubPresidente', 2020),
	('Diretor', 2020),
	('Tesoureiro', 2020),
	('Secretario', 2020
	);

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.PertenceTurma
-- CODIGO_Professor	INT,, Ano, Cargo
INSERT INTO projeto.PertenceTurma VALUES 
		(1, 2),
		(2, 2),
		(3, 2
		);
		

SELECT * FROM projeto.PertenceTurma



---------------------------------------------------------------------------------------------------
/*
DELETE FROM projeto.Login
-- Utilizador, PasswordHash
INSERT INTO projeto.Login VALUES 
		('rubenmenino', 'ostea', null, null),
		('paocomatum', 'atumcompao', null, null),
		('presidentejorge', 'omelhorpresidente', null, null
		);
		

SELECT * FROM projeto.Login
*/

---------------------------------------------------------------------------------------------------


