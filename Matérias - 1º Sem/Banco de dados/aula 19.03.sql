use sprint2;

create table Empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
representante varchar(45)
);

insert into Empresa  values
(null, 'Bradesco', 'Marcelo'),
(null, 'Safra', 'Vivian'),
(null, 'Genial', 'JP'),
(null, 'Jazz', 'Petry'),
(null, 'C6', 'Murilo');

create table Aluno (
RAAluno int primary key,
nome varchar(45),
dtNasc date,
fk_Empresa int,
constraint fk_Empresa_Aluno foreign key (fk_Empresa) references Empresa (idEmpresa)
);

insert into Aluno  values
(01231168, 'Guilherme', '2004-11-23', null),
(01241215, 'Maykon', '2004-09-17', null),
(01241046, 'Yasmim', '2005-08-13', null),
(01241222, 'Tabata', '2002-11-28', null),
(01241159, 'Davi', '2005-12-06', null),
(01241137, 'Richard', '2005-01-13', null),
(01241118, 'Pablo', '2001-01-13', null),
(01241011, 'Isaias', '2004-01-31', null),
(01231000, 'Zero', '1999-09-09', null),
(01231123, 'Inicio', '1234-12-04', null);

select * from Aluno;

update Aluno set fk_Empresa = 3 where RAAluno like 01231168;
update Aluno set fk_Empresa = 4 where RAAluno like 01241215;
update Aluno set fk_Empresa = 1 where RAAluno like 01241046;
update Aluno set fk_Empresa = 2 where RAAluno like 01241222;
update Aluno set fk_Empresa = 5 where RAAluno like 01241159;
update Aluno set fk_Empresa = 5 where RAAluno like 01241137;
update Aluno set fk_Empresa = 2 where RAAluno like 01241118;
update Aluno set fk_Empresa = 4 where RAAluno like 01241011;
update Aluno set fk_Empresa = 2 where RAAluno like 01231000;
update Aluno set fk_Empresa = 1 where RAAluno like 01231123;

select * from aluno as A inner join Empresa as E on A.fk_Empresa = E.idEmpresa;