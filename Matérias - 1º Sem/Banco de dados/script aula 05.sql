-- primeiros comandos - continuação
-- criar database
-- Etapa 1
create database sprint1;
-- colocar o database em uso
-- Etapa 2
use sprint1;
/*
criar a tabela de empresa 
onde o auto increment inicie a partir de 100
*/
-- Etapa 3  -  NOT NULL
CREATE TABLE empresa (    
     id              INT auto_increment,    
     nome            VARCHAR(40) not null,
     representante   varchar(40),
     primary key chave(id)
) auto_increment=100;  -- parametro opcional, se não informado inicia em 1
-- inserir dados na tabela empresa
-- Etapa 4
insert into empresa (nome, representante) 
values ('Tivit', 'João'),
	   ('Accenture', 'José'),
	   ('Rappi', 'Marta'),
	   ('Raizen', 'Maria Alice'),
	   ('C6 Bank', 'Mariana'),
	   ('Banco Safra', 'Sandra'),
	   ('Deloitte', 'Giovanni'),
	   ('Elera', 'Vera'),
	   ('Sptech', 'Alessandro');
       
alter table empresa add primary key(id);
select * from empresa;

alter table empresa modify id int auto_increment primary key;
-- Etapa 5
-- inserir uma nova empresa sem o nome da empresa
-- Etapa 4
insert into empresa (nome, representante) 
values (null, 'Joaozinho');
/*

Error Code: 1048. Column 'nome' cannot be null

*/
-- ETAPA 5
-- criar indice em uma tabela nova -- PRIMARY KEY e INDICE
CREATE TABLE curso (
  id int NOT NULL AUTO_INCREMENT,
  sigla varchar(10) NOT NULL,
  nome  varchar(100) NOT NULL,
  PRIMARY KEY (id),
  KEY ix_curso (sigla)
);
-- Etapa 4
insert into curso (sigla, nome)
values ('ADS', 'Análise Desenvolvimento de Sistemas'),
       ('SIS', 'Sistema da Informação'),
       ('CCO', 'Ciência da Computação');   
--       
insert into curso (sigla, nome)
values ('ADS', 'Administração de Dados e Segurança');       
       
-- verificar o funcionamento do indice
explain
select * from curso where sigla = 'CCO';
--
-- apagar indice
drop index ix_curso on curso;
-- verificar o funcionamento do indice
explain
select * from curso where sigla = 'CCO';

-- criar indice após a tabela ja estar criada
create index ix_curso on curso(sigla);

-- indice em mais de uma coluna
create index ix_curso_01 on curso(sigla, nome);
-- apagar a tabela curso
drop table curso;
-- ETAPA 6 -- 	INDICE UNICO
-- criar indice unico ou alternate key em uma tabela nova

CREATE TABLE curso (
  id int NOT NULL AUTO_INCREMENT,
  sigla varchar(10) NOT NULL,
  nome  varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE ix_curso (sigla)
);	
-- incluir cursos
insert into curso (sigla, nome)
values ('ADS', 'Análise Desenvolvimento de Sistemas'),
       ('SIS', 'Sistema da Informação'),
       ('CCO', 'Ciência da Computação');  
-- exibir erro de unique       
insert into curso (sigla, nome)
values ('ADS', 'Administração de Dados e Segurança');
/*

Error Code: 1062. Duplicate entry 'ADS' for key 'curso.ix_curso'

*/
-- apagar indice
drop index ix_curso on curso;

-- criar indice unico após a tabela ja estar criada
create unique index ix_curso on curso(sigla);

-- criar a tabela aluno -- DEFAULT
CREATE TABLE aluno (
  ra char(08) NOT NULL,
  nome  varchar(100) NOT NULL,
  situacao varchar(10) not null default 'Ativo',
  PRIMARY KEY (ra)
);

-- inserir alunos
insert into aluno(ra, nome)
values ('01241221', 'AMANDA'),
		('01241222', 'ANA CLAUDIA'),
		('01241223', 'BEATRIZ'),
		('01241224', 'BIANCA'),
		('01241225', 'BRUNA'),
		('01241226', 'FERNANDO'),
		('01241227', 'GIOVANA'),
		('01241228', 'GUILHERME'),
		('01241229', 'PAULO'),
		('01241230', 'PEDRO');
-- verificar o resultado
select * from aluno;
-- alterar situação
update aluno set situacao = 'Não Sei' where ra = '01241226';
--
alter table aluno alter situacao drop default;

alter table aluno alter situacao set default 'Ativo';
-- 
drop table aluno;
-- CHECK CONSTRAINT
CREATE TABLE aluno (
  ra char(08) NOT NULL,
  nome  varchar(100) NOT NULL,
  situacao varchar(10) not null default 'Ativo',
  PRIMARY KEY (ra),
  constraint ck_situacao check(situacao in('Ativo', 'Inativo'))
);
--
insert into aluno(ra, nome)
values ('01241221', 'AMANDA'),
		('01241222', 'ANA CLAUDIA'),
		('01241223', 'BEATRIZ'),
		('01241224', 'BIANCA'),
		('01241225', 'BRUNA'),
		('01241226', 'FERNANDO'),
		('01241227', 'GIOVANA'),
		('01241228', 'GUILHERME'),
		('01241229', 'PAULO'),
		('01241230', 'PEDRO');
--
select * from aluno;    
--
-- alterar situação
update aluno set situacao = 'Não Sei' where ra = '01241226';
/*

Error Code: 3819. Check constraint 'ck_situacao' is violated.

*/    
-- apagar a constraint check
alter table aluno drop constraint ck_situacao;

-- incluir a contraint check após a criação da tabela
alter table aluno add constraint ck_situ_01 check(situacao in ('Ativo','Inativo','Suspenso'));

-- alterar situação
update aluno set situacao = 'Não Sei' where ra = '01241226';

-- foreing key
drop table aluno;
-- FK
CREATE TABLE aluno (
  ra char(08) NOT NULL,
  nome  varchar(100) NOT NULL,
  situacao varchar(10) not null default 'Ativo',
  fkempresa int,
  fkcurso   int,
  PRIMARY KEY (ra),
  key ix_aluno_empresa(fkempresa),
  key ix_aluno_curso(fkcurso),
  constraint fk_aluno_empresa foreign key(fkempresa) references empresa(id),
  constraint fk_aluno_curso foreign key(fkcurso) references curso(id),  
  constraint ck_situacao check(situacao in('Ativo','Inativo','Suspenso'))
);
-- 
insert into aluno(ra, nome, fkempresa, fkcurso)
values ('01241221', 'AMANDA', 100, 1),
		('01241222', 'ANA CLAUDIA', 100, 1),
		('01241223', 'BEATRIZ', 102, 1),
		('01241224', 'BIANCA', 102, 1),
		('01241225', 'BRUNA', 103,2),
		('01241226', 'FERNANDO',103,2),
		('01241227', 'GIOVANA', 102,3),
		('01241228', 'GUILHERME',102,3),
		('01241229', 'PAULO', 101, 2),
		('01241230', 'PEDRO', 101, 2);

select * from aluno;
-- empresa não existente
insert into aluno(ra, nome, fkempresa, fkcurso)
values ('01241240', 'AMANDA', 120, 1);
/*

Error Code: 1452. Cannot add or update a child row: a 
foreign key constraint fails (`sprint1`.`aluno`, 
CONSTRAINT `fk_aluno_empresa` FOREIGN KEY (`fkempresa`) REFERENCES `empresa` (`id`))

*/