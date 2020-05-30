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



--------------------------------------------------------------------------------------

DELETE FROM projeto.Funcionario

INSERT INTO projeto.Funcionario VALUES
		('1985-11-28', '938180364', 'Branca Barros', 'F', 184164702, 'brancadeneve@gmail.pt', 'Rua da venezuela 44', 600, 'BBarros'),
		('1987-09-14', '936404711', 'Marina Brum', 'F', 135860709, 'marianbubum@ua.pt', 'Rua da gafanha 3', 600, 'MBrum'),
		('1987-11-09', '931503621', 'Salomé Delgado', 'F', 145093360, 'salamedechocolate@hotmail.pt', 'Rua da gafanha da nazare 3', 600, 'SDelgado'
		);
		
DBCC CHECKIDENT([projeto.Funcionario], RESEED, 0)

---------------------------------------------------------------------------------------
DELETE FROM projeto.Professor

INSERT INTO projeto.Professor VALUES
	('1994-05-09', '968413692', 'Sara Correia', 'F', 168387190, 'sarocas@ua.pt', 'Rua dos atletas 1', 600, NULL, NULL, NULL ),
	('1996-05-05', '960053692', 'Joana Matos', 'F', 177730617, 'joaninha335@gmail.pt', 'Rua da escola 64', 600, NULL, NULL, NULL),
	('1997-07-21', '964382496', 'Juliana Pereira', 'F', 179959476, 'julianaperas@hotmail.pt', 'Rua do nada 1', 600, NULL, NULL, NULL),
	('1998-06-11', '964781004', 'Rafael Josefina', 'F', 115290540, 'rafaelamulher@outlook.pt', 'Rua Vazia 0', 600, NULL, NULL, NULL),
	('2000-02-08', '964521446', 'Márcia Joana', 'F', 198674503, 'joaninhamarciana@outlook.pt', 'Rua das nespereiras 69', 600, NULL, NULL, NULL
	);
	
DBCC CHECKIDENT([projeto.Professor], RESEED, 0)
go

dbcc checkident([projeto.Professor], reseed, 105)
---------------------------------------------------------------------------------------

DELETE FROM projeto.Toca1 
-- INSTRUMENTO_Nome	, ALUNO_Codigo		
INSERT INTO projeto.Toca1 VALUES 
		('Trompa', 1), 
		('Clarinete', 2), 
		('Clarinete', 3), 
		('Violino', 4), 
		('Harpa', 5), 
		('Trombone', 6), 
		('Tuba', 7), 
		('Saxofone', 8), 
		('Bateria', 9), 
		('Xilofone', 10), 
		('Flauta Transversal', 11), 
		('Maracas', 12), 
		('Violoncelo', 13),
		('Triangulo', 14),
		('Fagote', 15), 
		('Tambor', 16), 
		('Bombo', 17), 
		('Tímpano', 18),
		('Trompete', 19), 
		('Trompa', 20
		);


SELECT * FROM projeto.Toca1

----------------------------------------------------------------------------------------

DELETE FROM projeto.Toca2 
-- INSTRUMENTO_Nome	VARCHAR(30), PROFESSOR_Codigo
INSERT INTO projeto.Toca2 VALUES 
		('Sininho', 1),
		('Trompete', 2),
		('Bombo', 3),
		('Bombo', 4),
		('Violino', 5), 
		('Violoncelo', 6),  
		('Fagote', 7),
		('Tuba', 8), 
		('Tambor', 9),
		('Clarinete', 10), 
		('Trompete', 11),
		('Trompa', 12), 
		('Oboe', 13), 
		('Harpa', 14), 
		('Violino', 15), 
		('Saxofone', 16), 
		('Maracas', 17), 
		('Flauta Transversal', 18),
		('Xilofone' , 19), 
		('Trombone' , 20
		);

SELECT * FROM projeto.Toca2
WHERE INSTRUMENTO_Nome = 'Bombo'

-------------------------------------------------------------------------------------------

DELETE FROM projeto.Instrumento 
-- INSTRUMENTO_Nome, INSTRUMENTO_Tipo
INSERT INTO projeto.Instrumento VALUES 
		
		('Oboe', 'Sopro'),
		('Bombo', 'Percussão'),
		('Trompete', 'Metais'),
		('Sininho', 'Percussão'),
		('Tambor', 'Percussão'),
		('Fagote', 'Sopro'),
		('Violino', 'Cordas'),
		('Violoncelo', 'Cordas'),
		('Maracas', 'Percussão'),
		('Saxofone', 'Sopro'),
		('Flauta Transversal', 'Sopro'),
		('Bateria', 'Percussão'),
		('Xilofone', 'Percussão'),
		('Tuba', 'Metais'),
		('Trombone', 'Metais'),
		('Harpa', 'Cordas'),
		('Clarinete', 'Sopro'),
		('Trompa', 'Metais'),
		('Pandeiro', 'Percussão'),
		('Tímpano', 'Percussão'
		);

SELECT * FROM projeto.Instrumento

SELECT Toca1.INSTRUMENTO_Nome, ALUNO_Codigo, INSTRUMENTO_Tipo FROM projeto.Instrumento
INNER JOIN projeto.Toca1 ON Instrumento.INSTRUMENTO_Nome = Toca1.INSTRUMENTO_Nome
WHERE Instrumento.INSTRUMENTO_Nome= 'Bombo'

--------------------------------------------------------------------------------------------

DELETE FROM projeto.Disciplina 
-- ID, Nome, PROFESSOR_Codigo
INSERT INTO projeto.Disciplina VALUES 
		(1, 'Aula Prática', 1),
		(2, 'Aula teórica', 3),
		(3, 'Coro', 6
		);
		

SELECT * FROM projeto.Disciplina

------------------------------------------------------------------------------------------------

DELETE FROM projeto.Participa1 
-- Representante, ALUNO_CODIGO		
INSERT INTO projeto.Participa1 VALUES 
		('José Miguel', 1),
		('Rafaela Josefina', 2),
		('Branca Barros', 3
		);
		

SELECT * FROM projeto.Participa1

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Participa2
-- Representante, PROFESSOR_CODIGO	
INSERT INTO projeto.Participa2 VALUES 
		('Gabriel Saudade', 1),
		('Ruben Menino', 2),
		('Florinda Delgado', 3
		);
		
SELECT * FROM projeto.Participa2

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Grupo
-- Representante, GRUPO_Tipo, PROFESSOR_Codigo
INSERT INTO projeto.Grupo VALUES 
		('Márcia Joana', 'Ensaio', 1),
		('Augusto Miguel', ' Banda', 2),
		('João Terra', 'Ensaio', 3
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

DELETE FROM projeto.Pertence1 
-- CODIGO_Funcionario, Ano, Cargo		
INSERT INTO projeto.Pertence1 VALUES 
		(1, '2012', 'SubPresidente'),
		(4, '2016', 'Tesoureiro'),
		(2, '2010', 'Presidente'
		);
		

SELECT * FROM projeto.Pertence1

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Pertence2
-- CODIGO_Professor	INT,, Ano, Cargo
INSERT INTO projeto.Pertence2 VALUES 
		(4, '2012', 'SubPresidente'),
		(6, '2016', 'Tesoureiro'),
		(9, '2010', 'Presidente'
		);
		

SELECT * FROM projeto.Pertence2

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Direcao
-- Cargo, Ano	
INSERT INTO projeto.Direcao VALUES 
		( 'SubPresidente', '2012'),
		('Tesoureiro', '2016'),
		('Presidente', '2010'
		);
		

SELECT * FROM projeto.Direcao

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Login
-- Utilizador, PasswordHash
INSERT INTO projeto.Login VALUES 
		('rubenmenino', 'ostea', null, null),
		('paocomatum', 'atumcompao', null, null),
		('presidentejorge', 'omelhorpresidente', null, null
		);
		

SELECT * FROM projeto.Login

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Request
-- Ano, PROFESSOR_Codigo, Aceite
INSERT INTO projeto.Request VALUES 
		('2016', 4, 0),
		('2012', 6, 1),
		('2010', 9, 1
		);
		

SELECT * FROM projeto.Request

---------------------------------------------------------------------------------------------------

DELETE FROM projeto.Funcionario

INSERT INTO projeto.Funcionario VALUES
	(400, 3, 'rubenmenino'),
	(500, 2, 'paocomatum'
	);

SELECT * FROM projeto.Funcionario

SELECT Nome, Sexo, NIF, Telemovel, Email, Morada FROM projeto.Pessoa INNER JOIN projeto.Funcionario ON Pessoa.PESSOA_Codigo = Funcionario.FUNCIONARIO_Codigo


SELECT Nome, Sexo, NIF, Telemovel, Email, Morada FROM projeto.Pessoa INNER JOIN projeto.Funcionario ON Pessoa.PESSOA_Codigo = Funcionario.FUNCIONARIO_Codigo



INSERT INTO projeto.Aluno (ALUNO_Codigo)
(select Nome, Sexo, NIF, Telemovel, Email, Morada
FROM projeto.Pessoa INNER JOIN projeto.Funcionario ON Pessoa.PESSOA_Codigo = Funcionario.FUNCIONARIO_Codigo) 
	
