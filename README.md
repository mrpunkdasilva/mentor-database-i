# Mentor-U Database I

Este projeto demonstra conceitos fundamentais de banco de dados, com foco em normalização e boas práticas de modelagem de dados usando PostgreSQL.

## Estrutura do Projeto

- **docker-compose.yml**: Configuração para iniciar um container PostgreSQL para desenvolvimento e testes
- **normalization/**: Exemplos práticos de normalização de banco de dados
  - **ddl_nao_normalizado.sql**: Esquema de banco de dados não normalizado com problemas comuns
  - **ddl_normalizado.sql**: Versão normalizada do mesmo esquema, seguindo as formas normais
  - **README.md**: Explicação detalhada dos problemas causados pela falta de normalização

## Requisitos

- Docker e Docker Compose
- PostgreSQL Client (opcional, para conexão direta)

## Como Executar

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/mentor-u-database-i.git
cd mentor-u-database-i
```

2. Inicie o container PostgreSQL:
```bash
docker-compose up -d
```

3. Conecte-se ao banco de dados:
```bash
# Usando psql (se instalado)
psql -h localhost -U postgres -d mentor_u_db

# Ou usando docker
docker exec -it mentor-u-postgres psql -U postgres -d mentor_u_db
```

4. Execute os scripts SQL:
```bash
# Para o esquema não normalizado
psql -h localhost -U postgres -d postgres -f normalization/ddl_nao_normalizado.sql

# Para o esquema normalizado
psql -h localhost -U postgres -d postgres -f normalization/ddl_normalizado.sql
```

## Conceitos Abordados

- Formas Normais (1FN, 2FN, 3FN)
- Problemas de redundância de dados
- Anomalias de inserção, atualização e exclusão
- Modelagem de relacionamentos entre entidades
- Integridade referencial

## Configuração do Banco de Dados

O PostgreSQL está configurado com as seguintes credenciais:
- **Usuário**: postgres
- **Senha**: postgres
- **Banco de Dados**: mentor_u_db
- **Porta**: 5432

## Contribuição

Sinta-se à vontade para contribuir com este projeto através de pull requests ou reportando issues.

## Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.