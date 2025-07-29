create database hotel;

create table funcionario(
funcionario_id serial primary key,
nome varchar (30),
cpf char (11),
cargo_id int
);

create table cargo(
cargo_id serial primary key,
nome varchar (30)
);

create table hospede(
hospede_id serial primary key,
nome varchar (30),
cpf char (11),
endereco_id int
);

create table endereco (
endereco_id serial primary key,
logradouro varchar (30),
localidade varchar (30),
cep char (8),
numero char (4),
bairro varchar (30),
uf varchar (30)
);

create table agenda(
agenda_id serial primary key,
data_checkount date,
hospede_id int,
funcionario_id int
);

ALTER TABLE agenda
ADD data_checkin date;

ALTER TABLE agenda
RENAME COLUMN data_checkount TO data_checkout;

ALTER TABLE funcionario
ADD CONSTRAINT fk_cargo
FOREIGN KEY (cargo_id)
REFERENCES cargo(cargo_id);

ALTER TABLE hospede
ADD CONSTRAINT fk_endereco
FOREIGN KEY (endereco_id)
REFERENCES endereco(endereco_id);

ALTER TABLE agenda
ADD CONSTRAINT fk_hospede
FOREIGN KEY (hospede_id)
REFERENCES hospede(hospede_id);

ALTER TABLE agenda
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_id)
REFERENCES funcionario(funcionario_id);

insert into funcionario (funcionario_id, nome, cpf, cargo_id) values
(1, 'João da Silva', '12345678900', 1),
(2, 'Maria Oliveira', '98765432100', 2),
(3, 'Carlos Mendes', '11122233344', 3),
(4, 'Fernanda Costa', '55566677788', 4),
(5, 'Ricardo Lima', '99988877766', 5);

insert into cargo (cargo_id, nome) values
(1, 'Recepcionista'),
(2, 'Gerente'),
(3, 'Camareira'),
(4, 'Segurança'),
(5, 'Concierge');

insert into hospede (hospede_id, nome, cpf, endereco_id) values
(1, 'Ana Paula', '22233344455', 1),
(2, 'Bruno Santos', '33344455566', 2),
(3, 'Carla Nunes', '44455566677', 3),
(4, 'Daniel Rocha', '55566677788', 4),
(5, 'Elisa Martins', '66677788899', 5);

insert into endereco (endereco_id, logradouro, localidade, cep, numero, bairro, uf) values
(1, 'Rua das Flores', 'São Paulo', '01001000', '123', 'Centro', 'SP'),
(2, 'Av. Brasil', 'Rio de Janeiro', '20040001', '456', 'Copacabana', 'RJ'),
(3, 'Rua das Palmeiras', 'Belo Horizonte', '30130010', '789', 'Savassi', 'MG'),
(4, 'Av. Independência', 'Porto Alegre', '90010001', '101', 'Moinhos', 'RS'),
(5, 'Rua 7 de Setembro', 'Curitiba', '80020300', '202', 'Centro', 'PR');

insert into agenda (agenda_id, data_checkin, data_checkout, hospede_id, funcionario_id) values
(1, '2025-08-01', '2025-08-05', 1, 1),
(2, '2025-08-06', '2025-08-10', 2, 2),
(3, '2025-08-11', '2025-08-13', 3, 3),
(4, '2025-08-14', '2025-08-18', 4, 4),
(5, '2025-08-19', '2025-08-23', 5, 5);

select count(*) from funcionario f;

select * from hospede h where h.nome '%a%';