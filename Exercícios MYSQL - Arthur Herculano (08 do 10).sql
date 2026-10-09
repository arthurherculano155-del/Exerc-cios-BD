CREATE DATABASE empresa_exercicios;
USE empresa_exercicios;


-- TABELA DE DEPARTAMENTOS

CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);


-- TABELA DE FUNCIONÁRIOS

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
);


-- TABELA DE PROJETOS

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
);


-- INSERTS DE DEPARTAMENTOS

INSERT INTO departamentos (nome, cidade)
VALUES
('Recursos Humanos', 'São Paulo'),
('Tecnologia da Informação', 'São Paulo'),
('Financeiro', 'Campinas'),
('Marketing', 'São Paulo'),
('Administração', 'Santos'),
('Logística', 'Campinas');


-- INSERTS DE FUNCIONÁRIOS

INSERT INTO funcionarios
(nome, idade, cidade, salario, id_departamento)
VALUES
('Ana Souza', 25, 'São Paulo', 3200.00, 1),
('Bruno Lima', 30, 'São Paulo', 4500.00, 2),
('Carlos Mendes', 40, 'Campinas', 6200.00, 3),
('Daniela Rocha', 28, 'São Paulo', 3800.00, 4),
('Eduardo Silva', 35, 'Santos', 5000.00, 5),
('Fernanda Costa', 22, 'Campinas', 2800.00, 6),
('Gabriel Almeida', 27, 'São Paulo', 5500.00, 2),
('Helena Martins', 33, 'Campinas', 4100.00, 3),
('Igor Ferreira', 45, 'São Paulo', 7500.00, 1),
('Juliana Ribeiro', 29, 'São Paulo', 4700.00, 4),
('Lucas Pereira', 24, 'Santos', 2900.00, 5),
('Mariana Oliveira', 31, 'São Paulo', 6100.00, 2),
('Nathan Gomes', 38, 'Campinas', 6800.00, 6),
('Patricia Santos', 26, 'São Paulo', 3500.00, 1),
('Rafael Barbosa', 42, 'Campinas', 7200.00, 3),
('Sofia Carvalho', 23, 'São Paulo', 3100.00, 4),
('Thiago Nunes', 34, 'Santos', 5800.00, 5),
('Vanessa Dias', 37, 'Campinas', 4900.00, 6),
('William Castro', 28, 'São Paulo', 6300.00, 2),
('Yasmin Teixeira', 30, 'São Paulo', 4000.00, 1);


-- INSERTS DE PROJETOS

INSERT INTO projetos
(nome, valor, status, id_departamento)
VALUES
('Recrutamento Digital', 25000.00, 'Em andamento', 1),
('Treinamento Corporativo', 18000.00, 'Planejamento', 1),
('Sistema de Gestão', 55000.00, 'Em andamento', 2),
('Aplicativo Mobile', 45000.00, 'Planejamento', 2),
('Segurança da Informação', 75000.00, 'Concluído', 2),
('Controle Financeiro', 30000.00, 'Em andamento', 3),
('Auditoria Interna', 65000.00, 'Planejamento', 3),
('Campanha Publicitária', 40000.00, 'Em andamento', 4),
('Marketing Digital', 22000.00, 'Planejamento', 4),
('Gestão Administrativa', 35000.00, 'Em andamento', 5),
('Automação de Processos', 60000.00, 'Planejamento', 5),
('Controle de Estoque', 28000.00, 'Em andamento', 6),
('Sistema de Entregas', 52000.00, 'Concluído', 6),
('Expansão Operacional', 80000.00, 'Planejamento', 6),
('Portal de Funcionários', 48000.00, 'Em andamento', 1);


-- CONSULTAS PARA CONFERIR OS DADOS

SELECT * FROM departamentos;

SELECT * FROM funcionarios;

SELECT * FROM projetos;


-- EXERCÍCIOS


-- 1. Liste o nome dos funcionários e o nome do departamento ao qual cada funcionário pertence. Utilize INNER JOIN.

select f.nome as Funcionário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento;


-- 2. Liste o nome dos funcionários, suas cidades e o nome dos respectivos departamentos, mostrando somente os funcionários que trabalham em departamentos localizados em São Paulo.

select f.nome as Funcionário, f.cidade as Cidade, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where d.cidade = "São Paulo";


-- 3. Liste o nome dos funcionários e seus salários, mostrando somente aqueles que possuem salário entre R$3.000,00 e R$5.000,00. Utilize BETWEEN.

select f.nome as Funcionário, f.salario as Salário
from funcionarios f
where f.salario between 3000 and 5000;


-- 4. Liste o nome dos funcionários e o nome do departamento, mostrando somente os funcionários que pertencem aos departamentos 1, 3 ou 5. Utilize IN.

select f.nome as Funcionário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where d.id_departamento in (1, 3, 5);


-- 5. Liste o nome e a idade dos funcionários que possuem idade entre 25 e 35 anos e pertencem a algum departamento. Utilize BETWEEN e INNER JOIN.

select f.nome as Funcionário, f.idade as Idade, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where f.idade between 25 and 35;


-- 6. Liste o nome dos funcionários que trabalham nas cidades de São Paulo ou Campinas. Utilize OR.

select f.nome as Funcionário, f.cidade as Cidade
from funcionarios f
where f.cidade = "São Paulo"
or f.cidade = "Campinas"
order by f.cidade;


-- 7. Liste o nome do funcionário, seu salário e o nome do departamento, mostrando somente funcionários com salário acima de R$4.000,00.

select f.nome as Funcionário, f.salario as Salário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where f.salario > 4000;


-- 8. Liste o nome dos funcionários e seus respectivos departamentos, mostrando apenas os funcionários que trabalham nos departamentos 2, 4 ou 6. Utilize IN.

select f.nome as Funcionário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where d.id_departamento in (2, 4, 6);


-- 9. Liste o nome dos funcionários, salário e departamento, mostrando aqueles que possuem salário entre R$3.500,00 e R$6.000,00 e pertencem ao departamento de Tecnologia da Informação.

select f.nome as Funcionário, f.salario as Salário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where f.salario between 3500 and 6000
and d.nome = "Tecnologia da Informação";


-- 10. Liste os funcionários que possuem idade entre 25 e 40 anos ou salário superior a R$6.000,00. Utilize BETWEEN e OR.

select f.nome as Funcionário, f.idade as Idade, f.salario as Salário
from funcionarios f
where f.idade between 25 and 40
or f.salario > 6000;


-- EXERCÍCIOS COM 3 TABELAS


-- 11. Liste o nome do funcionário, o nome do departamento e o nome dos projetos pertencentes ao departamento desse funcionário. Utilize INNER JOIN com as três tabelas.

select f.nome as Funcionário, d.nome as Departamento, p.nome as Projeto
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento;


-- 12. Liste o nome do projeto, seu valor e o nome do departamento responsável pelo projeto.

select p.nome as Projeto, p.valor as Valor, d.nome as Departamento
from projetos p
inner join departamentos d
on p.id_departamento = d.id_departamento;


-- 13. Liste o nome do funcionário, o departamento e o projeto, mostrando somente projetos com valor entre R$20.000,00 e R$50.000,00.

select f.nome as Funcionário, d.nome as Departamento, p.nome as Projeto
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where p.valor between 20000 and 50000;


-- 14. Liste o nome do funcionário, o departamento e o projeto, mostrando somente projetos com status 'Em andamento' ou 'Planejamento'. Utilize OR.

select f.nome as Funcionário, d.nome as Departamento, p.nome as Projeto
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where p.status = "Em andamento"
or p.status = "Planejamento";


-- 15. Liste os projetos pertencentes aos departamentos 1, 2 ou 5. Mostre o nome do projeto, valor e departamento. Utilize IN.

select p.nome as Projeto, p.valor as Valor, d.nome as Departamento
from projetos p
inner join departamentos d
on p.id_departamento = d.id_departamento
where d.id_departamento in (1, 2, 5);


-- 16. Liste o nome dos funcionários, seus salários, o departamento e o projeto, mostrando funcionários com salário entre R$3.000,00 e R$6.000,00.

select f.nome as Funcionário, f.salario as Salário, d.nome as Departamento, p.nome as Projeto
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where f.salario between 3000 and 6000;


-- 17. Liste o nome do funcionário, departamento e projeto, mostrando somente projetos com valor superior a R$40.000,00 ou com status 'Planejamento'.

select f.nome as Funcionário, d.nome as Departamento, p.nome as Projeto
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where p.valor > 40000
or p.status = "Planejamento";


-- 18. Liste os funcionários que pertencem aos departamentos 2, 3 ou 4 e possuem salário entre R$3.500,00 e R$7.000,00. Mostre também o departamento.

select f.nome as Funcionário, f.salario as Salário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where d.id_departamento in (2, 3, 4)
and f.salario between 3500 and 7000;


-- 19. Liste o nome do funcionário, departamento, projeto e valor do projeto, mostrando somente projetos com valor entre R$25.000,00 e R$60.000,00 e status 'Em andamento'.

select f.nome as Funcionário, d.nome as Departamento, p.nome as Projeto, p.valor as Valor
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where p.valor between 25000 and 60000
and p.status = "Em andamento";


-- 20. Liste o nome do funcionário, idade, salário, departamento, projeto e valor do projeto. Mostre somente os funcionários que atendam a pelo menos uma das seguintes condições:
-- idade entre 25 e 30 anos;
-- salário acima de R$6.000,00;
-- projeto com valor acima de R$50.000,00.
-- Utilize INNER JOIN, WHERE, BETWEEN e OR.

select f.nome as Funcionário, f.idade as Idade, f.salario as Salário, d.nome as Departamento, p.nome as Projeto, p.valor as Valor
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
inner join projetos p
on d.id_departamento = p.id_departamento
where f.idade between 25 and 30
or f.salario > 6000
or p.valor > 50000;

-- 21. Liste o nome dos funcionários, salário e cidade,
-- mostrando somente aqueles que trabalham em São Paulo
-- e possuem salário superior a R$ 4.000,00.
-- Utilize WHERE e AND.

select f.nome, f.salario, f.cidade
from funcionarios f
where f.cidade = "São Paulo" and
f.salario > 4000;


-- 22. Liste o nome dos funcionários e o departamento
-- ao qual pertencem, mostrando somente funcionários
-- que trabalham nos departamentos 1, 2, 3 ou 4.
-- Utilize INNER JOIN e IN.

select f.nome as Funcionário, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where d.id_departamento IN(1, 2, 3, 4);

-- 23. Liste o nome dos funcionários, idade e departamento,
-- mostrando somente aqueles que possuem idade entre
-- 30 e 40 anos e pertencem ao departamento 2 ou 5.
-- Utilize BETWEEN, IN e INNER JOIN.

select f.nome as Funcionário, f.idade, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where f.idade between 30 and 40
and d.id_departamento in(2, 5);

-- 24. Liste o nome dos funcionários, salário e departamento,
-- mostrando somente aqueles que possuem salário entre
-- R$ 4.000,00 e R$ 7.000,00 e trabalham no departamento
-- de Tecnologia da Informação.
-- Utilize BETWEEN e AND.

select f.nome as Funcionário, f.salario, d.nome as Departamento
from funcionarios f
inner join departamentos d
on f.id_departamento = d.id_departamento
where f.salario between 4000 and 7000
and d.nome = "Tecnologia da Informação";

-- 25. Liste o nome dos funcionários e suas respectivas
-- cidades, mostrando aqueles que trabalham em
-- São Paulo, Campinas ou Santos.
-- Utilize IN.

select f.nome, f.cidade
from funcionarios f
where f.cidade IN("São Paulo", "Campinas", "Santos");

-- 26. Liste o nome do funcionário, departamento e projeto,
-- mostrando somente funcionários que possuem salário
-- superior a R$ 5.000,00 ou trabalham no departamento 3.
-- Utilize INNER JOIN e OR.

select f.nome as Funcionário, 
f.salario, 
d.nome as Departamento, 
p.nome as Projeto
from funcionarios f
	inner join departamentos d
	on f.id_departamento = d.id_departamento
	inner join projetos p
    on f.id_departamento = p.id_departamento
where f.salario > 5000 and
d.id_departamento = 3;

-- 27. Liste o nome do projeto, valor e departamento,
-- mostrando somente projetos cujo valor esteja entre
-- R$ 30.000,00 e R$ 70.000,00.
-- Utilize BETWEEN.

select
p.nome as Projeto, 
p.valor, 
d.nome as Departamento
from projetos p
	inner join departamentos d
    on p.id_departamento = d.id_departamento
where p.valor between 30000 and 70000;


-- 28. Liste o nome do funcionário, departamento e projeto,
-- mostrando somente projetos que estejam com status
-- 'Em andamento' ou 'Planejamento' e cujo valor
-- seja superior a R$ 30.000,00.
-- Utilize OR e AND.

select f.nome as Funcionário, 
p.valor, 
d.nome as Departamento, 
p.nome as Projeto,
p.status as Situação
from funcionarios f
	inner join departamentos d
	on f.id_departamento = d.id_departamento
	inner join projetos p
    on f.id_departamento = p.id_departamento
where p.status in("Em andamento", "Planejamento") and
p.valor > 30000;


-- 29. Liste o nome dos funcionários, salário, departamento
-- e projeto, mostrando somente funcionários que possuem
-- salário entre R$ 4.000,00 e R$ 6.500,00 e que estejam
-- vinculados a projetos com valor superior a R$ 30.000,00.

select 
f.nome as Funcionário, 
f.salario, 
d.nome as Departamento, 
p.nome as Projeto,
p.valor
from funcionarios f
	inner join departamentos d
	on f.id_departamento = d.id_departamento
	inner join projetos p
    on f.id_departamento = p.id_departamento
where f.salario between 4000 and 6500 and
p.valor > 30000
order by f.nome;

-- 30. Liste o nome do funcionário, cidade, departamento
-- e projeto, mostrando somente funcionários que trabalham
-- em São Paulo ou Campinas e pertencem aos
-- departamentos 1, 2 ou 3.
-- Utilize OR, IN e INNER JOIN.

SELECT
    f.nome,
    f.cidade,
    d.nome AS departamento,
    p.nome AS projeto
FROM funcionarios f
INNER JOIN departamentos d
    ON f.id_departamento = d.id_departamento
INNER JOIN projetos p
    ON d.id_departamento = p.id_departamento
WHERE
    (f.cidade = 'São Paulo'
    OR f.cidade = 'Campinas')
    AND d.id_departamento IN (1, 2, 3);


-- 31. Liste o nome do funcionário, idade, salário
-- e departamento, mostrando somente funcionários que
-- tenham idade entre 25 e 35 anos e salário superior
-- a R$ 4.000,00, ou funcionários com salário
-- superior a R$ 7.000,00.
-- Utilize BETWEEN, AND e OR.

SELECT
    f.nome,
    f.idade,
    f.salario,
    d.nome AS departamento
FROM funcionarios f
INNER JOIN departamentos d
    ON f.id_departamento = d.id_departamento
WHERE
    (f.idade BETWEEN 25 AND 35
    AND f.salario > 4000)
    OR f.salario > 7000;


-- 32. Liste o nome do funcionário, departamento, projeto
-- e valor do projeto, mostrando somente projetos
-- pertencentes aos departamentos 2, 4 ou 6 e com
-- valor entre R$ 20.000,00 e R$ 60.000,00.
-- Utilize IN e BETWEEN.

SELECT
    f.nome,
    d.nome AS departamento,
    p.nome AS projeto,
    p.valor AS valor_projeto
FROM funcionarios f
INNER JOIN departamentos d
    ON f.id_departamento = d.id_departamento
INNER JOIN projetos p
    ON d.id_departamento = p.id_departamento
WHERE
    d.id_departamento IN (2, 4, 6)
    AND p.valor BETWEEN 20000 AND 60000;


-- 33. Liste o nome do funcionário, salário, departamento,
-- projeto e status do projeto, mostrando somente
-- funcionários que possuem salário entre R$ 3.500,00
-- e R$ 6.000,00 e projetos com status
-- 'Em andamento' ou 'Planejamento'.

SELECT
    f.nome,
    f.salario,
    d.nome AS departamento,
    p.nome AS projeto,
    p.status AS status_projeto
FROM funcionarios f
INNER JOIN departamentos d
    ON f.id_departamento = d.id_departamento
INNER JOIN projetos p
    ON d.id_departamento = p.id_departamento
WHERE
    f.salario BETWEEN 3500 AND 6000
    AND p.status IN (
        'Em andamento',
        'Planejamento'
    );


-- 34. Liste o nome do funcionário, idade, salário,
-- departamento, projeto e valor do projeto.
-- Mostre somente funcionários que atendam
-- a uma das condições:
-- Idade entre 30 e 40 anos;
-- Salário entre R$ 5.000,00 e R$ 7.000,00;
-- Projeto com valor superior a R$ 60.000,00.

SELECT
    f.nome,
    f.idade,
    f.salario,
    d.nome AS departamento,
    p.nome AS projeto,
    p.valor AS valor_projeto
FROM funcionarios f
INNER JOIN departamentos d
    ON f.id_departamento = d.id_departamento
INNER JOIN projetos p
    ON d.id_departamento = p.id_departamento
WHERE
    f.idade BETWEEN 30 AND 40
    OR f.salario BETWEEN 5000 AND 7000
    OR p.valor > 60000;