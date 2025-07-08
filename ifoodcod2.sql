create table cliente(
	cliente_id serial,
	pedido_id serial,
	email varchar(60),
	nome_completo varchar(60),
	telefone char(11),
	ultima_atualizacao timestamp
);
	
create table categoria (
	categoria_id serial,
	loja_id int,
	nome varchar (30),
	ultima_atualizacao timestamp);

create table pedido(
	pedido_id serial,
	restaurante_id serial,
	funcionario_id serial,
	forma_pagamento varchar(20),
	valor numeric(4,2),
	taxa_entrega numeric(4,2),
	ultima_atualizacao timestamp
);

create table loja(
	restaurante_id serial,
	endereco_id int,
	funcionario_id int,
	pedido_id int,
	ultima_atualizacao timestamp,
	ativo bool
);

create table funcionario(
	funcionario_id serial,
	pedido_id int,
	restaurante_id int,
	pagamento numeric (5,2),
	descricao_prato varchar (50),
	ultima_atualizacao timestamp
);



alter table loja rename column restaurante_id to loja_id;

alter table funcionario rename column restaurante_id to loja_id;

alter table pedido rename column restaurante_id to loja_id;

alter table loja drop column endereco_id;

alter table loja add column categoria_id int;

alter table cliente add primary key (cliente_id);
alter table categoria add primary key (categoria_id);
alter table pedido add primary key (pedido_id);
alter table loja add primary key (loja_id);
alter table funcionario add primary key (funcionario_id);

alter table cliente
add constraint fk_pedido
foreign key (pedido_id)
references pedido(pedido_id);

alter table loja
add constraint fk_pedido
foreign key (pedido_id)
references pedido(pedido_id);

alter table funcionario 
add constraint fk_pedido
foreign key (pedido_id)
references pedido(pedido_id);

alter table categoria
add constraint fk_loja
foreign key (loja_id)
references loja(loja_id);

alter table loja
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id);

--LOJAS QUE VENDEM BEBIDAS (CATEGORIA BEBIDA NO IFOOD)--
select
	count(*) as "lojas no ifood"
from
	loja l
inner join categoria c 
on
	c.categoria_id = l.categoria_id
where
	c.nome = 'bebidas';

--Todos os clientes e seus pedidos na loja --
SELECT 
  c.nome_completo as cliente,
  p.pedido_id as pedido,
  p.valor,
  p.forma_pagamento 
FROM cliente c
JOIN pedido p ON c.pedido_id = p.pedido_id
JOIN loja l ON p.loja_id = l.loja_id;

--- Quantos pedidos o cliente fez?
select
	cliente_id,
	count(pedido_id) as total_pedidos
from
	cliente c
group by
	cliente_id;
  
---




















