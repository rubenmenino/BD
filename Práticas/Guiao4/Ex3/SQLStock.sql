create table Fornecedor(
	nif INT PRIMARY KEY NOT NULL,
	endereço varchar(60) UNIQUE NOT NULL,

	nome VARCHAR(60) NOT NULL,
	numero_fax INT,
	cond_pagamento VARCHAR(400) NOT NULL 
);

create table Tipo_Fornecedor(
	code INT PRIMARY KEY NOT NULL,
	design VARCHAR(100),
	nif_fornecedor INT REFERENCES Fornecedor(nif) NOT NULL
);

create table Encomenda(
	n_encomenda INT PRIMARY KEY NOT NULL,
	forn_unique VARCHAR(60) NOT NULL,
	data_encomenda DATETIME,
	nif_enc INT REFERENCES Fornecedor(nif) 
);

create table Produto(
	code_produto INT PRIMARY KEY NOT NULL,
	nome VARCHAR(60),
	price money,
	n_enc_produto INT REFERENCES Encomenda(n_encomenda),
	taxaIva real
);