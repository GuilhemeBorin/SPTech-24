/*Criar um banco de dados Pet no MySQL, selecionar esse banco de dados e 
executar as instruções relacionadas a seguir.*/
create database DBPet;
use DBPet;

-- Criar as tabelas equivalentes à modelagem. 
create table Cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(50), 
telFixo int,
telCelular int,
endereço varchar(70)
);


create table Pets(
idPets int primary key auto_increment,
tipo varchar(30),
nome varchar(45),
raça varchar(45),
dtNasc date,
fkCliente int,
constraint fk_id_cliente foreign key (fkCliente) references Cliente(idCliente) 
)  auto_increment = 101;


/*Inserir dados nas tabelas, de forma que exista mais de um tipo de animal 
diferente, e que exista algum cliente com mais de um pet cadastrado. Procure 
inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.*/
-- Cliente
insert into Cliente (nomeCliente, telFixo, telCelular, endereço) values
('Maisa Maia', 123456789 , 996633885,'Rua Pedro de Alcantaras'),
('Lucas Beltrão', 987654321, 991611122,'Rua Big Data'),
('Guilherme Borin', 112233445, 987654321,'Rua do Matagal'),
('Gina Beltrão', 996633885, 998018565,'Rua Doze De Janeiro'),
('Carlão Maia', 9137826451, 645897032,'Rua dos Gringos'),
('Pedro Silva', 645897032, 9137826451,'Rua do Manguezal');

-- Pets
insert into Pets (tipo, nome, raça, dtNasc, fkCliente) values
('Hamster', 'Polu', 'Persa', '2004-11-20', 1),
('Avestruz', 'Scar', 'Pincher', '2004-09-17', 3),
('Tigre', 'Harry', 'Siberiano', '2024-02-21', 3),
('Gato', 'Donna', 'Angora', '2010-08-27', 2),
('Gato', 'Becky', 'Angora', '2014-04-23', 2),
('Hamster', 'Sasha Fierce', 'Cara-Branca', '2008-11-12', 5),
('Calopsita', 'Becky', 'Iguana-verde', '2016-04-23', 6),
('Gato', 'Reneigh', 'Bombaim', '2014-05-18', 4),
('Peixe', 'Pomodor', 'Lipizzan', '2022-07-29', 5),
('Gato', 'Slay', 'Poodle', '2024-03-29', 4);

-- Exibir todos os dados de cada tabela criada, separadamente.
-- Cliente
select * from Cliente;
-- Pets
select * from Pets;

alter table Cliente modify column nomeCliente varchar(60);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from Pets where tipo like 'Gato';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome, dtNasc from Pets;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from Pets order by nome asc;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from Cliente order by endereço desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from Pets where nome like 'P%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from Cliente where nomeCliente like '% Maia';
select * from Cliente where nomeCliente like '% Beltrão';

-- Alterar o telefone de um determinado cliente.
update Cliente set telCelular = '987654321' where idCliente = 3;

-- Exibir os dados dos clientes para verificar se alterou.
select * from Cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from Pets as pt inner join Cliente as cl on pt.fkCliente = cl.idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from Pets as pt inner join Cliente as cl on pt.fkCliente = cl.idCliente where idCliente = 5;

-- Excluir algum pet.
delete from Pets where idPets = 7;

-- Exibir os dados dos pets para verificar se excluiu.
select * from Pets;

-- Excluir as tabelas.
-- Iniciando pela tablea com a fk
drop table Pets;

-- em seguida a tabela sem fk
drop table Cliente;

-- apagar o banco de dados
drop database pet;