# Exercício 11 - Agência de Publicidade

## Descrição do Cenário

Este exercício apresenta um sistema de banco de dados para uma agência de publicidade. O objetivo é demonstrar como
identificar o registro com o valor máximo em uma coluna específica, utilizando ORDER BY combinado com LIMIT para
encontrar o profissional mais bem pago da agência.

### Contexto do Negócio

A agência de publicidade possui diversos profissionais em diferentes funções, cada um com seu respectivo salário. Para
fins administrativos, relatórios de RH ou análises salariais, é importante identificar rapidamente quem é o profissional
com a maior remuneração, incluindo suas informações pessoais e profissionais completas.

### Estrutura dos Dados

O sistema é composto por uma entidade principal que armazena informações dos profissionais:

```mermaid
erDiagram
    PROFISSIONAL {
        int Profissional_ID PK
        string Nome
        string Sobrenome
        string Funcao
        decimal Salario
    }
```

## Implementação em PostgreSQL

### Definição da Estrutura (DDL)

O código abaixo cria o esquema e a tabela necessária para o sistema:

```sql
-- Criação do esquema para organizar as tabelas
CREATE SCHEMA Agencia_Publicidade;
SET search_path TO Agencia_Publicidade;

-- Tabela para armazenar dados dos profissionais
CREATE TABLE Profissional
(
    Profissional_ID SERIAL PRIMARY KEY,
    Nome            VARCHAR(100)   NOT NULL,
    Sobrenome       VARCHAR(100)   NOT NULL,
    Funcao          VARCHAR(50),
    Salario         NUMERIC(10, 2) NOT NULL
);
```

### Inserção de Dados de Exemplo

Para demonstrar o funcionamento do sistema, inserimos alguns registros de exemplo:

```sql
-- Inserção de profissionais com diferentes salários
INSERT INTO Profissional (Nome, Sobrenome, Funcao, Salario)
VALUES ('Ana', 'Silva', 'Diretora de Criação', 12000.00), -- Maior salário
       ('Carlos', 'Oliveira', 'Designer', 7000.00),
       ('Fernanda', 'Costa', 'Redatora', 6500.00),
       ('João', 'Pereira', 'Gerente de Contas', 8500.00);
```

### Consulta Principal: Profissional Mais Bem Pago

O objetivo principal deste exercício é identificar o profissional com o maior salário:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario
FROM Profissional
ORDER BY Salario DESC
LIMIT 1;
```

**Resultado esperado:**

```
Nome | Sobrenome | Funcao              | Salario
-----|-----------|--------------------|---------
Ana  | Silva     | Diretora de Criação | 12000.00
```

## Explicação Técnica

### Operações Utilizadas

1. **ORDER BY com DESC**:
    - `ORDER BY Salario DESC` ordena os registros do maior para o menor salário
    - DESC (descendente) garante que o maior valor apareça primeiro
    - Sem DESC, a ordenação seria crescente (ASC é o padrão)

2. **LIMIT**:
    - `LIMIT 1` retorna apenas o primeiro registro do resultado ordenado
    - Como ordenamos por salário decrescente, o primeiro registro é o de maior salário
    - Eficiente para obter apenas o "top 1" de qualquer critério

3. **SELECT específico**:
    - Retorna apenas as colunas solicitadas: Nome, Sobrenome, Funcao e Salario
    - Fornece informações completas sobre o profissional mais bem pago

### Processo de Seleção

1. Todos os registros são ordenados por salário em ordem decrescente
2. O LIMIT 1 seleciona apenas o primeiro registro (maior salário)
3. As informações do profissional são retornadas conforme especificado no SELECT

### Consultas Adicionais Úteis

#### Top 3 profissionais mais bem pagos:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario,
       ROW_NUMBER() OVER (ORDER BY Salario DESC) AS Posicao
FROM Profissional
ORDER BY Salario DESC
LIMIT 3;
```

#### Profissional mais bem pago por função:

```sql
SELECT DISTINCT ON (Funcao) Nome,
                            Sobrenome,
                            Funcao,
                            Salario
FROM Profissional
ORDER BY Funcao, Salario DESC;
```

#### Comparar com salário médio:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario,
       (SELECT AVG(Salario) FROM Profissional)           AS Salario_Medio,
       Salario - (SELECT AVG(Salario) FROM Profissional) AS Diferenca_Media
FROM Profissional
ORDER BY Salario DESC
LIMIT 1;
```

#### Profissionais com salário acima da média:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario
FROM Profissional
WHERE Salario > (SELECT AVG(Salario) FROM Profissional)
ORDER BY Salario DESC;
```

#### Estatísticas salariais por função:

```sql
SELECT Funcao,
       COUNT(*)        AS Quantidade_Profissionais,
       MIN(Salario)    AS Menor_Salario,
       MAX(Salario)    AS Maior_Salario,
       AVG(Salario)    AS Salario_Medio,
       STDDEV(Salario) AS Desvio_Padrao
FROM Profissional
GROUP BY Funcao
ORDER BY Salario_Medio DESC;
```

#### Ranking de salários:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario,
       RANK() OVER (ORDER BY Salario DESC)         AS Ranking,
       DENSE_RANK() OVER (ORDER BY Salario DESC)   AS Ranking_Denso,
       PERCENT_RANK() OVER (ORDER BY Salario DESC) AS Percentil
FROM Profissional
ORDER BY Salario DESC;
```

#### Profissional mais bem pago com nome completo:

```sql
SELECT CONCAT(Nome, ' ', Sobrenome)     AS Nome_Completo,
       Funcao,
       TO_CHAR(Salario, 'FM999G999D00') AS Salario_Formatado
FROM Profissional
ORDER BY Salario DESC
LIMIT 1;
```

#### Diferença salarial entre o maior e menor salário:

```sql
SELECT (SELECT CONCAT(Nome, ' ', Sobrenome) FROM Profissional ORDER BY Salario DESC LIMIT 1) AS Maior_Salario_Nome,
       (SELECT Salario FROM Profissional ORDER BY Salario DESC LIMIT 1)                      AS Maior_Salario,
       (SELECT CONCAT(Nome, ' ', Sobrenome) FROM Profissional ORDER BY Salario ASC LIMIT 1)  AS Menor_Salario_Nome,
       (SELECT Salario FROM Profissional ORDER BY Salario ASC LIMIT 1)                       AS Menor_Salario,
       (SELECT MAX(Salario) - MIN(Salario) FROM Profissional)                                AS Diferenca_Salarial;
```

### Variações da Consulta Principal

#### Usando subconsulta com MAX:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario
FROM Profissional
WHERE Salario = (SELECT MAX(Salario) FROM Profissional);
```

#### Incluindo informações adicionais:

```sql
SELECT Profissional_ID,
       Nome,
       Sobrenome,
       Funcao,
       Salario,
       CURRENT_DATE AS Data_Consulta
FROM Profissional
ORDER BY Salario DESC
LIMIT 1;
```

#### Tratando empates (múltiplos profissionais com mesmo salário máximo):

```sql
-- Retorna todos os profissionais com o salário máximo
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario
FROM Profissional
WHERE Salario = (SELECT MAX(Salario) FROM Profissional)
ORDER BY Nome;
```

#### Com window function:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario
FROM (SELECT Nome,
             Sobrenome,
             Funcao,
             Salario,
             ROW_NUMBER() OVER (ORDER BY Salario DESC) as rn
      FROM Profissional) ranked
WHERE rn = 1;
```

#### Profissional mais bem pago com contexto:

```sql
SELECT Nome,
       Sobrenome,
       Funcao,
       Salario,
       (SELECT COUNT(*) FROM Profissional)                                 AS Total_Profissionais,
       ROUND((Salario / (SELECT SUM(Salario) FROM Profissional)) * 100, 2) AS Percentual_Folha
FROM Profissional
ORDER BY Salario DESC
LIMIT 1;
```

