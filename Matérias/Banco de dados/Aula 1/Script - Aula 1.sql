-- criar branco de dados
create database sptech;

-- coloca o database em uso
use sptech;

-- criar tabela empresa
create table empresa(
id_empresa int primary key,
nome varchar(50),
responsavel varchar(30)
);

-- consultar a tabela
select * from empresa;
--
insert into empresa(id_empresa, nome, responsavel)
values (1, 'STEFANINI', 'KELLY');
--
insert into empresa(id_empresa, nome, responsavel)
values (2, 'RAPPI', 'JORGE'), 
	   (3, 'C6', 'RODOLFO'),
       (4, 'ACCENTURE', 'BRIAN');
       