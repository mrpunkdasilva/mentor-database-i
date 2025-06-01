```
███╗   ███╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗ 
████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗
██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝
██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗
██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                        
██████╗  █████╗ ████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗    ██╗
██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝    ██║
██║  ██║███████║   ██║   ███████║██████╔╝███████║███████╗█████╗      ██║
██║  ██║██╔══██║   ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝      ██║
██████╔╝██║  ██║   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗    ██║
╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝
```

# Mentor Database I

Este projeto demonstra conceitos fundamentais de banco de dados, com foco em normalização e boas práticas de modelagem de dados usando PostgreSQL.

## Estrutura do Projeto

- **docker-compose.yml**: Configuração para iniciar um container PostgreSQL para desenvolvimento e testes
- **normalization/**: Exemplos práticos de normalização de banco de dados
  - **ddl_nao_normalizado.sql**: Esquema de banco de dados não normalizado com problemas comuns
  - **ddl_normalizado.sql**: Versão normalizada do mesmo esquema, seguindo as formas normais
  - **README.md**: Explicação detalhada dos problemas causados pela falta de normalização
- **dql/**: Coleção de 20 exercícios práticos de consultas SQL (DQL)
  - **exercise_01/ a exercise_20/**: Exercícios individuais com cenários variados
  - **README.md**: Guia completo dos exercícios DQL

## Exercícios DQL Disponíveis

O projeto inclui **20 exercícios práticos** de consultas SQL, cada um baseado em cenários diferentes:

### Conceitos Abordados
- Funções de data e tempo (`AGE`, `EXTRACT`, `CURRENT_DATE`)
- Funções de agregação (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT`, `STRING_AGG`)
- JOINs e relacionamentos (INNER JOIN, LEFT JOIN, múltiplas tabelas)
- Filtros e condições (`WHERE`, `IN`, `NOT IN`, `IS NULL`, `LIKE`, `ILIKE`)
- Subconsultas (correlacionadas, com agregação, comparações)
- Ordenação e limitação (`ORDER BY`, `LIMIT`, `DISTINCT`)
- Agrupamento (`GROUP BY`, `HAVING`)

### Cenários por Área

**Saúde e Medicina:**
- Clínica Veterinária, Odontológica, Fisioterapia, Nutrição
- Hospital Veterinário, Psiquiátrico
- Clínica de Psicologia, Endocrinologia

**Educação:**
- Biblioteca Universitária, Creche Infantil
- Escola de Música, Universidade

**Negócios e Serviços:**
- Oficina Mecânica, Pet Shop
- Agência de Publicidade, Academia de Ginástica
- Centro de Estética, Distribuidora de Alimentos

## Requisitos

- Docker e Docker Compose
- PostgreSQL Client (opcional, para conexão direta)

## Como Executar

1. Clone o repositório:

```bash
git clone https://github.com/mrpunkdasilva/mentor-database-i.git
cd mentor-database-i
```

2. Inicie o container PostgreSQL:

```bash
docker-compose up -d
```

3. Conecte-se ao banco de dados:

```bash
# Usando psql (se instalado)
psql -h localhost -U postgres -d mentor_db

# Ou usando docker
docker exec -it mentor-u-postgres psql -U postgres -d mentor_db
```

4. Execute os scripts SQL:

```bash
# Para o esquema não normalizado
psql -h localhost -U postgres -d postgres -f normalization/ddl_nao_normalizado.sql

# Para o esquema normalizado
psql -h localhost -U postgres -d postgres -f normalization/ddl_normalizado.sql
```

5. Explore os exercícios DQL:

```bash
cd dql
# Cada pasta exercise_XX contém um cenário completo com DDL, dados e consultas
```

## Conceitos Abordados

### Normalização de Banco de Dados
- Formas Normais (1FN, 2FN, 3FN)
- Problemas de redundância de dados
- Anomalias de inserção, atualização e exclusão
- Modelagem de relacionamentos entre entidades
- Integridade referencial

### Consultas SQL (DQL)
- Progressão de dificuldade dos conceitos básicos aos avançados
- Modelagem adaptativa para múltiplos contextos
- Domínio de funções nativas do PostgreSQL
- Boas práticas em JOINs e filtragem de dados
- Otimização de consultas e performance

## Configuração do Banco de Dados

O PostgreSQL está configurado com as seguintes credenciais:
- **Usuário**: postgres
- **Senha**: postgres
- **Banco de Dados**: mentor_db
- **Porta**: 5432

## Estrutura de Aprendizado

### Iniciante
- Conceitos de normalização (pasta `normalization/`)
- Exercícios DQL 1-5: Funções básicas e agregação

### Intermediário
- Exercícios DQL 6-10: Filtros e condições avançadas
- Exercícios DQL 11-15: Subconsultas e comparações

### Avançado
- Exercícios DQL 16-20: JOINs complexos e relatórios
- Otimização de performance e índices

## Recursos Adicionais

Cada exercício DQL inclui:
- Explicação técnica detalhada
- Consultas de exemplo com variações
- Índices recomendados para otimização
- Views para simplificar consultas complexas
- Extensões sugeridas para expandir o modelo

## Contribuição

Sinta-se à vontade para contribuir com este projeto através de:
- Pull requests com novos exercícios
- Melhorias nas consultas existentes
- Correções e otimizações
- Sugestões de novos cenários
- Reportar issues

## Próximos Passos

Após completar este projeto, considere explorar:
- **Procedures e Functions** avançadas
- **Triggers** para automação
- **Particionamento** de tabelas
- **Índices** especializados
- **Window Functions** para análises complexas
- **CTEs (Common Table Expressions)** para consultas recursivas

## Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.