create database aula17;

create table categoria(
	categoria_id serial,
	nome varchar (100),
	ultima_atualizacao timestamp
);
create table filme_categoria(
	filme_id int,
	categoria_id int,
	ultima_atualizacao timestamp
);

create table filme(
	filme_id serial,
	titulo varchar (50),
	descricao text,
	ano_lancamento char (4),
	idioma_id int,
	duracao_aluguel int,
	taxa_aluguel numeric (4,2),
	duracao int,
	multa numeric (4,2),
	classificacao_indicativa numeric (4,2),
	ultima_atualizacao timestamp, 
	recursos_especiais text,
	roteiro text
);
	
create table idioma(
	idioma_id serial,
	nome varchar (20),
	ultima_atualizacao timestamp
);
	
create table ator_filme(
	ator_id int,
	filme_id int,
	ultima_atualizacao timestamp
);
	
create table inventario(
	inventario_id serial,
	filme_id int,
	historia_id int,
	ultima_atualizacao timestamp
);

create table aluguel(
	aluguel_ serial,
	data_aluguel timestamp,
	inventario_id int,
	cliente_id int,
	data_retorno timestamp,
	funcionario_id int,
	ultima_atualizacao timestamp
);

create table pagamento (
	pagamento_id serial,
	cliente_id int,
	funcionario_id int,
	aluguel_id int,
	preco numeric (4,2),
	data_pagamento timestamp
);

create table funcionario (
	funcionario_id serial,
	primeiro_nome varchar (20),
	segundo_nome varchar (80),
	endereco_id int,
	email varchar (60), 
	loja_id int,
	ativo bool,
	nome_usuario varchar (20),
	senha char (10),
	ultima_atualizacao timestamp,
	foto bytea
);

create table ator (
	ator_id serial,
	primeiro_nome varchar (20),
	segundo_nome (20),
	ultima_atualizacao timestamp
);

create table cliente (
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar (20),
	segundo_nome varchar (20),
	email varchar (60),
	endereco_id int,
	ativo bool,
	data_criacao timestamp,
	ultima_atualizacao timestamp
);

create table endereco(
	endereco_id serial,
	endereco varchar (50),
	endereco2 varchar (50),
	distrito varchar (20),
	city_id int,
	codigo_postal char (8),
	telefone char (11),
	ultima_atualizacao timestamp
);

create table cidade(
	cidade_id serial,
	cidade varchar (30),
	pais_id int,
	ultima_atualizxacao, timestamp
);

create table pais (
	pais_id serial,
	pais varchar (10),
	ultima_atualizacao
);

create table loja(
	loja_id serial,
	gerente_id int,
	endereco_id int,
	ultima_atualizacao timestamp
);

--romover coluna
alter table loja drop column ultima_atualizacao;

--adicionar coluna
alter table loja add column ultima_atualizacao timestamp;

--renomear coluna
alter table loja rename column ult_atual
	to ultima_atualizacao;

--alternar o tipo de dado da coluna
alter table loja alter column ultima_atualizacao 
	set data type timestamp;

--criação de chaves primárias
alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table idioma add primary key (idioma_id);
alter table inventario add primary key (inventario_id);
alter table pais add primary key (pais_id);
alter table ator add primary key (ator_id);
alter table cidade add primary key (cidade_id);
alter table loja add primary key (loja_id);
alter table pagamento add primary key (pagamento_id);
alter table endereco add primary key (endereco_id);
alter table cliente add primary key (cliente_id);
alter table funcionario add primary key (funcionario_id);
alter table aluguel add primary key (aluguel_id);

--criação de chaves estrangeiras
alter table filme_categoria
add constraint fk_categoria
foreign key (categoria_id)
reference categoria(categoria_id);

alter table filme_categoria 
add constraint fk_filme 
foreign key (filme_id)
reference filme(filme_id);

alter table filme
add constraint fk_linguagem 
foreign key (linguagem_id)
reference linguagem(linguagem_id);

alter table ator_filme
add constraint fk_atot
foreign key (ator_id)
reference ator(ator_id);

alter table ator_filme 
add constraint fk_filme
foreign key (filme_id)
reference filme(filme_id)

alter table inventario
add constraint fk_filme
foreign key (filme_id)
reference filme(filme_id);

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
reference inventario(inventario_id);

alter table pagamento
add constraint fk_aluguel
foreign key (aluguel_id)
reference aluguel(aluguel_id);

alter table pagamento
add constraint fk_funcionario
foreign key (funcionario_id)
reference funcionario(funcionario_id);

alter table funcionario
add constraint fk_loja
foreign key (categoria_id)
reference categoria(categoria_id);

alter table funcionario
add constraint fk_endereco
foreign key (categoria_id)
reference categoria(categoria_id);

alter table endereco
add constraint fk_
foreign key (categoria_id)
reference categoria(categoria_id);