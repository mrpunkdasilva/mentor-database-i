# Álgebra Relacional em Bancos de Dados

## O que é Álgebra Relacional?

A álgebra relacional é uma linguagem formal que define um conjunto de operações para manipular relações (tabelas) em um banco de dados. Cada operação toma uma ou mais relações como entrada e produz uma nova relação como saída. Isso permite a construção de consultas complexas a partir de operações mais simples.

## Importância da Álgebra Relacional

A álgebra relacional é importante porque:

- **Base Teórica**: Fornece a base teórica para a linguagem SQL, que é amplamente utilizada para interagir com bancos de dados relacionais.
- **Otimização de Consultas**: Ajuda na otimização de consultas, permitindo que os SGBDs escolham a melhor maneira de executar uma consulta.
- **Compreensão Profunda**: Oferece uma compreensão mais profunda de como os dados são processados e manipulados nos bancos de dados.

---

## 1. **Seleção (σ) - O Filtro de Linhas**  
*(Equivalente ao `WHERE` do SQL)*

### Conceito Visual:
Imagine uma peneira que só deixa passar as linhas que atendem à condição.

### Sintaxe Formal:

$$
\sigma_{\text{condição}}(R)
$$

### Como Funciona:
- Recebe uma tabela de entrada (`R`)
- Retorna apenas as linhas que satisfazem a condição
- **Não altera as colunas**, só filtra linhas

### Exemplo 1 (Básico):
**Tabela Funcionário:**

| id | nome    | salario | depto  |
|----|---------|---------|--------|
| 1  | Ana     | 2500    | RH     |
| 2  | Carlos  | 3800    | Vendas |
| 3  | João    | 4200    | TI     |

**Consulta:**  

$$
\sigma_{salario > 3000}(Funcionario)
$$

**Resultado:**

| id | nome    | salario | depto  |
|----|---------|---------|--------|
| 2  | Carlos  | 3800    | Vendas |
| 3  | João    | 4200    | TI     |

**SQL Correspondente:**
```sql
SELECT * FROM Funcionario WHERE salario > 3000;
```

### Exemplo 2 (Condição Composta):
**Consulta:**  

$$
\sigma_{depto='TI' \land salario < 4000}(Funcionario)
$$

**Resultado:** *(Nenhuma linha, pois João de TI ganha 4200)*

**SQL:**
```sql
SELECT * FROM Funcionario 
WHERE depto = 'TI' AND salario < 4000;
```

### Exemplo 3 (Com Texto):
**Consulta:**  

$$
\sigma_{nome \text{ LIKE 'A%'}}(Funcionario)
$$

**Resultado:**

| id | nome | salario | depto |
|----|------|---------|-------|
| 1  | Ana  | 2500    | RH    |

**SQL:**
```sql
SELECT * FROM Funcionario WHERE nome LIKE 'A%';
```

---

## 2. **Projeção (π) - O Seletor de Colunas**  
*(Equivalente à lista de colunas no `SELECT` do SQL)*

### Conceito Visual:
Imagine um holofote que ilumina apenas certas colunas da tabela.

### Sintaxe Formal:

$$
\pi_{\text{lista\_de\_colunas}}(R)
$$

### Como Funciona:
- Recebe uma tabela de entrada (`R`)
- Retorna **todas as linhas**, mas apenas com as colunas especificadas
- Remove duplicatas se não houver chave primária

### Exemplo 1 (Básico):
**Consulta:**  

$$
\pi_{nome, depto}(Funcionario)
$$

**Resultado:**

| nome    | depto  |
|---------|--------|
| Ana     | RH     |
| Carlos  | Vendas |
| João    | TI     |

**SQL:**
```sql
SELECT nome, depto FROM Funcionario;
```

### Exemplo 2 (Removendo Duplicatas):
**Tabela com dados repetidos:**

| id | nome   | cidade     |
|----|--------|------------|
| 1  | Ana    | São Paulo  |
| 2  | Carlos | Rio        |
| 3  | Ana    | São Paulo  |

**Consulta:**  

$$
\pi_{nome, cidade}(Clientes)
$$

**Resultado:** *(Remove a duplicata Ana/São Paulo)*

| nome   | cidade    |
|--------|-----------|
| Ana    | São Paulo |
| Carlos | Rio       |

**SQL:**

```sql
SELECT DISTINCT nome, cidade FROM Clientes;
```

### Exemplo 3 (Com Expressão):
**Consulta:**  
$$
\pi_{nome, salario*12}(Funcionario)
$$

**Resultado:**

| nome    | salario*12 |
|---------|------------|
| Ana     | 30000      |
| Carlos  | 45600      |
| João    | 50400      |

**SQL:**
```sql
SELECT nome, salario*12 FROM Funcionario;
```

---

## 3. **Produto Cartesiano (×) - O Combinador Total**  
*(Equivalente ao `CROSS JOIN` do SQL)*

### Conceito Visual:
Imagine duas listas sendo combinadas em todas as possibilidades possíveis.

### Sintaxe Formal:

$$
R \times S
$$

### Como Funciona:
- Combina **cada linha** da primeira tabela com **todas as linhas** da segunda
- Número de linhas resultante = (linhas de R) × (linhas de S)
- Cuidado! Pode gerar resultados muito grandes

### Exemplo 1 (Básico):
**Tabela Cores:**

| cor    |
|--------|
| Vermelho |
| Azul   |

**Tabela Tamanhos:**

| tamanho |
|---------|
| P       |
| M       |
| G       |

**Consulta:**  

$$
Cores \times Tamanhos
$$

**Resultado:**

| cor      | tamanho |
|----------|---------|
| Vermelho | P       |
| Vermelho | M       |
| Vermelho | G       |
| Azul     | P       |
| Azul     | M       |
| Azul     | G       |

**SQL:**
```sql
SELECT * FROM Cores CROSS JOIN Tamanhos;
-- ou
SELECT * FROM Cores, Tamanhos;
```

### Exemplo 2 (Com Dados Reais):
**Tabela Alunos:**

| id | nome  |
|----|-------|
| 1  | Ana   |
| 2  | Pedro |

**Tabela Disciplinas:**

| cod | disciplina |
|-----|------------|
| D1  | Matemática |
| D2  | História   |

**Consulta:**  

$$
Alunos \times Disciplinas
$$

**Resultado:**

| id | nome  | cod | disciplina |
|----|-------|-----|------------|
| 1  | Ana   | D1  | Matemática |
| 1  | Ana   | D2  | História   |
| 2  | Pedro | D1  | Matemática |
| 2  | Pedro | D2  | História   |

**SQL:**
```sql
SELECT * FROM Alunos, Disciplinas;
```

### Exemplo 3 (Cuidado com Tamanho):
Se você tem:
- Uma tabela com 1.000 clientes
- Uma tabela com 10.000 produtos

O produto cartesiano terá:

$$
1000 \times 10000 = 10.000.000 \text{ linhas!}
$$

---

## **Exercício Prático: Combinando Operadores**

**Dados:**
- **Livros:**  

  | id | titulo           | preco |
  |----|------------------|-------|
  | 1  | Dom Casmurro     | 50    |
  | 2  | Capitães de Areia| 45    |
  | 3  | Iracema          | 30    |

- **Autores:**  

  | id | nome          |
  |----|---------------|
  | A1 | Machado de Assis |
  | A2 | Jorge Amado   |

**Consulta:**  
Queremos listar todos os livros com preço > 35 combinados com todos os autores:

Passo a passo:
1. Filtrar livros:  

$$
\sigma_{preco > 35}(Livros)
$$

2. Combinar com autores:  

$$
\sigma_{preco > 35}(Livros) \times Autores
$$

**Resultado:**

| id | titulo           | preco | id_autor | nome          |
|----|------------------|-------|----------|---------------|
| 1  | Dom Casmurro     | 50    | A1       | Machado de Assis |
| 1  | Dom Casmurro     | 50    | A2       | Jorge Amado   |
| 2  | Capitães de Areia| 45    | A1       | Machado de Assis |
| 2  | Capitães de Areia| 45    | A2       | Jorge Amado   |

**SQL:**
```sql
SELECT L.*, A.* 
FROM (SELECT * FROM Livros WHERE preco > 35) L
CROSS JOIN Autores A;
```


---

## Operadores de Conjunto

## 1. União (∪) - Combinação de Resultados

### Conceito:
Combina os resultados de duas relações, mantendo apenas uma ocorrência de cada tupla duplicada.

### Sintaxe Formal:

$$
R \cup S
$$

### Requisitos:
- As duas relações devem ter o mesmo número de colunas (union-compatíveis)
- As colunas correspondentes devem ser do mesmo tipo

### Exemplo Prático:

**Tabela Funcionários:**

| id | nome   | cargo      |
|----|--------|------------|
| 1  | Ana    | Analista   |
| 2  | Carlos | Gerente    |

**Tabela Gerentes:**

| id | nome   | cargo      |
|----|--------|------------|
| 2  | Carlos | Gerente    |
| 3  | João   | Gerente    |

**Consulta:**

$$
Funcionarios \cup Gerentes
$$

**Resultado:**

| id | nome   | cargo      |
|----|--------|------------|
| 1  | Ana    | Analista   |
| 2  | Carlos | Gerente    |
| 3  | João   | Gerente    |

**SQL Correspondente:**

```sql
SELECT * FROM Funcionarios
UNION
SELECT * FROM Gerentes;
```

### Caso de Uso Real:
Listar todos os participantes de um evento (palestrantes e ouvintes):

$$
\pi_{nome}(Palestrantes) \cup \pi_{nome}(Ouvintes)
$$




## 2. Diferença (-) - Exclusão de Elementos

### Conceito:
Retorna as tuplas presentes na primeira relação que não estão na segunda.

### Sintaxe Formal:

$$
R - S
$$

### Exemplo Prático:

**Consulta:**

$$
Funcionarios - Gerentes
$$

**Resultado:**

| id | nome | cargo      |
|----|------|------------|
| 1  | Ana  | Analista   |

**SQL Correspondente:**
```sql
SELECT * FROM Funcionarios
EXCEPT
SELECT * FROM Gerentes;
-- Ou alternativamente:
SELECT * FROM Funcionarios F
WHERE NOT EXISTS (SELECT 1 FROM Gerentes G WHERE G.id = F.id);
```

### Caso de Uso Real:
Identificar produtos nunca vendidos:

$$
\pi_{id}(Produtos) - \pi_{produto\_id}(Vendas)
$$

## 3. Interseção (∩) - Elementos Comuns

### Conceito:
Retorna apenas as tuplas que estão presentes em ambas as relações.

### Sintaxe Formal:

$$
R \cap S
$$

### Exemplo Prático:

**Consulta:**

$$
Funcionarios \cap Gerentes
$$

**Resultado:**

| id | nome   | cargo   |
|----|--------|---------|
| 2  | Carlos | Gerente |

**SQL Correspondente:**
```sql
SELECT * FROM Funcionarios
INTERSECT
SELECT * FROM Gerentes;
-- Ou alternativamente:
SELECT F.* FROM Funcionarios F
INNER JOIN Gerentes G ON F.id = G.id;
```

### Expressão Alternativa:
A interseção pode ser expressa usando diferença:

$$
R \cap S = R - (R - S)
$$

### Caso de Uso Real:
Encontrar alunos que cursam ambas as disciplinas:

$$
\pi_{aluno\_id}(Matriculas\_Matematica) \cap \pi_{aluno\_id}(Matriculas\_Fisica)
$$

## Comparação Entre os Operadores

| Operador | Símbolo | Resultado                     | SQL Equivalente |
|----------|---------|-------------------------------|-----------------|
| União    | ∪       | Tuplas em R ou S              | UNION           |
| Diferença| -       | Tuplas em R não em S          | EXCEPT/MINUS    |
| Interseção| ∩      | Tuplas em R e S simultaneamente | INTERSECT       |

## Exemplo Integrado

**Cenário:** Sistema universitário

**Tabelas:**
- **Alunos_Matematica:** (id, nome)
- **Alunos_Fisica:** (id, nome)

**Consultas:**

1. Todos os alunos de exatas:
   $$
   Alunos\_Matematica \cup Alunos\_Fisica
   $$

2. Alunos que só fazem Matemática:
   $$
   Alunos\_Matematica - Alunos\_Fisica
   $$

3. Alunos que cursam ambas:
   $$
   Alunos\_Matematica \cap Alunos\_Fisica
   $$

## Importante!

1. **Compatibilidade de Esquema:** Todas essas operações exigem que as relações tenham:
   - Mesmo número de colunas
   - Tipos de dados correspondentes compatíveis

2. **Eliminação de Duplicatas:** Assim como em SQL, esses operadores eliminam tuplas idênticas automaticamente.

3. **Ordem Importa:** 
   - $R \cup S = S \cup R$ (comutativa)
   - $R - S \neq S - R$ (não comutativa)



## Exercício Prático

Dadas as tabelas:
- **Clientes_Premium:** (id, nome, data_cadastro)
- **Clientes_Ativos:** (id, nome, ultima_compra)

Escreva as expressões para:
1. Clientes que são premium mas não estão ativos
2. Clientes que são premium e ativos simultaneamente
3. Todos os clientes especiais (premium ou ativos)

**Respostas:**
1. $Clientes\_Premium - Clientes\_Ativos$
2. $Clientes\_Premium \cap Clientes\_Ativos$
3. $Clientes\_Premium \cup Clientes\_Ativos$




---

## Operadores de Junção


## 1. Junção Theta (⋈θ) - Junção com Condição Arbitrária

### Conceito:
Combina tuplas de duas relações onde uma condição especificada (θ) é verdadeira. A condição pode ser qualquer comparação entre atributos.

### Sintaxe Formal:

$$
R \bowtie_{\theta} S
$$

### Características:
- θ pode ser qualquer operador de comparação: =, ≠, >, <, ≥, ≤
- Mais genérico que a junção natural
- Pode incluir múltiplas condições com AND/OR

### Exemplo Prático 1:

**Tabela Cliente:**

| id | nome   | saldo |
|----|--------|-------|
| 1  | Ana    | 1000  |
| 2  | Carlos | 2500  |

**Tabela Cartao:**

| id | cliente_id | limite |
|----|------------|--------|
| C1 | 1          | 1500   |
| C2 | 2          | 2000   |

**Consulta:**
Encontrar clientes com saldo maior ou igual ao limite do cartão

$$
Cliente \bowtie_{saldo \geq limite} Cartao
$$

**Resultado:**

| id | nome   | saldo | id_cartao | cliente_id | limite |
|----|--------|-------|-----------|------------|--------|
| 2  | Carlos | 2500  | C2        | 2          | 2000   |

**SQL Correspondente:**
```sql
SELECT * FROM Cliente 
JOIN Cartao ON Cliente.id = Cartao.cliente_id 
WHERE Cliente.saldo >= Cartao.limite;
```

### Exemplo Prático 2:

**Tabela Funcionario:**

| id | nome   | salario | depto_id |
|----|--------|---------|----------|
| 1  | Ana    | 3000    | 10       |
| 2  | Carlos | 4500    | 20       |

**Tabela Departamento:**

| id | nome_depto | orcamento |
|----|------------|-----------|
| 10 | Vendas     | 50000     |
| 20 | TI         | 80000     |

**Consulta:**
Funcionários com salário maior que 10% do orçamento do departamento
$$
Funcionario \bowtie_{salario > 0.1*orcamento} Departamento
$$

**SQL Correspondente:**
```sql
SELECT * FROM Funcionario F
JOIN Departamento D ON F.depto_id = D.id
WHERE F.salario > 0.1 * D.orcamento;
```

## 2. Junção Natural (⋈) - Junção Automática por Atributos Comuns

### Conceito:
Combina automaticamente tuplas de duas relações com base em atributos com o mesmo nome, eliminando uma das colunas duplicadas.

### Sintaxe Formal:

$$
R \bowtie S
$$

### Características:
- Não precisa especificar a condição de junção
- Atributos com mesmo nome são usados para a junção
- Remove duplicatas dos atributos de junção

### Exemplo Prático 1:

**Tabela Aluno:**

| matricula | nome   | curso_id |
|-----------|--------|----------|
| 1001      | Ana    | 5        |
| 1002      | Carlos | 3        |

**Tabela Curso:**

| curso_id | nome_curso  | duracao |
|----------|-------------|---------|
| 3        | Engenharia  | 5       |
| 5        | Medicina    | 6       |

**Consulta:**

$$
Aluno \bowtie Curso
$$

**Resultado:**

| matricula | nome   | curso_id | nome_curso | duracao |
|-----------|--------|----------|------------|---------|
| 1001      | Ana    | 5        | Medicina   | 6       |
| 1002      | Carlos | 3        | Engenharia | 5       |

**SQL Correspondente:**
```sql
SELECT A.matricula, A.nome, C.* 
FROM Aluno A NATURAL JOIN Curso C;
-- Ou explicitamente:
SELECT A.matricula, A.nome, C.curso_id, C.nome_curso, C.duracao
FROM Aluno A JOIN Curso C ON A.curso_id = C.curso_id;
```

### Exemplo Prático 2:

**Tabela Projeto:**

| id | nome_projeto | departamento |
|----|--------------|--------------|
| P1 | Sistema X    | TI           |
| P2 | Marketing    | Vendas       |

**Tabela Funcionario:**

| id | nome   | departamento | cargo     |
|----|--------|--------------|-----------|
| 1  | Ana    | TI           | Analista  |
| 2  | Carlos | Vendas       | Gerente   |

**Consulta:**

$$
Projeto \bowtie Funcionario
$$

**Resultado:**

| id_projeto | nome_projeto | departamento | id_func | nome   | cargo    |
|------------|--------------|--------------|---------|--------|----------|
| P1         | Sistema X    | TI           | 1       | Ana    | Analista |
| P2         | Marketing    | Vendas       | 2       | Carlos | Gerente  |

**Observação:** A junção foi feita automaticamente pela coluna "departamento" comum a ambas as tabelas.

## Comparação Entre Junções

| Característica       | Junção Theta               | Junção Natural            |
|----------------------|----------------------------|---------------------------|
| Condição de junção   | Especificada explicitamente (θ) | Automática (atributos com mesmo nome) |
| Atributos resultantes| Mantém todas as colunas    | Elimina duplicatas de colunas de junção |
| Flexibilidade        | Qualquer condição          | Apenas igualdade em nomes  |
| SQL equivalente      | JOIN com ON/WHERE          | NATURAL JOIN ou JOIN com colunas iguais |

## Casos Especiais

### Auto-junção:

$$
Funcionario \bowtie_{gerente\_id = id} Funcionario
$$

**SQL:**
```sql
SELECT F.*, G.nome AS nome_gerente
FROM Funcionario F JOIN Funcionario G ON F.gerente_id = G.id;
```

### Junção com Múltiplas Condições:

$$
Pedido \bowtie_{cliente\_id = id \land data\_pedido > data\_cadastro} Cliente
$$

## Exercício Prático

Dadas as tabelas:
- **Produto:** (id, nome, preco, categoria_id)
- **Categoria:** (id, nome_categoria, desconto_maximo)

1. Escreva a junção natural entre el# Junções em Álgebra Relacional: Theta e Natural

Vamos explorar detalhadamente os dois tipos de junção na álgebra relacional, com exemplos práticos e comparações com SQL.
as
2. Escreva uma junção theta para produtos com preço menor que o desconto máximo da categoria

**Respostas:**
1. $$Produto \bowtie Categoria$$
2. $$Produto \bowtie_{preco < desconto\_maximo \land Produto.categoria\_id = Categoria.id} Categoria$$

**SQL equivalente para 2:**
```sql
SELECT * FROM Produto P
JOIN Categoria C ON P.categoria_id = C.id
WHERE P.preco < C.desconto_maximo;
```





---

## Operadores Auxiliares


## 1. Renomeação (ρ) - Mudança de Nomes

### Conceito Fundamental:
A operação de renomeação permite alterar:
- O nome de uma relação (tabela)
- Os nomes dos atributos (colunas)
- Ambos simultaneamente

### Sintaxe Formal:
1. Renomear relação:
   $$
   \rho_{nova\_relacao}(R)
   $$

2. Renomear atributos:
   $$
   \rho_{a1 \to b1, a2 \to b2, ...}(R)
   $$

3. Renomear ambos:
   $$
   \rho_{nova\_relacao(a1 \to b1, a2 \to b2, ...)}(R)
   $$

### Casos de Uso Típicos:
1. Resolver conflitos de nomes em operações de junção
2. Criar relações temporárias com nomes significativos
3. Preparar dados para operações subsequentes

### Exemplo Prático 1 (Renomeação Simples):

**Tabela Original:**
```
Funcionario(id, nome, salario)
```

**Consulta:**

$$
\rho_{Empregado}(Funcionario)
$$

**Resultado:** A mesma tabela, mas agora chamada "Empregado"

**SQL Correspondente:**
```sql
CREATE VIEW Empregado AS SELECT * FROM Funcionario;
-- ou em consultas:
SELECT * FROM Funcionario AS Empregado
```

### Exemplo Prático 2 (Renomeação de Atributos):

**Consulta:**
$$
\rho_{id \to codigo, nome \to nome\_completo}(Funcionario)
$$

**Resultado:**

| codigo | nome_completo | salario |
|--------|---------------|---------|
| ...    | ...           | ...     |

### Exemplo Prático 3 (Junção com Conflito de Nomes):

**Tabelas:**
```
Departamento(id, nome, gerente_id)
Funcionario(id, nome, salario)
```

**Problema:** Ambas têm colunas "id" e "nome"

**Solução:**

$$
\rho_{Depto(id\_depto, nome\_depto, gerente\_id)}(Departamento) \bowtie_{gerente\_id = id} Funcionario
$$

**SQL Correspondente:**
```sql
SELECT *
FROM (SELECT id AS id_depto, nome AS nome_depto, gerente_id FROM Departamento) AS Depto
JOIN Funcionario ON Depto.gerente_id = Funcionario.id;
```

## 2. Divisão (÷) - O Operador "Para Todos"

### Conceito Fundamental:
Encontra tuplas em uma relação R que se relacionam com **todas** as tuplas em uma relação S.

### Sintaxe Formal:

$$
R(A, B) \div S(B)
$$

Onde:
- R é uma relação com atributos A e B
- S é uma relação com atributo B (subconjunto de R)
- Resultado: valores de A que estão associados a **todos** valores de B em S

### Exemplo Clássico:

**Tabela Cliente_Produto (R):**

| cliente_id | produto_id |
|------------|------------|
| 1          | 101        |
| 1          | 102        |
| 1          | 103        |
| 2          | 101        |
| 2          | 102        |
| 3          | 101        |

**Tabela Produtos_Especificos (S):**

| produto_id |
|------------|
| 101        |
| 102        |

**Consulta:**

$$
Cliente\_Produto(cliente\_id, produto\_id) \div Produtos\_Especificos(produto\_id)
$$

**Resultado:**

| cliente_id |
|------------|
| 1          |
| 2          |

**Interpretação:** Clientes 1 e 2 compraram ambos os produtos 101 e 102.

### Implementação Alternativa:
A divisão pode ser expressa usando outros operadores:

$$
R \div S = \pi_A(R) - \pi_A((\pi_A(R) \times S) - R)
$$

### Exemplo Prático 2 (Cursos Completo por Alunos):

**Tabela Matricula (R):**

| aluno_id | curso_id |
|----------|----------|
| 1001     | MAT101   |
| 1001     | FIS201   |
| 1002     | MAT101   |
| 1003     | MAT101   |
| 1003     | FIS201   |
| 1003     | QUIM301  |

**Tabela Curriculo_Base (S):**

| curso_id |
|----------|
| MAT101   |
| FIS201   |

**Consulta:**
$$
Matricula \div Curriculo\_Base
$$

**Resultado:**

| aluno_id |
|----------|
| 1001     |
| 1003     |

**SQL Correspondente (versão 1):**
```sql
SELECT DISTINCT aluno_id
FROM Matricula M1
WHERE NOT EXISTS (
    SELECT curso_id FROM Curriculo_Base
    EXCEPT
    SELECT curso_id FROM Matricula M2
    WHERE M2.aluno_id = M1.aluno_id
);
```

**SQL Correspondente (versão 2):**
```sql
SELECT aluno_id
FROM Matricula
WHERE curso_id IN (SELECT curso_id FROM Curriculo_Base)
GROUP BY aluno_id
HAVING COUNT(DISTINCT curso_id) = (SELECT COUNT(*) FROM Curriculo_Base);
```

### Casos de Uso Comuns:
1. Clientes que compraram todos os produtos de uma lista
2. Alunos que cursaram todas as disciplinas obrigatórias
3. Funcionários que trabalharam em todos os projetos de um departamento
4. Fornecedores que fornecem todos os itens de um pedido

## Exercício Prático

Dadas as tabelas:
- **Fornecedor_Item:** (fornecedor_id, item_id)
- **Itens_Necessarios:** (item_id)

Escreva:
1. A expressão de divisão para encontrar fornecedores que oferecem todos os itens necessários
2. A expressão SQL equivalente

**Respostas:**
1. $$Fornecedor\_Item \div Itens\_Necessarios$$
2. ```sql
   SELECT DISTINCT fornecedor_id
   FROM Fornecedor_Item FI
   WHERE NOT EXISTS (
       SELECT item_id FROM Itens_Necessarios
       EXCEPT
       SELECT item_id FROM Fornecedor_Item FI2
       WHERE FI2.fornecedor_id = FI.fornecedor_id
   );
   ```





---

## Tabela de Operadores Fundamentais

| Operador       | Símbolo   | Tipo Entrada | Descrição                     | Exemplo                     | Equivalente SQL               |
|----------------|-----------|--------------|-------------------------------|-----------------------------|-------------------------------|
| **Seleção**    | $\sigma$  | Unário       | Filtra linhas por condição    | $\sigma_{sal>5000}(Func)$   | `SELECT * FROM Func WHERE sal > 5000` |
| **Projeção**   | $\pi$     | Unário       | Seleciona colunas             | $\pi_{nome,depto}(Func)$    | `SELECT nome, depto FROM Func` |
| **Produto Cartesiano** | $\times$ | Binário | Combina todas as linhas       | $A \times B$                | `SELECT * FROM A CROSS JOIN B` |
| **União**      | $\cup$    | Binário      | Combina resultados            | $A \cup B$                  | `SELECT * FROM A UNION SELECT * FROM B` |
| **Diferença**  | $-$       | Binário      | Elementos em A não em B       | $A - B$                     | `SELECT * FROM A EXCEPT SELECT * FROM B` |
| **Interseção** | $\cap$    | Binário      | Elementos comuns              | $A \cap B$                  | `SELECT * FROM A INTERSECT SELECT * FROM B` |

## Tabela de Operadores Avançados

| Operador       | Símbolo   | Tipo Entrada | Descrição                     | Exemplo                     | Equivalente SQL               |
|----------------|-----------|--------------|-------------------------------|-----------------------------|-------------------------------|
| **Junção Theta** | $\bowtie_\theta$ | Binário | Junção com condição arbitrária | $A \bowtie_{A.x>B.y} B$    | `SELECT * FROM A JOIN B ON A.x > B.y` |
| **Junção Natural** | $\bowtie$ | Binário | Junção por atributos iguais    | $Cliente \bowtie Pedido$    | `SELECT * FROM Cliente NATURAL JOIN Pedido` |
| **Renomeação** | $\rho$    | Unário       | Altera nomes                  | $\rho_{Novo}(Original)$     | `SELECT * FROM Original AS Novo` |
| **Divisão**    | $\div$    | Binário      | "Para todos"                  | $Vendas \div Produtos$      | Ver implementação complexa abaixo |


---

## Exemplo Integrado

Vamos analisar detalhadamente a consulta proposta, que combina seleção, junção e projeção para resolver um problema real de negócios.

## Dados de Entrada

### Tabela Funcionario

| id | nome     | salario | depto_id |
|----|----------|---------|----------|
| 1  | Ana      | 6000    | 10       |
| 2  | Carlos   | 4500    | 20       |
| 3  | João     | 7500    | 10       |
| 4  | Maria    | 5200    | 30       |

### Tabela Departamento

| id | nome_depto  | orcamento |
|----|-------------|-----------|
| 10 | TI          | 1500000   |
| 20 | Vendas      | 800000    |
| 30 | Marketing   | 1200000   |

## Consulta em Álgebra Relacional

$$
\pi_{nome}\left( \sigma_{salario>5000}(Funcionario) \bowtie \sigma_{orcamento>10^6}(Departamento) \right)
$$

## Processamento Passo a Passo

### Passo 1: Seleção de Funcionários (σ)

$$
\sigma_{salario>5000}(Funcionario)
$$

**Resultado Intermediário:**

| id | nome     | salario | depto_id |
|----|----------|---------|----------|
| 1  | Ana      | 6000    | 10       |
| 3  | João     | 7500    | 10       |
| 4  | Maria    | 5200    | 30       |

*Explicação:* Foram filtrados apenas os funcionários com salário acima de 5000.

### Passo 2: Seleção de Departamentos (σ)

$$
\sigma_{orcamento>10^6}(Departamento)
$$

**Resultado Intermediário:**

| id | nome_depto  | orcamento |
|----|-------------|-----------|
| 10 | TI          | 1500000   |
| 30 | Marketing   | 1200000   |

*Explicação:* Foram selecionados apenas departamentos com orçamento superior a 1 milhão.

### Passo 3: Junção Natural (⋈)

$$
\text{Resultado Passo 1} \bowtie \text{Resultado Passo 2}
$$

**Mecanismo de Junção:**
- A junção natural ocorre pela coluna comum `depto_id` (Funcionario) e `id` (Departamento)
- Combina linhas onde estes valores são iguais

**Resultado Intermediário:**

| id | nome     | salario | depto_id | nome_depto | orcamento |
|----|----------|---------|----------|------------|-----------|
| 1  | Ana      | 6000    | 10       | TI         | 1500000   |
| 3  | João     | 7500    | 10       | TI         | 1500000   |
| 4  | Maria    | 5200    | 30       | Marketing  | 1200000   |

*Observação:* O funcionário Carlos não aparece porque:
1. Seu salário é 4500 (não passou no primeiro filtro)
2. Seu departamento (Vendas) tem orçamento 800.000 (não passou no segundo filtro)

### Passo 4: Projeção Final (π)

$$
\pi_{nome}(\text{Resultado da Junção})
$$

**Resultado Final:**

| nome     |
|----------|
| Ana      |
| João     |
| Maria    |

## Equivalente SQL

```sql
SELECT F.nome
FROM Funcionario F
JOIN Departamento D ON F.depto_id = D.id
WHERE F.salario > 5000
AND D.orcamento > 1000000;
```

## Análise de Desempenho

1. **Ordem de Operações:**
   - Primeiro filtramos as tabelas individuais (reduzindo tamanho)
   - Depois realizamos a junção (operações em conjuntos menores)
   - Finalmente projetamos apenas o necessário

2. **Otimização:**
   - Índices em `salario` e `orcamento` acelerariam as seleções
   - Índice em `depto_id`/`id` aceleraria a junção

## Variações da Consulta

### Versão com Renomeação

$$
\pi_{nome\_func}\left( \rho_{Func(id,nome\_func,sal,dept)}(\sigma_{sal>5000}(Funcionario)) \bowtie \sigma_{orc>10^6}(Departamento) \right)
1$$

### Versão com Produto Cartesiano (menos eficiente)

$$
\pi_{nome}\left( \sigma_{salario>5000 \land orcamento>10^6 \land depto\_id=id}(Funcionario \times Departamento) \right)
$$

## Aplicação Prática

Esta consulta poderia ser usada para:
- Identificar talentos-chave em departamentos estratégicos
- Planejar aumentos salariais
- Analisar a distribuição de salários altos por departamento

---

## Exercício Proposto

Modifique a consulta para incluir:
1. O nome do departamento no resultado
2. Apenas funcionários com salário entre 5000 e 10000
3. Departamentos com orçamento entre 1M e 2M

**Solução em Álgebra Relacional:**

$$
\pi_{nome, nome\_depto}\left( \sigma_{salario>5000 \land salario<10000}(Funcionario) \bowtie \sigma_{orcamento>10^6 \land orcamento<2\cdot10^6}(Departamento) \right)
$$

**SQL Correspondente:**
```sql
SELECT F.nome, D.nome_depto
FROM Funcionario F
JOIN Departamento D ON F.depto_id = D.id
WHERE F.salario BETWEEN 5000 AND 10000
AND D.orcamento BETWEEN 1000000 AND 2000000;
```


---


## Referências

- https://pt.wikipedia.org/wiki/%C3%81lgebra_relacional
- https://sites.icmc.usp.br/caetano/scc243/Algebra-Recordacao-Ler.pdf
- https://computaria.gitlab.io/blog/2024/04/30/algebra-relacional-101
- https://pt.wikipedia.org/wiki/Jun%C3%A7%C3%A3o_theta_(%C3%A1lgebra_relacional)
- https://www.dcc.ufmg.br/~mirella/DCC011/aula12-algebra-expandido
- https://pt.wikipedia.org/wiki/Renomear_(%C3%A1lgebra_relacional)
- https://coens.dv.utfpr.edu.br/will/wp-content/uploads/2022/03/Apostila_Algebra_Relacional.pdf
- https://wp.ufpel.edu.br/fernandosimoes/files/2012/06/Simbolos-matematicos.pdf
- https://www.facom.ufu.br/~ilmerio/GBC043/notasdeaula/bccSbd7a_AlgebraRelacional.pdf
- https://tamburetei.opendevufcg.org/bd/resumos/algebra-relacional/
- https://pt.wikipedia.org/wiki/Sele%C3%A7%C3%A3o_(%C3%A1lgebra_relacional)
- https://www.guru99.com/pt/joins-sql-left-right.html
- https://sae.unb.br/cae/conteudo/unbfga/sbd/new_bancoalgebrarelacional.html
- https://www.devmedia.com.br/algebra-relacional/9229
- https://spaceprogrammer.com/bd/aprendendo-as-principais-operacoes-da-algebra-relacional/
- https://www.estrategiaconcursos.com.br/blog/banco-dados-descomplicado-algebra-relacional/
