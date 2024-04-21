create database if not exists sprint2;
use sprint2;

create table cliente(
id  int not null auto_increment,
nome   varchar(100),
primary key(id));

create table produto(
id int not null auto_increment,
nome   varchar(100),
preco_unitario  decimal(10,2),
primary key(id));

create table pedido(
id   int not null auto_increment,
data_pedido   date,
fkcliente     int,
primary key(id),
foreign key (fkcliente) references cliente(id)) auto_increment=1000;

create table pedido_item(
fkpedido    int not null,
fkproduto   int not null,
quantidade  decimal(10,3),
valor_unitario  decimal(10,2),
primary key(fkpedido, fkproduto),
foreign key(fkpedido) references pedido(id),
foreign key(fkproduto) references produto(id));

create table Empresa(
id int not null auto_increment,
nome varchar(45),
cnpj varchar(45), 
situacao char(1),
fkempresa int,
primary key (id),
foreign key (fkEmpresa) references Empresa(id)
);

INSERT INTO cliente (nome) VALUES
		('Empresa ABC LTDA'),
		('Companhia XYZ S.A.'),
		('Serviços de Tecnologia EFG Ltda.'),
		('Comércio de Alimentos GHI Ltda.'),
		('Transportadora JKL S.A.'),
		('Consultoria MNO LTDA'),
		('Fabricação de Produtos PQR S.A.'),
		('Agropecuária STU LTDA'),
		('Indústria de Cosméticos VWX S.A.'),
		('Construtora YZ Ltda.');
        
INSERT INTO produto (nome, preco_unitario) VALUES
	('Tênis de Skate', 129.99),
	('Camiseta Estampada', 49.99),
	('Boné de Marca', 39.99),
	('Celular Gamer', 999.99),
	('Fone de Ouvido Bluetooth', 79.99),
	('Mochila Escolar com Estampa', 69.99),
	('Skate Completo', 149.99),
	('Calça Jeans Rasgada', 79.99),
	('Sneakers de Marca', 89.99),
	('Pulseira Inteligente', 59.99);     
  
INSERT INTO pedido (data_pedido, fkcliente) VALUES
	('2024-04-01', 1),
	('2024-04-02', 2),
	('2024-04-03', 3),
	('2024-04-04', 4),
	('2024-04-05', 5),
	('2024-04-06', 6);    

INSERT INTO pedido_item (fkpedido, fkproduto, quantidade, valor_unitario) VALUES
		(1000, 1, 2, 129.99), 
		(1000, 2, 1, 49.99),  
		(1001, 4, 1, 999.99), 
		(1001, 5, 1, 79.99),  
		(1002, 7, 1, 149.99),
		(1002, 8, 1, 79.99),
		(1003, 9, 1, 89.99),
		(1003, 10, 1, 59.99),
		(1004, 2, 2, 49.99),
		(1004, 6, 1, 69.99),
		(1005, 1, 1, 129.99),
		(1005, 4, 1, 999.99);
        
insert into Empresa (nome, cnpj, situacao, fkEmpresa)values
('Magazine Luizão', 12345678915937, 'A', 1),
('Casinha Baihinha', 78965432125816, 'I', 2);

/*
1º) listar o nome do cliente, nro do pedido, data do pedido, nome do produto, quantidade, 
valor unitário e valor total do item, valor total exibido com 2 casas decimais apenas
*/
  
select cli.nome cliente,
	   ped.id pedido,
       ped.data_pedido,
       pro.nome produto,
       ite.quantidade,
       ite.valor_unitario,
       round(ite.valor_unitario * ite.quantidade,2) valor_total_item
from cliente cli
inner join pedido ped on ped.fkcliente = cli.id
inner join pedido_item ite on ite.fkpedido = ped.id
inner join produto pro on pro.id = ite.fkproduto;
/*
2º) listar todos os clientes que não fizeram compras
*/
select cli.nome cliente
from cliente cli
left join pedido ped on ped.fkcliente = cli.id
where ped.id is null;
/*
3º) listar produtos que não foram vendidos, ordenados por valor unitário do maior para o menor
*/
select pro.nome
from produto pro
left join pedido_item ite on ite.fkproduto = pro.id
where ite.fkproduto is null;

/*
4º) listar todos os clientes, mesmo que não tenham realizado compras e para os que compraram informar os 
produtos, com valor total do item
*/
select cli.nome cliente, pro.nome produto, round(ite.valor_unitario * ite.quantidade,2) valor_total_item
from cliente cli
left join pedido ped on ped.fkcliente = cli.id
left join pedido_item ite on ite.fkpedido = ped.id
left join produto pro on pro.id = ite.fkproduto;

/*
5o) Listar de todos os clientes e de todos os produtos e retornar ordenado pelos nomes
*/
select nome, 'Cliente' tipo
from cliente
union
select nome, 'Produto' 
from produto
order by 1;
 
 -- IFNULL
 INSERT INTO produto (nome, preco_unitario) VALUES
	('Camisa Oficial do Juventus', null);
 
 select * from produto;
 
 INSERT INTO pedido (data_pedido, fkcliente) VALUES
	('2024-04-16', 1);

select * from pedido;
    
INSERT INTO pedido_item (fkpedido, fkproduto, quantidade, valor_unitario) VALUES
		(1006, 11, 20, null); 
        
        
-- remover as chaves estrangeiras(foreign key) da tabela 
alter table pedido_item drop constraint pedido_item_ibfk_1;
alter table pedido_item drop constraint pedido_item_ibfk_2;

-- remover a chave primária(primary key) da tabela
alter table pedido_item drop primary key;

-- remover a chave estrangeira(foreign key) da tabela 
alter table pedido drop constraint pedido_item_ibfk_1;

-- retirar o auto_increment da tabela pedido
alter table pedido modify id int not null;

-- remover a chave primária(primary key) da tabela 
alter table pedido drop primary key;

-- adiciona a chave estrangeira(foreign key) na tabela
alter table pedido add fkempresa int not null;

-- atualiar a chave estrangeira(foreign key) da tabela pedido para 1
update pedido set fkempresa = 1;

-- mostrar status da tabela empresa
select * from empresa;

-- renomar a coluna "id" para "numero_pedido" dentro da tabela "pedido"
alter table pedido rename column id to numero_pedido;

-- adicionar chave primária(primary key)
alter table pedido add constraint pk_pedido
	  primary key (fkempresa, numero_pedido);
      
select * from pedido;

-- adicinar coluna fkempresa
alter table pedido_item add fkempresa int not null;
select * from pedido_item;

-- adicinar coluna fkempresa
alter table pedido_item rename column fkpedido to fknumero_pedido;

-- adicinar coluna fkempresa
alter table pedido_item add sequencia int not null;
