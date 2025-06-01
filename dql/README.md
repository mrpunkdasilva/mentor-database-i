```
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⠀⠸⣿⣿⣿⣿⣿⣿⣿⡟⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣾⣿⡆⠀⢻⣿⣿⣿⣿⣿⣿⠃⠀⣼⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣷⡀⠀⢻⣿⣿⣿⡿⠃⠀⣼⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣾⣿⣿⣿⣿⣷⣄⠀⠙⠿⠋⠀⣠⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢿⣿⣿⣿⠿⠛⠛⠓⠀⠀⠀⠚⠛⠛⠿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀
⢰⣿⣿⣿⣿⣿⡇⢀⣀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠘⣿⣿⣿⣿⣿⡆⠀⣤⠀⢀⠀
⠀⢿⣿⡉⢹⣿⠇⠈⣻⣿⢶⡄⠀⢰⡶⣿⣟⠉⠀⣿⡏⢉⣿⡿⠀⣰⣿⣿⡿⠀
⠀⠘⣿⣧⠀⠀⠀⠀⠙⠋⠀⠀⠀⠀⠀⠙⠁⠀⠀⠈⠀⣸⣿⠃⠀⢿⣿⡿⠃⠀
⠀⠀⠙⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⠃⠀⠀⣾⠃⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣧⠀⠀⠀⢀⣀⣀⣀⣀⠀⠀⠀⣼⣿⣿⣿⠀⠀⣸⡟⢠⣿⣤⡶
⠀⠀⠀⣿⣿⣿⣿⣧⡀⠀⠀⠉⠉⠉⠉⠀⢀⣾⣿⣿⣿⣿⠀⢰⡿⠀⣿⣿⣿⠇
⠀⠀⠀⣿⣿⣿⣿⣿⣿⣶⣤⡀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⢠⣿⠃⠀⣿⠟⠋⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⡏⠻⠿⣿⠿⠟⢻⣿⣿⣿⣿⣿⣿⣼⡇⠀⣰⡿⠀⠀⠀
⠀⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠀⠀⠉⠁⠀⠀⠀
```

# Exercícios DQL — Cenários Variados com PostgreSQL

Este repositório contém **20 exercícios** de consultas SQL, cada um baseado em um **cenário diferente**, todos adaptados para **PostgreSQL**.

## Objetivo

Aplicar e reforçar o conhecimento em SQL com foco em:

- Modelagem de dados.
- Criação de tabelas com `DDL`.
- Inserção de dados (`INSERT`).
- Consultas (`SELECT`), incluindo:
  - `JOIN`.
  - `GROUP BY`.
  - Funções de agregação.
  - Subconsultas.
  - Filtros com `WHERE`.
- Manipulação de datas e funções específicas do PostgreSQL.

---

## Estrutura dos exercícios

Cada exercício possui:

- 📄 **Descrição** do cenário.
- 🗄️ **DDL**: criação das tabelas.
- ✍️ **Inserts**: inserção de dados fictícios.
- 🔍 **Consulta**: código SQL da questão adaptado.
- 📊 **Explicação técnica**: detalhamento das operações utilizadas.
- 🔧 **Consultas adicionais**: variações e extensões úteis.

---

## Lista de exercícios

| # | Cenário | Conceito Principal | Link |
|---|---------|-------------------|------|
| 1 | **Clínica Veterinária** — Cálculo da idade média | Funções de data (`AGE`, `EXTRACT`) | [📁 exercise_01](./exercise_01/) |
| 2 | **Biblioteca Universitária** — Histórico de empréstimos | `JOIN` básico com filtros | [📁 exercise_02](./exercise_02/) |
| 3 | **Oficina Mecânica** — Idade do veículo e próxima revisão | Cálculos com datas | [📁 exercise_03](./exercise_03/) |
| 4 | **Loja de Materiais de Construção** — Quantidade total de materiais | Funções de agregação (`SUM`) | [📁 exercise_04](./exercise_04/) |
| 5 | **Creche Infantil** — Idade mínima e máxima | Funções `MIN` e `MAX` | [📁 exercise_05](./exercise_05/) |
| 6 | **Escola de Música** — Alunos nascidos entre 2000 e 2005 | Filtros com `BETWEEN` e `EXTRACT` | [📁 exercise_06](./exercise_06/) |
| 7 | **Centro de Estética** — Profissionais especializados | Filtros com `IN` | [📁 exercise_07](./exercise_07/) |
| 8 | **Clínica Odontológica** — Lista de pacientes e médicos | `JOIN` múltiplo | [📁 exercise_08](./exercise_08/) |
| 9 | **Academia de Ginástica** — Instrutores com alunos acima de 40 anos | `JOIN` com filtros de idade | [📁 exercise_09](./exercise_09/) |
| 10 | **Pet Shop** — Pets sem consulta agendada | Filtros com `IS NULL` | [📁 exercise_10](./exercise_10/) |
| 11 | **Agência de Publicidade** — Profissional mais bem pago | `ORDER BY` com `LIMIT` | [📁 exercise_11](./exercise_11/) |
| 12 | **Universidade** — Técnicos no mesmo departamento que um professor | Subconsultas | [📁 exercise_12](./exercise_12/) |
| 13 | **Clínica Veterinária** — Pets com consulta em cardiologia | `JOIN` com filtros específicos | [📁 exercise_13](./exercise_13/) |
| 14 | **Clínica de Fisioterapia** — Fisioterapeutas com pacientes do plano FisioPlus | `JOIN` múltiplo com filtros | [📁 exercise_14](./exercise_14/) |
| 15 | **Clínica de Nutrição** — Nutricionistas com pacientes que não usam NutriGold | Filtros de negação (`<>`) | [📁 exercise_15](./exercise_15/) |
| 16 | **Hospital Veterinário** — Auxiliares com salário acima da média | Subconsultas com `AVG` | [📁 exercise_16](./exercise_16/) |
| 17 | **Clínica de Psicologia** — Psicólogos sem consultas em janeiro | `NOT IN` com subconsultas | [📁 exercise_17](./exercise_17/) |
| 18 | **Distribuidora de Alimentos** — Fornecedores mexicanos e tipos de produtos | `STRING_AGG` e `GROUP BY` | [📁 exercise_18](./exercise_18/) |
| 19 | **Clínica de Endocrinologia** — Médico, paciente, prescrição e medicamento | `JOIN` complexo (4 tabelas) | [📁 exercise_19](./exercise_19/) |
| 20 | **Hospital Psiquiátrico** — Paciente, departamento, enfermeira e data da consulta | `JOIN` múltiplo sem agrupamento | [📁 exercise_20](./exercise_20/) |

---

## Conceitos Abordados

### Funções de Data e Tempo
- `AGE()` - Cálculo de idade
- `EXTRACT()` - Extração de componentes de data
- `CURRENT_DATE` - Data atual
- `BETWEEN` - Filtros de intervalo

### Funções de Agregação
- `SUM()` - Soma de valores
- `AVG()` - Média aritmética
- `MIN()` / `MAX()` - Valores mínimo e máximo
- `COUNT()` - Contagem de registros
- `STRING_AGG()` - Agregação de strings

### JOINs e Relacionamentos
- `INNER JOIN` - Junção interna
- `LEFT JOIN` - Junção externa esquerda
- JOINs múltiplos (3+ tabelas)
- Relacionamentos um-para-muitos

### Filtros e Condições
- `WHERE` - Filtros básicos
- `IN` / `NOT IN` - Filtros de lista
- `IS NULL` / `IS NOT NULL` - Valores nulos
- `LIKE` / `ILIKE` - Busca por padrões
- `<>` / `!=` - Operadores de negação

### Subconsultas
- Subconsultas correlacionadas
- Subconsultas com agregação
- Comparações com subconsultas

### Ordenação e Limitação
- `ORDER BY` - Ordenação de resultados
- `LIMIT` - Limitação de registros
- `DISTINCT` - Eliminação de duplicatas

### Agrupamento
- `GROUP BY` - Agrupamento de dados
- `HAVING` - Filtros pós-agrupamento

---

## Como utiliza

1. **Clone ou baixe este repositório**:
   ```bash
   git clone https://github.com/mrpunkdasilva/mentor-database-i.git
   cd mentor-database-i/dql
   ```

2. **Configure o PostgreSQL** localmente ou use um serviço online.

3. **Execute os scripts SQL** de cada exercício na ordem:
   - **Criação do schema e tabelas (DDL)**
   - **Inserção de dados (INSERT)**
   - **Consulta principal (SELECT)**

4. **Explore as consultas adicionais** em cada exercício para aprofundar o aprendizado.

5. **Analise os resultados** e experimente modificar os cenários!

---

## Aprendizados

### Progressão de Dificuldade
- **Exercícios 1-5**: Conceitos básicos (funções de data, agregação simples)
- **Exercícios 6-10**: Filtros e condições avançadas
- **Exercícios 11-15**: Subconsultas e comparações
- **Exercícios 16-20**: JOINs complexos e relatórios avançados

### Habilidades Desenvolvidas
- Modelagem adaptativa para múltiplos contextos
- Domínio de funções nativas do **PostgreSQL**
- Boas práticas em `JOINs` e filtragem de dados

---

## 📊 Cenários por Área

### **Saúde e Medicina**
- Clínica Veterinária (exercícios 1, 13)
- Clínica Odontológica (exercício 8)
- Clínica de Fisioterapia (exercício 14)
- Clínica de Nutrição (exercício 15)
- Hospital Veterinário (exercício 16)
- Clínica de Psicologia (exercício 17)
- Clínica de Endocrinologia (exercício 19)
- Hospital Psiquiátrico (exercício 20)

### **Educação**
- Biblioteca Universitária (exercício 2)
- Creche Infantil (exercício 5)
- Escola de Música (exercício 6)
- Universidade (exercício 12)

### **Negócios e Serviços**
- Oficina Mecânica (exercício 3)
- Loja de Materiais de Construção (exercício 4)
- Centro de Estética (exercício 7)
- Academia de Ginástica (exercício 9)
- Pet Shop (exercício 10)
- Agência de Publicidade (exercício 11)
- Distribuidora de Alimentos (exercício 18)

---

## Recursos Adicionais

### Scripts Úteis
Cada exercício inclui:
- **Consultas de exemplo** com diferentes variações
- **Índices recomendados** para otimização
- **Views** para simplificar consultas complexas
- **Funções** para automatizar operações comuns

### Extensões Sugeridas
- Adição de mais campos às tabelas existentes
- Criação de novos relacionamentos
- Implementação de triggers e procedures
- Desenvolvimento de relatórios avançados

---

## Observações

- Todos os exercícios foram elaborados para fins **didáticos**.
- Os dados inseridos são **fictícios** e representativos.
- As soluções são totalmente compatíveis com **PostgreSQL 12+**.
- Cada exercício pode ser executado independentemente.
- Os cenários são escaláveis e podem ser expandidos conforme necessário.

---

## Requisitos

- **PostgreSQL 12+**
- Cliente SQL de sua preferência:
  - DBeaver
  - pgAdmin
  - psql (linha de comando)
  - DataGrip
  - VS Code com extensão PostgreSQL

---

## Contribuições

Sinta-se à vontade para:
- Sugerir novos cenários
- Propor melhorias nas consultas
- Adicionar exercícios complementares
- Reportar problemas ou inconsistências

