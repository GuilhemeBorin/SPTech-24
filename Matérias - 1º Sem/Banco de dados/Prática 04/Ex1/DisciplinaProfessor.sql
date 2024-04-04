create database sprint2;
use sprint2;

/*Criar a tabela chamada Professor para conter os dados: idProfessor, nome
(tamanho 50), sobrenome (tamanho 30), especialidade1 (tamanho 40),
especialidade2 (tamanho 40), sendo que idProfessor é a chave primária da tabela. */
create table Professor(
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30), 
especialidade1 varchar(40),
especialidade2 varchar(40)
);

-- Inserir pelo menos uns 6 professores.
insert into Professor(nome, sobrenome,  especialidade1, especialidade2) values 
('Marcelo', 'Rosim', 'Algoritmos', 'Banco de Dados'),
('Claudio', 'Frizzarini', 'Matematica', 'Arquitetura Computacional'),
('Fernando', 'Brandão', 'Tecnologia da Informação', 'Pesquisa e Inovação'),
('Marcos', 'Antonio', 'Tecnologia da Informação', 'Algoritmos'),
('Caio', 'Henrique', 'Arquitetura Computacional', 'Banco de Dados'),
('Eduardo', 'Luís', 'Banco de Dados', 'Pesquisa e Inovação');

select * from Professor;

/*Criar a tabela chamada Disciplina para conter os dados: idDisc, nomeDisc
(tamanho 45), sendo que idDisc é a chave primária da tabela. */
create table Disciplina(
idDisci int primary key,
nomeDisc varchar(50)
);

-- Inserir pelo menos uns 3 disciplinas.
insert into Disciplina values
(10, 'Algoritmos'),
(11, 'Banco de Dados'),
(12, 'Tecnologia da Informação'),
(13, 'Pesquisa e Inovação'),
(14, 'Arquitetura Computacional'),
(15, 'Matematica');

select * from Disciplina;

-- Configurar a chave estrangeira na tabela conforme sua modelagem (Pode fazer no comando CREATE TABLE);
alter table Disciplina add column fkProfessor int;
alter table Disciplina add constraint professor_idProfessor foreign key (fkProfessor) references Professor(idProfessor);


update Disciplina set fkProfessor = 1 where idDisci = 10;
update Disciplina set fkProfessor = 3 where idDisci = 11;
update Disciplina set fkProfessor = 2 where idDisci = 12;
update Disciplina set fkProfessor = 4 where idDisci = 13;
update Disciplina set fkProfessor = 5 where idDisci = 14;
update Disciplina set fkProfessor = 6 where idDisci = 15;

-- Exibir os professores e suas respectivas disciplinas;
select p.nome as Professor, p.sobrenome as Sobrenome, d.nomeDisc as Disciplina from Professor as p inner join Disciplina as d on d.fkProfessor = p.idProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor;alter
select d.nomeDisc as Disciplina, p.nome as Professor from Professor as p inner join Disciplina as d on d.fkProfessor = p.idProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;
select * from Professor as p inner join Disciplina as d on d.fkProfessor = p.idProfessor where Sobrenome = 'Rosim';

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1;
select p.especialidade1 as Especialidade1, d.nomeDisc as Disciplina from Professor as p inner join Disciplina as d on d.fkProfessor = p.idProfessor where idProfessor = 2;
