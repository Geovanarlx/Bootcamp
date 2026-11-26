-- Atividade de Banco de Dados: Consultas com duas tabelas
-- Dialeto: MySQL 8.0+
-- O PDF fornecido está nomeado Atividade05.pdf, mas a capa indica Atividade 03.

CREATE DATABASE IF NOT EXISTS atividade05_consultas
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE atividade05_consultas;

-- Recria somente as tabelas deste exercício para permitir executar o arquivo novamente.
DROP TABLE IF EXISTS Projetos;
DROP TABLE IF EXISTS Funcionarios;

CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL
);

INSERT INTO Funcionarios (Nome, Cargo, Salario) VALUES
    ('Jon Snow', 'Desenvolvedor', 4500.00),
    ('Daenerys Targaryen', 'Analista', 3800.00),
    ('Arya Stark', 'Desenvolvedor', 4800.00),
    ('Tyrion Lannister', 'DBA', 5200.00),
    ('Euron Greyjoy', 'Suporte', 3100.00);

CREATE TABLE Projetos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    NomeProjeto VARCHAR(100) NOT NULL,
    Responsavel VARCHAR(50) NOT NULL
);

INSERT INTO Projetos (NomeProjeto, Responsavel) VALUES
    ('Site Institucional', 'Jon Snow'),
    ('App Mobile', 'Daenerys Targaryen'),
    ('ERP Interno', 'Arya Stark'),
    ('Dashboard BI', 'Varys');

-- 3. Todos os nomes de funcionários e responsáveis, mantendo duplicados.
SELECT Nome AS Nome
FROM Funcionarios
UNION ALL
SELECT Responsavel AS Nome
FROM Projetos;

-- 4. Nomes distintos entre funcionários e responsáveis.
SELECT Nome AS Nome
FROM Funcionarios
UNION
SELECT Responsavel AS Nome
FROM Projetos;

-- 5. Funcionários cujo nome contém a letra "a", sem diferenciar maiúsculas/minúsculas.
SELECT *
FROM Funcionarios
WHERE LOWER(Nome) LIKE '%a%';

-- 6. Funcionários com salário entre 4000.00 e 5000.00, inclusive.
SELECT *
FROM Funcionarios
WHERE Salario BETWEEN 4000.00 AND 5000.00;

-- 7. Menor e maior salário.
SELECT
    MIN(Salario) AS MenorSalario,
    MAX(Salario) AS MaiorSalario
FROM Funcionarios;

-- 8. Três funcionários com os maiores salários.
SELECT *
FROM Funcionarios
ORDER BY Salario DESC
LIMIT 3;

-- 9. Quantidade e média salarial por cargo, somente média superior a 4000.00.
SELECT
    Cargo,
    COUNT(*) AS QuantidadeFuncionarios,
    AVG(Salario) AS MediaSalarial
FROM Funcionarios
GROUP BY Cargo
HAVING AVG(Salario) > 4000.00;

