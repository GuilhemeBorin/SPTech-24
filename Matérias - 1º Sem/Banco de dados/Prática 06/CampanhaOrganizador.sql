-- Prática 06 - Ex02

-- 2. Fazer a modelagem lógica de um sistema para cadastrar as campanhas de doações que surgiram devido ao Covid-19 e os organizadores dessas campanhas 

-- Cada organizador organiza mais de uma campanha de doação. 
-- Cada campanha de doação é organizada por apenas um organizador. 
/* Sobre cada organizador, o sistema guarda um identificador, que identifica de forma única cada organizador. Esse identificador começa com o valor 30 e é  
inserido de forma automática. Além desse identificador, o sistema guarda o nome, o endereço (composto pelo nome da rua e bairro) e o e-mail do organizador. */

/* Sobre cada campanha de doação, o sistema guarda um identificador, que identifica de forma única cada campanha. Esse identificador começa com o valor  
500 e é inserido de forma automática. O sistema também guarda a categoria da doação (ex: alimento ou produto de higiene, ou máscaras de proteção, etc), 
a instituição para a qual será feita a doação (pode haver até 2 instituições) e a data final da campanha. */

-- Um organizador mais experiente orienta outros organizadores novatos. Cada organizador novato é orientado apenas por um organizador mais experiente.
 
-- Escrever os comandos do MySQL para: 
-- a) Criar um banco de dados chamado Campanha. 
create database Campanha; 

-- b) Selecionar esse banco de dados. 
use Campanha; 

-- c) Criar as tabelas correspondentes à sua modelagem. 
-- TABELA ORGANIZADOR 
create table organizador ( 
idOrganizador int primary key auto_increment, 
nomeOrganizador varchar(45), 
endereco varchar(90), 
email varchar(90), 
fkExperiente int, 
constraint fk_nov_org foreign key (fkExperiente) references organizador(idOrganizador) 
) auto_increment = 30; 

-- TABELA CAMPANHAS 
create table campanhas ( 
idCampanha int primary key auto_increment, 
categoria varchar(45), 
instituicao varchar(45), 
instituicao2 varchar(45), 
dtFinal date, 
fkOrganizador int, 
constraint fk_id_organizador foreign key (fkOrganizador) references organizador(idOrganizador) 
) auto_increment = 500; 


-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente. 
-- TABELA ORGANIZADOR 
insert into organizador (nomeOrganizador, endereco, email, fkExperiente) values 
('Guilherme', 'Rua das Bananeiras - Imirim', 'guilherme@gmail.com', null), 
('Maykon', 'Rua Marcos José Pilintra - Amoras', 'maykon@gmail.com', null), 
('Sam', 'Rua das Graças - Alphaville', 'sam@gmail.com', null), 
('Chaves', 'Rua Pão com Presunto - Acapulco', 'chaves@gmail.com', null), 
('Sasha', 'Rua da Fama - Riquezas', 'sasha@gmail.com', null), 
('Julia', 'Rua Geraldo Marino - Eliza Maria', 'julia@gmail.com', null), 
('Gisele', 'Haddock Lobo - Comsolação', 'gisele@gmail.com', null); 

-- TABELA CAMPANHAS 
insert into campanhas (categoria, instituicao, instituicao2, dtFinal, fkOrganizador) values 
('alimento', 'ComaComigo', 'ComidaParaTodos', '2023-01-30', 30),  
('higiene', 'LimpeMinhaMão', 'ProtectYou', '2023-04-15', 32),  
('alimento', 'ComaComigo', 'ComidaParaTodos', '2022-12-12', 34),  
('máscara de proteção', 'ProtectYou', 'MaskForYou', '2022-08-17', 36), 
('máscara de proteção', 'ProtectYou', 'MaskForYou', '2021-05-06', 31),
('higiene', 'LimpeMinhaMão', 'MaskForYou', '2021-11-20', 34), 
('alimento', 'ComaComigo', 'ComidaParaTodos', '2021-12-3', 33); 

-- e) Exibir todos os dados de cada tabela criada, separadamente. 
select * from organizador; 
select * from campanhas; 

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas. 
update organizador set fkExperiente = 30 where idOrganizador = 31;
update organizador set fkExperiente = 32 where idOrganizador = 36;
update organizador set fkExperiente = 36 where idOrganizador = 33;
update organizador set fkExperiente = 33 where idOrganizador = 34;


-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas. 
select * from organizador as og 
inner join campanhas as cp 
on cp.fkOrganizador = og.idOrganizador; 

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas. 
select * from organizador as og 
inner join campanhas as cp 
on cp.fkOrganizador = og.idOrganizador 
where nomeOrganizador like 'Chaves'; 

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores. 
select * from organizador as og 
inner join organizador as ex 
on ex.fkExperiente = og.idOrganizador; 

/* j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente 
de um determinado organizador orientador (informar o nome do organizador orientador na consulta). */
select * from organizador as og 
inner join organizador as ex  
on ex.fkExperiente = og.idOrganizador 
where ex.nomeOrganizador like 'Maykon';

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores. 
select * from organizador as og 
inner join organizador as ex  
on ex.fkExperiente = og.idOrganizador 
inner join campanhas as cp 
on cp.fkOrganizador = og.idOrganizador; 

/* m) Exibir os dados de um organizador novato (informar o seu nome na consulta), 
os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador. */
select * from organizador as og 
inner join organizador as ex 
on ex.fkExperiente = og.idOrganizador 
inner join campanhas as cp 
on cp.fkOrganizador = og.idOrganizador 
where og.nomeOrganizador like 'Sam'; 
