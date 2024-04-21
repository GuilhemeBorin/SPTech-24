-- drop database atvClasse;
create database atvClasse;
use atvClasse;


create table Funcionario(
idFuncionario int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
dtNasc date,
cargo varchar(45)
);

create table Dependentes(
idDependentes int primary key auto_increment,
nome varchar(45),
dtNasc date,
parentesco varchar(45)
);

insert into Funcionario(nome, sobrenome, email, dtNasc, cargo) values
('Richard', 'Paganini', 'richard@gmail.com', '2005-01-13', 'Vendedor'),
('Walleska', 'Lima', 'walleska@gmail.com', '2001-08-24', 'Consultora'),
('Yasmin', 'Silva', 'yasmin@gmail.com', '2005-08-13', 'Product Owner'),
('Maykon', 'Nogueira', 'maykon@gmail.com', '2004-09-17', 'Vendedor'),
('Isabela', 'Rosa', 'isabela@gmail.com', '2004-07-17', 'Gestor'),
('Denyel', 'Oliveira', 'denyel@gmail.com', '2005-05-23', 'Analista'),
('Murilo', 'Barbosa', 'murilo@gmail.com', '2003-08-25', 'Gerente'),
('Gabriel', 'Borin', 'gabriel@gmail.com', '2000-01-21', 'Engenheiro'),
('Guilherme', 'Borin', 'guilherme@gmail.com', '2004-11-20', 'CEO'),
('Sâmua', 'Naari', 'samua@gmail.com', '2005-02-23', 'TechLead');

select * from Funcionario;

insert into Dependentes(nome, dtNasc, parentesco) values
('Roger', '2012-05-09', 'Irmão'),
('Rodolfo', '2002-09-26', 'Irmão'),
('Bianca', '2000-08-20', 'Mãe'),
('Maria', '1940-02-28', 'Avó'),
('Manoel', '1977-01-31', 'Pai'),
('Rodrigo', '2002-04-05', 'Irmã'),
('Nicolly', '2018-02-26', 'Filha'),
('Diego', '2020-05-05', 'Primo'),
('Helena', '2014-11-20', 'Sobrinha'),
('Carlos', '2005-08-20', 'Irmão');

select * from Dependentes;

-- Calcula a idade, subtraindo a data atual com a data informada
select timestampdiff(year, '2004-11-20', now()) idade;



alter table Dependentes add column fkFuncionario int;
alter table Dependentes add constraint fk_id_Funcionario foreign key (fkFuncionario) references Funcionario(idFuncionario);


create table Chefe(
fkFuncionario int auto_increment,
fkChefe int,
primary key(fkFuncionario, fkChefe),
foreign key(fkFuncionario) references funcionario(idFuncionario),
foreign key(fkChefe) references funcionario(idFuncionario)
);

insert into Chefe(fkChefe) values (9), (9), (9), (9), (9), (9), (9), (9), (9), (9);

select Chefe.nome Chefe, func.nome Funcionario -- Funcionario é o nome que aparecerá
from Chefe as Hierarquia
inner join Funcionario as Chefe on Chefe.idFuncionario = Hierarquia.fkChefe -- Nomeando tabela Funcionario como Chefe
inner join Funcionario as func on Func.idFuncionario = Hierarquia.fkFuncionario; -- Nomeando tabela Funcionario como func