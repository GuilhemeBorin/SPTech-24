use sprint2;

/*Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50),
sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela. */
create table Curso(
idCurso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(45)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.
insert into Curso values
(null, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson Santos'),
(null, 'Ciência da Computação', 'CCO', 'Marise Miranda'),
(null, 'Sistemas de Informação', 'SI', 'Alex Barreira');

/*Crie uma regra de negócio com uma nova tabela a sua escolha. Relacione a
tabela que você criou com a tabela curso e insira ou atualize os dados; */
create table Aluno(
idAluno int primary key,
nome varchar(45),
semestre varchar(30),
fkCurso int
);

-- Inserir dados na tabela.
insert into Aluno(idAluno, nome, semestre) values
(01232168, 'Guilherme', '1º Semestre'),
(01241215, 'Maykon', '2º Semestre'),
(01241066, 'Yasmim', '3º Semestre');	

-- Relacionando as tableas
alter table Aluno add constraint Curso_fkCurso foreign key (fkCurso) references Curso(idCurso);

-- Execute os comandos para:
-- a) Crie a Modelagem Lógica;

-- b) Faça um JOIN entre as duas tabelas;
select * from Curso as c inner join Aluno as a on a.fkCurso = c.idCurso;

-- configurando chave estrangeira
update Aluno set fkCurso = 1 where idAluno = 01232168;
update Aluno set fkCurso = 2 where idAluno = 01241215;
update Aluno set fkCurso = 3 where idAluno = 01241066;

-- c) Faça um JOIN com WHERE entre as duas tabelas;
select * from Curso as c inner join Aluno as a on a.fkCurso = c.idCurso where idAluno = 01232168;

-- d) Crie um campo com a restrição (constraint) de CHECK;
ALTER TABLE Curso
ADD COLUMN duracao INT,
ADD CONSTRAINT duracao_check CHECK (duracao > 0);
alter table Aluno add column apelido int, add constraint apelido_check check (apelido != null);