-- COMANDOS DDL --

-- criação de databse
create database aula_1;

-- apagar o database
drop database aula_1;

-- usar database
use aula_1;

-- criar tabela 
create table exemplo_1(
id int not null primary key,
nome varchar(50) not null,
nota decimal(4,2),
data date
);

create table exemplo_2(
id int not null,
nome varchar(50) not null,
nota decimal(4,2),
data date,
primary key id(id)
);

-- descrever a tabela (desc OU describe)
desc exemplo_1;


-- COMANDOS DML --

-- inserir valores na tabela
insert into exemplo_1(id, nome, nota, data) 
values (1,'JOÃO',7,'2024-02-20');

insert into exemplo_1 values (2,'GIOVANNA',9,'2024-02-19');
insert into exemplo_1 values (3,'GUILHERME',null,'2024-02-18' );

-- selecionar tabela
select * from exemplo_1;

select nome 
from exemplo_1
where id = 3;

select * 
from exemplo_1
order by data asc;

select * from exemplo_1 where id between 1 and 2;

select * from exemplo_1 where id >=2 and id <=3;


-- COMANDOS DQL --

/* 
select * from exemplo_1 order by nome;
select id, nome from exemplo_1 order by 2;
select id, nome, nota from exemplo_1 where id=1;
select id, nome, nota from exemplo_1 where id in (1,2);
select id, nome, nota from exemplo_1 where nome like 'G%';
select id, nome, nota from exemplo_1 where nome like '%A' order by nome desc;
select id, nome, nota from exemplo_1 where nome like 'G_ovanna';
select id, nome, nota from exemplo_1 where nome like 'G_o%a';

select id, nome, nota from exemplo_1 where note >=8;
select id, nome, nota from exemplo_1 where nota <=8;
select * from exemplo_1 where nota between 8 and 9;
select * from exemplo_1 where nota >=8 and nota <=9;
select * from exemplo_1 where nota >=8 or nome lije 'J%';
select * from exemplo_1 where (nota>=8 or nota <9) and nome like 'G%';
*/