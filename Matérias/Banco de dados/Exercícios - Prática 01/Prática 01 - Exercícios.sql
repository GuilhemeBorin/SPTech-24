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

-- Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
insert into atleta(idAtleta, nome, modalidade, qtdMedalha) 
values (3, 'GUILHERME', 'Natação', 4),
       (4, 'DANIEL', 'Basquete', 2),
       (5, 'LUCAS', 'Basquete', 3),
       (6, 'FELIPE', 'Basquete', 5),
       (7, 'BIANCA', 'Volei de Praia', 0),
       (8, 'ANNA', 'Volei de Praia', 1),
       (9, 'AMANDA', 'Volei', 2),
       (10, 'ENZO', 'Futebol', 7);

-- Exibir todos os dados da tabela.
select * from atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from atleta where modalidade = 'volei';

-- Exibir os dados da tabela ordenados pela modalidade.
select * from atleta order by  modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from atleta order by  qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from atleta where nome like '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from atleta where nome like 'a%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from atleta where nome like '%a';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from atleta where nome like '%e_';

-- Eliminar a tabela.
drop table atleta;

-- Eliminar o database
drop database sprint1;


-- ////////////// EXERCÍCIO 2 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
create database sprint1;
use sprint1;

/* Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela. */
create table Musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

/* Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma 
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

-- Execute os comandos para:
-- a) Exibir todos os dados da tabela.
select * from Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.
select titulo, artista from Musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
select * from Musica where genero = 'Reggae';

-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from Musica where artista = 'Eminem';

-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from Musica order by artista desc;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from Musica where titulo like 'C%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from Musica where artista like '%o';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from Musica where genero like '_l%';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from Musica where titulo like '%a_';

-- k) Elimine a tabela 
drop table Musica;


-- ////////////// EXERCÍCIO 3 ////////////// --
-- No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
use sprint1;

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
uns 7 filmes */
insert into Filme values
(1, 'Transformers', 'Ficção Científica', 'Michael Bay'),
(2, 'Oppenheimer', 'Suspense', 'Christopher Nolan'),
(3, 'Interestelar', 'Ficção Científica', 'Christopher Nolan'),
(4, 'Música, Amigos e Festa', 'Musical', 'Max Joseph'),
(5, 'Invocação do Mal', 'Terror', 'James Wan'),
(6, 'Fome de Poder', 'Documentário', 'John Lee Hancock'),
(7, 'Zohan', 'Comédia', 'Dennis Dugan');

-- Execute os comandos para:
-- • Exibir todos os dados da tabela.
select * from Filme;

-- • Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from Filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.
select * from Filme where genero = 'Comédia';

-- • Exibir apenas os dados dos filmes de um determinado diretor.
select * from Filme where diretor = 'Christopher Nolan';

-- • Exibir os dados da tabela ordenados pelo título do filme.
select * from Filme order by titulo;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from Filme order by diretor desc;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from Filme where  titulo like 't%';

-- • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select * from Filme where diretor like '%n';

-- • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from Filme where genero like '_o%';

-- • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from Filme where titulo like '%t_';

-- • Elimine a tabela.
drop table Filme;


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
(4, 'Frizza', 'Pesquisa e Inovação', '1996-08-11'),
(5, 'JP', 'Algoritmo', '2005-12-24'),
(6, 'Betina', 'Socio Emocional', '2000-11-15');

-- Execute os comandos para:
-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Exibir apenas as especialidades dos professores.
select especialidade from Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from Professor where especialidade like 'Algoritmo';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dtNasc desc;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from Professor where nome like 'M%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor where nome like '%a';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor where nome like '_e%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor where nome like '%s_';

-- j) Elimine a tabela.
drop table Professor;


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

-- Execute os comandos para:
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
select * from Curso where nome like 's%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso where nome like '_n%';

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
-- • Exibir todos os dados da tabela.
select * from Revista;

-- • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'Moda' where idRevista in (1, 2, 3); 

-- • Insira mais 3 registros completos.
insert into Revista values
(null, 'Caras', 'Imprensa rosa'),
(null, 'Quatro Rodas', 'Automóveis'),
(null, 'Oeste', 'Negócios');

-- • Exibir novamente os dados da tabela.
select * from Revista;

-- • Exibir a descrição da estrutura da tabela.
describe Revista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe Revista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar(15);

-- • Exibir os dados da tabela.
select * from Revista;

-- • Excluir a coluna periodicidade da tabela
alter table Revista drop column periodicidade;

-- ***************************** EXCLUIR O BANCO DE DADOS SPRINT1 *****************************
drop database sprint1;