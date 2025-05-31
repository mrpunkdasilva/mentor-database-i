  # Exercício 01 - Clínica Veterinária

  ## Descrição do Cenário

  Este exercício apresenta um sistema de banco de dados para uma clínica veterinária. O objetivo é demonstrar como calcular a idade média dos animais registrados utilizando funções de data do PostgreSQL.

  ### Contexto do Negócio

  A clínica veterinária atende diversos tipos de animais e precisa manter um registro organizado de seus pacientes. Para cada animal, são armazenadas informações básicas como identificação, características físicas e dados do proprietário.

  ### Estrutura dos Dados

  O sistema é composto por duas entidades principais com o seguinte relacionamento:

  ```mermaid
  erDiagram
      DONO {
          int Dono_ID PK
          string Nome
          string Telefone
      }
      
      ANIMAL {
          int Animal_ID PK
          string Nome
          string Especie
          date Data_Nascimento
          int Dono_ID FK
      }
      
      DONO ||--o{ ANIMAL : "possui"
  ```

  ## Implementação em PostgreSQL

  ### Definição da Estrutura (DDL)

  O código abaixo cria o esquema e as tabelas necessárias para o sistema:

  ```sql
  -- Criação do esquema para organizar as tabelas
  CREATE SCHEMA Clinica_Veterinaria;
  SET search_path TO Clinica_Veterinaria;

  -- Tabela para armazenar dados dos proprietários
  CREATE TABLE Dono (
      Dono_ID SERIAL PRIMARY KEY,
      Nome VARCHAR(100) NOT NULL,
      Telefone VARCHAR(15)
  );

  -- Tabela para armazenar dados dos animais
  CREATE TABLE Animal (
      Animal_ID SERIAL PRIMARY KEY,
      Nome VARCHAR(100) NOT NULL,
      Especie VARCHAR(50),
      Data_Nascimento DATE,
      Dono_ID INT REFERENCES Dono(Dono_ID)
  );
  ```

  ### Inserção de Dados de Exemplo

  Para demonstrar o funcionamento do sistema, inserimos alguns registros de exemplo:

  ```sql
  -- Inserção de proprietários
  INSERT INTO Dono (Nome, Telefone) VALUES
  ('João Silva', '11999999999'),
  ('Maria Santos', '11988888888');

  -- Inserção de animais com diferentes idades
  INSERT INTO Animal (Nome, Especie, Data_Nascimento, Dono_ID) VALUES
  ('Rex', 'Cachorro', '2015-06-15', 1),
  ('Miau', 'Gato', '2018-11-05', 2),
  ('Pingo', 'Cachorro', '2020-01-20', 1),
  ('Luna', 'Coelho', '2017-09-30', 2);
  ```

  ### Consulta Principal: Cálculo da Idade Média

  O objetivo principal deste exercício é calcular a idade média dos animais registrados na clínica:

  ```sql
  SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, Data_Nascimento))) AS idade_media
  FROM Animal;
  ```

  ## Explicação Técnica

  ### Funções Utilizadas

  1. **AGE(data_final, data_inicial)**: 
   - Calcula a diferença entre duas datas
   - Retorna um intervalo que inclui anos, meses e dias
   - Exemplo: `AGE('2024-01-01', '2020-06-15')` retorna `3 years 6 months 17 days`

  2. **EXTRACT(campo FROM intervalo)**:
   - Extrai uma parte específica de um intervalo de tempo
   - No nosso caso, extraímos apenas os anos
   - Exemplo: `EXTRACT(YEAR FROM '3 years 6 months 17 days')` retorna `3`

  3. **AVG(valores)**:
   - Calcula a média aritmética de um conjunto de valores numéricos
   - Ignora valores NULL automaticamente

  ### Processo de Cálculo

  1. Para cada animal, a função `AGE()` calcula quantos anos, meses e dias se passaram desde o nascimento até hoje
  2. A função `EXTRACT()` pega apenas a parte dos anos, convertendo para um número inteiro
  3. A função `AVG()` calcula a média de todas as idades em anos

  ### Exemplo Prático

  Considerando os dados de exemplo inseridos:
  - Rex (nascido em 2015): aproximadamente 9 anos
  - Miau (nascido em 2018): aproximadamente 6 anos  
  - Pingo (nascido em 2020): aproximadamente 4 anos
  - Luna (nascido em 2017): aproximadamente 7 anos

  A idade média seria: (9 + 6 + 4 + 7) ÷ 4 = 6.5 anos
