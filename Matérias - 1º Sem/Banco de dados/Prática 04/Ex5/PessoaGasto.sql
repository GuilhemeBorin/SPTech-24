create database sprint2;
use sprint2;

-- Fazer a modelagem conceitual (DER) de um sistema para armazenar os gastos individuais das pessoas de sua família.
-- Crie uma entidade Pessoa, com atributos idPessoa, nome, data de nascimento, profissão.
create table Pessoa (
idPessoa int primary key auto_increment,
nome varchar(65),
dtNasc date,
profissão varchar(50)
);

-- Crie uma outra entidade Gasto, com atributos idGasto, data, valor, descrição.
create table Gasto (
idGasto int primary key auto_increment,
dtGasto date,
valor int,
descrição varchar(45),
fkPessoa int,
constraint fk_id_pessoa foreign key (fkPessoa) references Pessoa(idPessoa)
);

-- Depois de desenhado o DER, implemente no MySQL as tabelas equivalentes ao modelo que você criou e:
-- Insira dados nas tabelas.

-- Pessoa
insert into Pessoa (nome, dtNasc, profissão) values
('Marcelo', '2004-09-17', 'Estudante'),
('Martha', '1983-10-04', 'Lojista'),
('Leoncio', '1980-05-30', 'Lojista');

-- Gasto
insert into Gasto (dtGasto, valor, descrição, fkPessoa) values
('2024-03-31', 5.50,'Passagem', 1),
('2024-03-31', 30.75,'Chocolate', 1),
('2024-03-29', 9.19,'Pães', 2),
('2024-03-28', 7.80,'Pães', 2),
('2024-03-26', 1647.50,'Mercado', 3),
('2024-03-22', 5.50,'Passagem', 1);


-- Exiba os dados de cada tabela individualmente.
-- Pessoa
select * from Pessoa;

-- Gasto
select * from Gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from Pessoa where profissão = 'Lojista';
select * from Gasto where descrição = 'Passagem';

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from Pessoa as ps inner join Gasto as gt on gt.fkPessoa = ps.idPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from Pessoa as ps inner join Gasto as gt on gt.fkPessoa = ps.idPessoa where nome = 'Marcelo';

-- Atualizando valores já inseridos.
update Gasto set valor = 5 where idGasto = 1;
update Gasto set valor = 30 where idGasto = 2;
update Gasto set valor = 9 where idGasto = 3;
update Gasto set valor = 7 where idGasto = 4;
update Gasto set valor = 1647 where idGasto = 5;
update Gasto set valor = 5 where idGasto = 6;


select * from Gasto;

-- Exclua um ou mais registros de alguma tabela
delete from Gasto where idGasto = 1;
delete from Gasto where idGasto = 6;
delete from Gasto where idGasto = 5;

select * from Gasto;

-- Excluir tabela com fk
drop table Gasto;
-- Excluir tabela sem fk
drop table Pessoa;

-- Excluir banco
drop database sprint2;