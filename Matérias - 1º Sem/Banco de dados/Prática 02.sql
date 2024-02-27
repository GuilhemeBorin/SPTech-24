-- ////////////// EXERCÍCIO 1 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
create database sprint1;
use sprint1;

/* Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da 
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha 
(int, representando a quantidade de medalhas que o atleta possui)*/
create table atleta (
    idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade e pelo menos 5 atletas.
insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (1, 'GUILHERME', 'Natação', 4),
       (2, 'DANIEL', 'Basquete', 6),
       (3, 'ENZO', 'Basquete', 3),
       (4, 'BEATRIZ', 'Natação', 5),
       (5, 'LARISSA', 'Volei de Praia', 0),
       (6, 'ANNA', 'Volei de Praia', 2);

-- Exibir todos os dados da tabela.
select * from atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1
update atleta set qtdMedalha = 2 where idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3.
update atleta set qtdMedalha = 9 where idAtleta in (2,3);

-- Atualizar o nome do atleta com o id=4.
update atleta set nome = 'Robson' where idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date.
alter table atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas
update atleta set dtNasc = '2001-09-11' where idAtleta = 1;
update atleta set dtNasc = '2004-11-20' where idAtleta = 2;
update atleta set dtNasc = '2004-09-17' where idAtleta = 3;
update atleta set dtNasc = '2005-08-13' where idAtleta = 4;
update atleta set dtNasc = '2001-08-24' where idAtleta = 5;
update atleta set dtNasc = '2005-01-13' where idAtleta = 6;

-- Excluir o atleta com o id=5.
delete from atleta where idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação.
select nome from atleta at where modalidade != 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3.
select * from atleta where qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60.
alter table atleta modify column modalidade varchar(60); 

-- Descrever os campos da tabela mostrando a atualização do campo modalidade
describe atleta;

-- Limpar os dados da tabela
truncate table atleta;

-- ////////////// EXERCÍCIO 1 ////////////// --
/*
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista 
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
*/
create table Musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);
/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma 
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo 
menos umas 7 músicas. */
insert into Musica values 
(1, 'Deixa Alagar', 'Grupo Revelação', 'Pagode'),
(2, 'Without Me', 'Eminem', 'Rap'),
(3, 'Boa noite xangô', 'O Rappa', 'Reggae'),
(4, 'Snow Crystal', 'Babalos', 'Eletrônica'),
(5, 'Chop Suey!', 'System Of A Down', 'Rock'),
(6, 'I Think I Like It', 'Fake Blood', 'Eletrônica'),
(7, 'Deja Vu', 'Eminem', 'Rap');


-- a) Exibir todos os dados da tabela.


-- b) Adicionar o campo curtidas do tipo int na tabela;


-- c) Atualizar o campo curtidas de todas as músicas inseridas;


-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;


-- e) Atualizar a quantidade de curtidas da música com id=1;


-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;


-- g) Atualizar o nome da música com o id=5;


-- h) Excluir a música com o id=4;


-- i) Exibir as músicas onde o gênero é diferente de funk;


-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica where cu

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
describe Musica;

-- l) Limpar os dados da tabela; 
truncate table Musica;