CREATE DATABASE db_plano_saude;
-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

-- DROP SEQUENCE public.tbl_cliente_id_cliente_seq;

CREATE SEQUENCE public.tbl_cliente_id_cliente_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.tbl_contrato_id_contrato_seq;

CREATE SEQUENCE public.tbl_contrato_id_contrato_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.tbl_dependente_id_depen_seq;

CREATE SEQUENCE public.tbl_dependente_id_depen_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.tbl_produto_id_produto_seq;

CREATE SEQUENCE public.tbl_produto_id_produto_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.tbl_cliente definition

-- Drop table

-- DROP TABLE tbl_cliente;

CREATE TABLE tbl_cliente (
	id_cliente serial4 NOT NULL,
	nome varchar(255) NOT NULL,
	email varchar(128) NOT NULL,
	dt_nascimento date NOT NULL,
	CONSTRAINT tbl_cliente_pkey PRIMARY KEY (id_cliente)
);


-- public.tbl_produto definition

-- Drop table

-- DROP TABLE tbl_produto;

CREATE TABLE tbl_produto (
	id_produto serial4 NOT NULL,
	codigo_ans int4 NOT NULL,
	descricao varchar(255) NULL,
	valor money NULL,
	CONSTRAINT tbl_produto_pkey PRIMARY KEY (id_produto)
);


-- public.tbl_contrato definition

-- Drop table

-- DROP TABLE tbl_contrato;

CREATE TABLE tbl_contrato (
	id_contrato serial4 NOT NULL,
	cliente int4 NOT NULL,
	produto int4 NOT NULL,
	dt_inicio date NULL,
	CONSTRAINT tbl_contrato_pkey PRIMARY KEY (id_contrato),
	CONSTRAINT tbl_contrato_cliente_fkey FOREIGN KEY (cliente) REFERENCES tbl_cliente(id_cliente),
	CONSTRAINT tbl_contrato_produto_fkey FOREIGN KEY (produto) REFERENCES tbl_produto(id_produto)
);


-- public.tbl_dependente definition

-- Drop table

-- DROP TABLE tbl_dependente;

CREATE TABLE tbl_dependente (
	id_depen serial4 NOT NULL,
	cliente int4 NOT NULL,
	dependente int4 NOT NULL,
	CONSTRAINT tbl_dependente_pkey PRIMARY KEY (id_depen),
	CONSTRAINT tbl_dependente_cliente_fkey FOREIGN KEY (cliente) REFERENCES tbl_cliente(id_cliente),
	CONSTRAINT tbl_dependente_dependente_fkey FOREIGN KEY (dependente) REFERENCES tbl_cliente(id_cliente)
);


insert into tbl_cliente (nome, dt_nascimento, email) values ('Caio Paiva', '2001-11-19', 'caio.paiva@gmail.com');
insert into tbl_cliente (nome, dt_nascimento, email) values ('Gabriel Peres', '1996-01-30', 'gabriel.peres@gmail.com');
insert into tbl_cliente  (nome, dt_nascimento, email) values ('Samuel Peres', '2017-04-28', 'samuel.peres@gmail.com');

insert into tbl_dependente (cliente, dependente) values (2, 3);

insert into tbl_produto (codigo_ans, descricao , valor) values (16, 'TUSS - Procedimentos Médicos', 160);

insert into tbl_contrato (cliente, produto, dt_inicio) values (1, 1, '2020-09-25');


select * from tbl_cliente tc; 
select * from tbl_dependente td;
