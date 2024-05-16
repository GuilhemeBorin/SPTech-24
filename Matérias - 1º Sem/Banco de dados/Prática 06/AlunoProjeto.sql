-- Prática 06

-- 1. Fazer a modelagem lógica de um sistema para cadastrar os alunos da faculdade, seus projetos e seus acompanhantes que eles poderão trazer no dia da apresentação final do projeto. 

-- Cada aluno participa apenas de um projeto. 
-- Cada projeto pode ter a participação de um ou mais alunos. 
-- Cada aluno pode trazer zero ou mais acompanhantes. 
-- Há alguns alunos que atuam como representantes de outros alunos.  
-- Qualquer problema ou queixa que os alunos tiverem, devem falar com o aluno que os representa. O aluno representante, por sua vez, reporta os problemas/queixas à equipe de socioemocional. 
-- Cada aluno é representado apenas por um aluno. 
-- Sobre os alunos, o sistema guarda o ra (chave primária), nome, telefone. 
-- Sobre os projetos, o sistema guarda um identificador (chave primária), nome e a descrição do projeto. 
-- Sobre os acompanhantes, o sistema guarda um identificador, nome e o tipo de relação com o aluno (se é pai, amigo, irmão, namorado, etc).
-- Criar um banco de dados AlunoProjeto no MySQL, selecionar esse banco de dados e executar as instruções relacionadas a seguir.

create database AlunoProjeto; 
use AlunoProjeto; 

-- Criar as tabelas equivalentes à modelagem.  
-- TABELA PROJETO 
create table projetos ( 
idProjeto int primary key auto_increment, 
nomeProjeto varchar(30), 
descricao varchar(45) 
); 

-- TABELA ALUNO 
create table alunos ( 
ra int primary key auto_increment, 
nomeAluno varchar(45), 
telefone varchar(15), 
fkRepresentante int, 
fkProjeto int, 
constraint fk_ra_aluno foreign key (fkRepresentante) references alunos(ra), 
constraint fk_id_projeto foreign key (fkProjeto) references projetos(idProjeto) 
)auto_increment = 01241001; 

-- TABELA ACOMPANHANTE 
create table acompanhante ( 
idAcompanhante int primary key auto_increment, 
nomeAcompanhante varchar(45), 
relacao  varchar(30), 
fkAluno int, 
constraint fk_aluno foreign key (fkAluno) references alunos(ra) 
); 
 
-- - Inserir dados nas tabelas. 
-- TABELA PROJETOS 
insert into projetos (nomeProjeto, descricao) values 
('FlyCar', 'Carro capaz de voar'), 
('FoodPack', 'ONG que distruibui cestas báscias'), 
('MusicForLife', 'Estúdios que ensinam sobre música'), 
('Pata amiga', 'Treinando cães para pessoas cegas'); 

-- TABELA ALUNOS 
insert into alunos (nomeAluno, telefone, fkRepresentante, fkProjeto) values 
('Maykon', '(11)94488-4531', null, 2), 
('Guilherme', '(11)96723-2879', null, 2), 
('Davi', '(11)91234-5678', null, 1), 
('Larissa', '(11)99875-4623', null, 3), 
('Maria', '(11)91593-5782', null, 4); 

-- TABELA ACOMPANHANTE 
insert into acompanhante (nomeAcompanhante, relacao, fkAluno) values 
('Rodolfo', 'Amigo', 01241001), 
('Rodrigo', 'Pai', 01241002), 
('Pericles', 'Primo', 01241003), 
('Marcelinha', 'Irmã', 01241004); 

-- - Exibir todos os dados de cada tabela criada, separadamente. 
select * from projetos; 
select * from alunos; 
select * from acompanhante; 

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação. 
update alunos set fkRepresentante = 01241004 where ra = 01241003;
update alunos set fkRepresentante = 01241005 where ra = 01241001;
update alunos set fkRepresentante = 01241002 where ra = 01241004;
update alunos set fkRepresentante = 01241003 where ra = 01241002;


-- - Exibir os dados dos alunos e dos projetos correspondentes. 
select * from alunos as al 
inner join projetos as pj  
on al.fkProjeto = pj.idProjeto; 

-- - Exibir os dados dos alunos e dos seus acompanhantes. 
select * from alunos as al 
inner join acompanhante as ac 
on ac.fkAluno = al.ra; 

-- - Exibir os dados dos alunos e dos seus representantes. 
select * from alunos as al 
inner join alunos as rp 
on rp.fkRepresentante = al.ra; 

/*Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta). */
select * from alunos as al 
inner join projetos as pj 
on al.fkProjeto = pj.idProjeto 
where nomeProjeto like 'FoodPack'; 

-- - Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes. 
select * from alunos as al 
inner join projetos as pj  
on al.fkProjeto = pj.idProjeto 
inner join acompanhante as ac 
on ac.fkAluno = al.ra;

