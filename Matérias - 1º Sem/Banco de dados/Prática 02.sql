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

-- ////////////// EXERCÍCIO 2 ////////////// --
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
select * from Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table Musica add column curtidas int;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
update Musica set curtidas = 5;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table Musica Modify column artista varchar(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
update Musica set curtidas = 17 where idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update Musica set curtidas = 20 where idMusica = 2 and 3;

-- g) Atualizar o nome da música com o id=5;
update Musica set titulo = 'CHOPE SULHEY' where idMusica = 5;

-- h) Excluir a música com o id=4;
delete from Musica where idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
select * from Musica where genero != 'Funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica where curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
describe Musica;

-- l) Limpar os dados da tabela; 
truncate table Musica;

-- ////////////// EXERCÍCIO 3 ////////////// --

/* Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela. */
create table Filme(
idFilme int primary key,
titulo varchar (50),
genero varchar (40),
diretor varchar (40)
);


/* Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes. */
insert into Filme values
(1, 'Transformers', 'Ficção Científica', 'Michael Bay'),
(2, 'Oppenheimer', 'Suspense', 'Christopher Nolan'),
(3, 'Interestelar', 'Ficção Científica', 'Christopher Nolan'),
(4, 'Música, Amigos e Festa', 'Musical', 'Max Joseph'),
(5, 'Invocação do Mal', 'Terror', 'James Wan'),
(6, 'Fome de Poder', 'Documentário', 'John Lee Hancock'),
(7, 'Zohan', 'Comédia', 'Dennis Dugan');

-- Execute os comandos para:
-- Exibir todos os dados da tabela.
select * from Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table Filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update Filme set protagonista = 'Guilherme Borin' where idFilme = 1;
update Filme set protagonista = 'Gabriel Borin' where idFilme = 2;
update Filme set protagonista = 'Edna Borin' where idFilme = 3;
update Filme set protagonista = 'Edneia Borin' where idFilme = 4;
update Filme set protagonista = 'Edna Borin' where idFilme = 5;
update Filme set protagonista = 'Eli Borin' where idFilme = 6;
update Filme set protagonista = 'Helena Borin' where idFilme = 7;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table Filme modify column diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
update Filme set diretor = 'Marcelão' where idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update Filme set diretor = 'Vivian' where idFilme = 2 and 7;

-- Atualizar o título do filme com o id=6;
update Filme set titulo = 'A formiga e o homem' where idFilme = 6;

-- Excluir o filme com o id=3;
delete from Filme where idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
select * from Filme where genero != 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select * from Filme where genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
describe Filme;

-- Limpar os dados da tabela;
truncate table Filme;


-- ////////////// EXERCÍCIO 4 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/* Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50), 
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da 
tabela. */
create table Professor(
idProfessor int primary key,
nome varchar (50),
especialidade varchar (40),
dtNasc date
);

-- Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.
-- Inserir dados na tabela, procurando colocar uma especialista para mais de um professor. Procure inserir pelo menos uns 6 professores.
insert into Professor values 
(1, 'Marcelo', 'Banco de dados', '1980-02-04'),
(2, 'Caio', 'Algoritmo', '2008-10-07'),
(3, 'Marise', 'Arquitetura Computacional', '1977-04-10'),
(4, 'Eduardo', 'Arquitetura Computacional', '1996-08-11'),
(5, 'JP', 'Algoritmo', '2005-12-24'),
(6, 'Betina', 'Socio Emocional', '2000-11-15');

-- Execute os comandos para
-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
alter table Professor add column funcao varchar(50), add constraint checkFuncao check(funcao in ('monitor', 'assistente', 'titular'));

-- c) Atualizar os professores inseridos e suas respectivas funções;
update Professor set funcao = 'titular' where idProfessor = 1;
update Professor set funcao = 'titular' where idProfessor = 2;
update Professor set funcao = 'titular' where idProfessor = 3;
update Professor set funcao = 'titular' where idProfessor = 4;
update Professor set funcao = 'assistente' where idProfessor = 5;
update Professor set funcao = 'monitor' where idProfessor = 6;

-- d) Inserir um novo professor;
insert into Professor values (7, 'Guilherme', 'Matemática', '2004-11-20','assistente');

-- e) Excluir o professor onde o idProfessor é igual a 5;
delete from Professor where idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
select * from Professor where funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from Professor where funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
update Professor set dtNasc = '1988-08-18' where idProfessor = 3;

-- i) Limpar a tabela Professor; 
truncate table Professor;


-- ////////////// EXERCÍCIO 5 ////////////// -- 

-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/* Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla 
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela. */
create table Curso(
idCurso int primary key,
nome varchar(50),
sigla varchar(3),
coordenador varchar(40)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
insert into Curso values 
(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson Santos'),
(2, 'Sistemas de Informação', 'SI', 'Alex Barreira'),
(3, 'Ciência da Computação', 'CCO', 'Marise Miranda');

-- a) Exibir todos os dados da tabela.
select * from Curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'ADS';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from Curso order by coordenador desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'C%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso where nome like '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso where nome like '%a_';

-- j) Elimine a tabela.
drop table Curso;


-- ////////////// EXERCÍCIO 6 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

-- Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é, Epoca, Quatro Rodas, Claudia, etc).
-- Escreva e execute os comandos para:
/*• Criar a tabela chamada Revista para conter os campos: idRevista (int e chave 
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os 
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente 
pelo sistema. */
create table Revista(
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30)
);

-- • Inserir 4 registros na tabela, mas sem informar a categoria.
insert into Revista values
(null , 'Manequim', ''),
(null , 'Vogue', ''),
(null , 'GQ', ''),
(null , 'Exame', '');

-- Escreva e execute os comandos para:
-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'Moda' where idRevista in (1, 2, 3); 
select * from Revista;

-- Insira mais 3 registros completos.
insert into Revista values
(null, 'Caras', 'Imprensa rosa'),
(null, 'Quatro Rodas', 'Automóveis'),
(null, 'Oeste', 'Negócios');


-- Exibir novamente os dados da tabela.
select * from Revista;

-- Exibir a descrição da estrutura da tabela.
describe Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from Revista;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop column periodicidade;



-- ////////////// EXERCÍCIO 7 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/*Criar a tabela chamada Serie para conter os campos: idSerie (int e chave primária da
tabela), nome (varchar, tamanho 40), qtdTemporadas (int), status (varchar, tamanho
40). Onde o status só pode ser em andamento, finalizada ou não assistida. Os valores
de idSerie devem iniciar com o valor 100 e ser incrementado automaticamente pelo
sistema. */
create table Serie(
idSerie int primary key auto_increment,
nome varchar(40),
qtdTemporadas int,
status enum('em andamento','finalizada','não assistida')
)auto_increment = 100;

-- Inserir 4 registros na tabela.
insert into Serie values
(null, 'The Office', 9 , 'em andamento'),
(null, 'One Piece', 20 , 'em andamento'),
(null, 'Breaking Bad', 5 , 'finalizada'),
(null, 'As telefonistas', 5 , 'não assistida');

-- Exibir todos os dados da tabela.
select * from Serie;


-- ////////////// EXERCÍCIO 8 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/*
Criar a tabela chamada Carro para conter os dados: idCarro int, nome (tamanho 70), placa
(tamanho 7), marca (tamanho 20), sendo que idCarro é a chave primária da tabela.
Inserir dados na tabela, procurando colocar uma marca de carro que tenha mais de um
carro. Procure inserir pelo menor 5 carros.*/


/* O campo marca (tamanho 20) está muito pequeno. É necessário aumentar o número de
caracteres para 40.*/


-- Execute os comandos para:
-- 1) Exibir todos os campos da tabela.


-- 2) Exibir apenas os nomes e as placas dos carros.


-- 3) Exibir apenas os dados dos carros de uma determinada marca.


-- 4) Exibir apenas os dados dos carros de uma determinada placa.


-- 5) Exibir os dados da tabela ordenados pela marca do carro.


-- 6) Exibir os dados da tabela ordenados pelo nome em ordem decrescente.


-- 7) Exibir os dados da tabela, dos carros cujo nome termine com uma determinada letra.


-- 8) Exibir os dados da tabela, dos carros cujo marca comece com uma determinada letra.


-- 9) Exibir os dados da tabela, dos carros cuja placa tenha como segunda letra uma determinada letra.


-- 10) Exibir os dados da tabela, dos carros cujo nome tenha como penúltima letra uma determinada letra.


-- 11) Atualize uma placa de algum carro. Exiba novamente os dados da tabela após a atualização.


-- 12) Exclua algum carro da tabela. Exiba novamente os dados da tabela após a exclusão.


-- 13) Elimine a tabela



-- ////////////// EXERCÍCIO 9 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

/*
Criar a tabela chamada Restaurante para conter os dados: idRest, nome (tamanho 40), CEP
(tamanho 9), exemplo: '01515-999', tipo (tamanho 30), sendo que idRest tem um valor
numérico inteiro e é a chave primária da tabela. O tipo do restaurante é o tipo da comida que é
servida (churrascaria, italiana, japonesa, fast-food, etc)
Inserir dados na tabela, procurando colocar um tipo de restaurante que tenha mais de um
restaurante. Procure inserir pelo menos 5 restaurantes.*/


/* O campo tipo (tamanho 30) está muito pequeno. É necessário aumentar os caracteres para o
tamanho 50. */


-- Execute os comandos para:
-- 1) Exibir todos os dados da tabela.


-- 2) Exibir apenas os nomes e os tipos dos restaurantes.


-- 3) Exibir apenas os dados dos restaurantes de um determinado tipo.


-- 4) Exibir apenas os dados dos restaurantes de um determinado CEP.


-- 5) Exibir os dados da tabela ordenados pelo nome do restaurante.


-- 6) Exibir os dados da tabela ordenados pelo tipo em ordem decrescente.


-- 7) Exibir os dados da tabela, dos restaurantes cujo nome comece com uma determinada letra.


-- 8) Exibir os dados da tabela, dos restaurantes cujo CEP termine com um determinado número.


-- 9) Exibir os dados da tabela, dos restaurantes cujo tipo tenha como segunda letra uma determinada letra.


-- 10) Exibir os dados da tabela, dos restaurantes cujo nome tenha como penúltima letra uma determinada letra.


-- 11) Atualize o CEP de algum restaurante. Exiba novamente os dados da tabela após a atualização.


-- 12) Exclua algum restaurante da tabela. Exiba novamente os dados da tabela após a exclusão.


-- 13) Elimine a tabela.
