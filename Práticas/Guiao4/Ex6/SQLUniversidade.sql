create table Projeto_Investigacao(
	id INT PRIMARY KEY NOT NULL,
	nome VARCHAR(60) NOT NULL,
	entidade_financiadora VARCHAR(60),
	data_inicio date,
	data_fim date,
	orçamento money,
	/*orientador INT REFERENCES Professor(nmec)*/
);

create table Professor(
	nmec INT PRIMARY KEY NOT NULL,
	nome VARCHAR(60) NOT NULL,
	data_nasc DATE,
	cat_profissional VARCHAR(200),
	area_cientifica VARCHAR(200),
	id_projeto INT REFERENCES Projeto_Investigacao(id)
);

create table Departamento(
	nome_dep VARCHAR(60) PRIMARY KEY NOT NULL,
	localizacao INT,
	n_prof INT REFERENCES Professor(nmec)
);

create table Grau_de_Formacao(
	tipo VARCHAR(200) PRIMARY KEY
);

create table Estudante_Graduado(
	nmec_estudante INT PRIMARY KEY NOT NULL,
	nome_aluno VARCHAR(60) NOT NULL,
	data_nasc_aluno date,
	dep_associado VARCHAR(60) REFERENCES Departamento(nome_dep),
	graduacao VARCHAR(200) REFERENCES Grau_de_Formacao(tipo)
);

create table Supervisao(
	projeto_ref INT REFERENCES Projeto_Investigacao(id),
	aluno_nmec INT REFERENCES Estudante_Graduado(nmec_estudante),
	prof_nmec INT REFERENCES Professor(nmec)
);