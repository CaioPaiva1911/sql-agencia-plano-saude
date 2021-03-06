create database db_plano_saude;

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
	id_cliente int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	nome varchar(255) NOT NULL,
	email varchar(128) NOT NULL,
	dt_nascimento date NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);


-- public.tbl_produto definition

-- Drop table

-- DROP TABLE tbl_produto;

CREATE TABLE tbl_produto (
	id_produto int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	codigo_ans int4 NOT NULL,
	descricao varchar(255) NULL,
	valor money NULL,
	CONSTRAINT produto_pk PRIMARY KEY (id_produto)
);

-- public.tbl_dependente definition

-- Drop table

-- DROP TABLE tbl_dependente;

CREATE TABLE tbl_dependente (
	id_depen int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	cliente int4 NOT NULL,
	dependente int4 NOT NULL,
	CONSTRAINT dependente_pk PRIMARY KEY (id_depen),
	CONSTRAINT cliente_fk FOREIGN KEY (cliente) REFERENCES tbl_cliente(id_cliente),
	CONSTRAINT dependente_fk FOREIGN KEY (dependente) REFERENCES tbl_cliente(id_cliente)
);


-- public.tbl_contrato definition

-- Drop table

-- DROP TABLE tbl_contrato;

CREATE TABLE tbl_contrato (
	id_contrato int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_cli_portador int4 NOT NULL,
	id_dependente int4 NULL,
	produto int4 NOT NULL,
	dt_inicio date NOT NULL,
	CONSTRAINT contrato_pk PRIMARY KEY (id_contrato),
	CONSTRAINT dependente_fk FOREIGN KEY (id_dependente) REFERENCES tbl_cliente(id_cliente),
	CONSTRAINT portador_fk FOREIGN KEY (id_cli_portador) REFERENCES tbl_cliente(id_cliente),
	CONSTRAINT produto_fk FOREIGN KEY (produto) REFERENCES tbl_produto(id_produto)
);

insert into tbl_cliente (nome, dt_nascimento, email) values ('Caio Paiva', '2001-11-19', 'caio.paiva@gmail.com');
insert into tbl_cliente (nome, dt_nascimento, email) values ('Gabriel Peres', '1996-01-30', 'gabriel.peres@gmail.com');
insert into tbl_cliente  (nome, dt_nascimento, email) values ('Samuel Peres', '2017-04-28', 'samuel.peres@gmail.com');

insert into tbl_dependente (cliente, dependente) values (2, 3);

insert into tbl_produto (codigo_ans, descricao , valor) values (16, 'TUSS - Procedimentos M??dicos', 160);

insert into tbl_contrato (id_cli_portador, id_dependente, produto, dt_inicio) values (1, 1, 1, current_timestamp);
insert into tbl_contrato (id_cli_portador, id_dependente, produto, dt_inicio) values (2, null, 1, current_timestamp);
insert into tbl_contrato (id_cli_portador, id_dependente, produto, dt_inicio) values (2, 3, 1,current_timestamp);

select * from tbl_cliente tc; 
select * from tbl_dependente td;
select * from tbl_contrato tc;
