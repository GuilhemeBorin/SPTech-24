-- PRATICA 08

-- Fazer a modelagem lógica (fazer no MySQL WorkBench) de um sistema para cadastrar as informações sobre cada grupo de Pesquisa e Inovação do 1° semestre, 
-- seus integrantes e os professores que avaliarão os grupos.
-- Cada grupo é composto por um ou mais alunos, e é avaliado por um ou mais professores.
-- Cada aluno pertence a apenas um grupo.
-- Cada professor avalia um ou mais grupos.
-- Sobre cada grupo, o sistema guarda uma identificação que é inicializada com 1 e incrementada de forma automática. 
-- Essa identificação é a chave primária que identifica um grupo de forma única. Além da identificação, 
-- o sistema guarda o nome do grupo, a descrição do projeto (por exemplo:
-- controle de temperatura em chocadeiras).
-- Sobre cada aluno, o sistema guarda também um RA que identifica de forma única cada aluno. 
-- O valor do RA não é gerado de forma automática pelo sistema. Além do RA, o sistema guarda o nome e o e-mail do aluno.
-- Sobre cada professor, o sistema guarda também uma identificação que é inicializada com 10000 e 
-- é incrementada de forma automática pelo sistema. Essa identificação identifica um professor de forma única. 
-- Além da identificação, o sistema guarda o nome do professor e a disciplina que o professor ministra para o 1° semestre.
-- Os grupos são avaliados por pelo menos 2 professores. O sistema armazena a data e o horário de início da avaliação do grupo, 
-- além da nota atribuída pelo professor ao grupo.
-- Após a modelagem, implementar no MySQL:


-- 1. Criar as tabelas no MySQL e executar as instruções relacionadas a seguir.

-- Tabela GrupoPesquisaInovacao
CREATE TABLE GrupoPesquisaInovacao (
    IDGrupo INT AUTO_INCREMENT PRIMARY KEY,
    NomeGrupo VARCHAR(100),
    DescricaoProjeto TEXT
);

-- Tabela Aluno
CREATE TABLE Aluno (
    RA INT PRIMARY KEY,
    NomeAluno VARCHAR(100),
    Email VARCHAR(100),
    IDGrupo INT,
    FOREIGN KEY (IDGrupo) REFERENCES GrupoPesquisaInovacao(IDGrupo)
);

-- Tabela Professor
CREATE TABLE Professor (
    IDProfessor INT AUTO_INCREMENT PRIMARY KEY,
    NomeProfessor VARCHAR(100),
    Disciplina VARCHAR(100),
    IDGrupo INT,
    FOREIGN KEY (IDGrupo) REFERENCES GrupoPesquisaInovacao(IDGrupo)
);

-- Tabela AvaliacaoGrupo
CREATE TABLE AvaliacaoGrupo (
    IDAvaliacao INT AUTO_INCREMENT PRIMARY KEY,
    IDGrupo INT,
    IDProfessor INT,
    DataInicio DATETIME,
    Nota DECIMAL(4,2),
    FOREIGN KEY (IDGrupo) REFERENCES GrupoPesquisaInovacao(IDGrupo),
    FOREIGN KEY (IDProfessor) REFERENCES Professor(IDProfessor)
);


-- 2. Insira dados nas tabelas, de forma que tenha pelo menos 2 grupos cadastrados.

-- Inserir dados na tabela GrupoPesquisaInovacao
INSERT INTO GrupoPesquisaInovacao (NomeGrupo, DescricaoProjeto) VALUES
('Grupo 1', 'Controle de temperatura em chocadeiras'),
('Grupo 2', 'Desenvolvimento de aplicativo para controle de estoque');

-- Inserir dados na tabela Aluno
INSERT INTO Aluno (RA, NomeAluno, Email, IDGrupo) VALUES
(123456, 'João Silva', 'joao@example.com', 1),
(234567, 'Maria Santos', 'maria@example.com', 1),
(345678, 'Pedro Oliveira', 'pedro@example.com', 2),
(456789, 'Ana Souza', 'ana@example.com', 2);

-- Inserir dados na tabela Professor
INSERT INTO Professor (NomeProfessor, Disciplina, IDGrupo) VALUES
('Prof. Carlos', 'Engenharia Elétrica', 1),
('Prof. Paula', 'Sistemas de Informação', 2);

-- Inserir dados na tabela AvaliacaoGrupo
INSERT INTO AvaliacaoGrupo (IDGrupo, IDProfessor, DataInicio, Nota) VALUES
(1, 1, '2024-05-10 09:00:00', 8.5),
(1, 2, '2024-05-11 10:00:00', 9.0),
(2, 1, '2024-05-10 11:00:00', 7.8),
(2, 2, '2024-05-11 12:00:00', 8.2);


-- Após inserir dados nas tabelas:
-- 3. Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM GrupoPesquisaInovacao;
SELECT * FROM Aluno;
SELECT * FROM Professor;
SELECT * FROM AvaliacaoGrupo;

-- 4. Se for necessário, fazer os acertos da(s) chave(s) estrangeira(s).

-- 5. Exibir os dados dos grupos e os dados de seus respectivos alunos.
SELECT gp.NomeGrupo, gp.DescricaoProjeto, a.RA, a.NomeAluno, a.Email
FROM GrupoPesquisaInovacao gp
INNER JOIN Aluno a ON gp.IDGrupo = a.IDGrupo;

-- 6. Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
SELECT gp.NomeGrupo, gp.DescricaoProjeto, a.RA, a.NomeAluno, a.Email
FROM GrupoPesquisaInovacao gp
INNER JOIN Aluno a ON gp.IDGrupo = a.IDGrupo
WHERE gp.IDGrupo = 1; -- Substitua pelo ID do grupo desejado

-- 7. Exibir a média das notas atribuídas aos grupos, no geral.
SELECT gp.NomeGrupo, gp.DescricaoProjeto, a.RA, a.NomeAluno, a.Email
FROM GrupoPesquisaInovacao gp
INNER JOIN Aluno a ON gp.IDGrupo = a.IDGrupo
WHERE gp.IDGrupo = 1; -- Substitua pelo ID do grupo desejado

-- 8. Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
SELECT MIN(Nota) AS NotaMinima, MAX(Nota) AS NotaMaxima
FROM AvaliacaoGrupo;

-- 9. Exibir a soma das notas dadas aos grupos, no geral
SELECT SUM(Nota) AS SomaNotas
FROM AvaliacaoGrupo;

-- 10. Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação.
SELECT p.NomeProfessor, gp.NomeGrupo, ag.DataInicio, ag.Nota
FROM AvaliacaoGrupo ag
INNER JOIN Professor p ON ag.IDProfessor = p.IDProfessor
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo;

-- 11. Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.
SELECT p.NomeProfessor, gp.NomeGrupo, ag.DataInicio, ag.Nota
FROM AvaliacaoGrupo ag
INNER JOIN Professor p ON ag.IDProfessor = p.IDProfessor
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo
WHERE gp.IDGrupo = 1; -- Substitua pelo ID do grupo desejado

-- 12. Exibir os nomes dos grupos que foram avaliados por um determinado
SELECT DISTINCT gp.NomeGrupo
FROM AvaliacaoGrupo ag
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo
WHERE ag.IDProfessor = 1; -- Substitua pelo ID do professor desejado

-- 13. Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação.
SELECT gp.NomeGrupo, a.RA, a.NomeAluno, p.NomeProfessor, ag.DataInicio, ag.Nota
FROM AvaliacaoGrupo ag
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo
INNER JOIN Aluno a ON gp.IDGrupo = a.IDGrupo
INNER JOIN Professor p ON ag.IDProfessor = p.IDProfessor;

-- 14. Exibir a quantidade de notas distintas.
SELECT COUNT(DISTINCT Nota) AS QuantidadeNotasDistintas
FROM AvaliacaoGrupo;

-- 15. Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor.
SELECT p.IDProfessor, p.NomeProfessor, AVG(ag.Nota) AS MediaNotas, SUM(ag.Nota) AS SomaNotas
FROM AvaliacaoGrupo ag
INNER JOIN Professor p ON ag.IDProfessor = p.IDProfessor
GROUP BY p.IDProfessor, p.NomeProfessor;

-- 16. Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.
SELECT gp.IDGrupo, gp.NomeGrupo, AVG(ag.Nota) AS MediaNotas, SUM(ag.Nota) AS SomaNotas
FROM AvaliacaoGrupo ag
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo
GROUP BY gp.IDGrupo, gp.NomeGrupo;

-- 17. Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.
SELECT p.IDProfessor, p.NomeProfessor, MIN(ag.Nota) AS MenorNota, MAX(ag.Nota) AS MaiorNota
FROM AvaliacaoGrupo ag
INNER JOIN Professor p ON ag.IDProfessor = p.IDProfessor
GROUP BY p.IDProfessor, p.NomeProfessor;

-- 18. Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.
SELECT gp.IDGrupo, gp.NomeGrupo, MIN(ag.Nota) AS MenorNota, MAX(ag.Nota) AS MaiorNota
FROM AvaliacaoGrupo ag
INNER JOIN GrupoPesquisaInovacao gp ON ag.IDGrupo = gp.IDGrupo
GROUP BY gp.IDGrupo, gp.NomeGrupo;
