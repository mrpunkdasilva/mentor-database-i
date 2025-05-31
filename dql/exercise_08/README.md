 # Exercício 08 - Clínica Odontológica

 ## Descrição do Cenário

 Este exercício apresenta um sistema de banco de dados para uma clínica odontológica. O objetivo é demonstrar como realizar consultas com múltiplos JOINs para combinar informações de diferentes tabelas, mostrando o relacionamento entre pacientes, dentistas e consultas agendadas.

 ### Contexto do Negócio

 A clínica odontológica precisa manter um registro organizado de todas as consultas realizadas, conectando as informações dos pacientes com seus respectivos dentistas e as datas dos atendimentos. Este tipo de consulta é fundamental para relatórios administrativos, controle de agenda e histórico de atendimentos.

 ### Estrutura dos Dados

 O sistema é composto por três entidades principais com os seguintes relacionamentos:

 ```mermaid
 erDiagram
     PACIENTE {
         int Paciente_ID PK
         string Nome
         string Sobrenome
     }
    
     DENTISTA {
         int Dentista_ID PK
         string Nome
         string Sobrenome
     }
    
     CONSULTA {
         int Consulta_ID PK
         int Paciente_ID FK
         int Dentista_ID FK
         date Data
     }
    
     PACIENTE ||--o{ CONSULTA : "agenda"
     DENTISTA ||--o{ CONSULTA : "atende"
 ```

 ## Implementação em PostgreSQL

 ### Definição da Estrutura (DDL)

 O código abaixo cria o esquema e as tabelas necessárias para o sistema:

 ```sql
 -- Criação do esquema para organizar as tabelas
 CREATE SCHEMA Clinica_Odontologica;
 SET search_path TO Clinica_Odontologica;

 -- Tabela para armazenar dados dos pacientes
 CREATE TABLE Paciente (
     Paciente_ID SERIAL PRIMARY KEY,
     Nome VARCHAR(100) NOT NULL,
     Sobrenome VARCHAR(100) NOT NULL
 );

 -- Tabela para armazenar dados dos dentistas
 CREATE TABLE Dentista (
     Dentista_ID SERIAL PRIMARY KEY,
     Nome VARCHAR(100) NOT NULL,
     Sobrenome VARCHAR(100) NOT NULL
 );

 -- Tabela para armazenar dados das consultas
 CREATE TABLE Consulta (
     Consulta_ID SERIAL PRIMARY KEY,
     Paciente_ID INT REFERENCES Paciente(Paciente_ID),
     Dentista_ID INT REFERENCES Dentista(Dentista_ID),
     Data DATE NOT NULL
 );
 ```

 ### Inserção de Dados de Exemplo

 Para demonstrar o funcionamento do sistema, inserimos alguns registros de exemplo:

 ```sql
 -- Inserção de pacientes
 INSERT INTO Paciente (Nome, Sobrenome) VALUES
 ('João', 'Silva'),
 ('Maria', 'Oliveira');

 -- Inserção de dentistas
 INSERT INTO Dentista (Nome, Sobrenome) VALUES
 ('Ana', 'Costa'),
 ('Carlos', 'Pereira');

 -- Inserção de consultas
 INSERT INTO Consulta (Paciente_ID, Dentista_ID, Data) VALUES
 (1, 1, '2024-06-10'),  -- João Silva com Ana Costa
 (2, 2, '2024-06-15'),  -- Maria Oliveira com Carlos Pereira
 (1, 2, '2024-07-01');  -- João Silva com Carlos Pereira
 ```

 ### Consulta Principal: Lista de Pacientes e Dentistas por Consulta

 O objetivo principal deste exercício é mostrar uma lista completa de consultas com informações dos pacientes e dentistas:

 ```sql
 SELECT P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      C.Data AS Data_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 ORDER BY C.Data;
 ```

 **Resultado esperado:**
 ```
 Paciente_Nome | Paciente_Sobrenome | Dentista_Nome | Dentista_Sobrenome | Data_Consulta
 --------------|-------------------|---------------|-------------------|---------------
 João          | Silva             | Ana           | Costa             | 2024-06-10
 Maria         | Oliveira          | Carlos        | Pereira           | 2024-06-15
 João          | Silva             | Carlos        | Pereira           | 2024-07-01
 ```

 ## Explicação Técnica

 ### Operações Utilizadas

 1. **JOIN (INNER JOIN)**:
  - Combina registros de múltiplas tabelas baseado em relacionamentos
  - `JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID` conecta consultas com pacientes
  - `JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID` conecta consultas with dentistas

 2. **Alias de Tabelas**:
  - `C` para Consulta, `P` para Paciente, `D` para Dentista
  - Simplifica a escrita e melhora a legibilidade da consulta
  - Evita ambiguidade quando colunas têm nomes similares

 3. **Alias de Colunas (AS)**:
  - Renomeia colunas no resultado para melhor identificação
  - Diferencia entre nome do paciente e nome do dentista
  - Torna o resultado mais claro e profissional

 4. **ORDER BY**:
  - Organiza os resultados por data da consulta
  - Facilita a visualização cronológica dos atendimentos

 ### Processo de Junção

 1. A tabela Consulta serve como base (contém as chaves estrangeiras)
 2. JOIN com Paciente traz informações do paciente para cada consulta
 3. JOIN com Dentista traz informações do dentista para cada consulta
 4. Resultado final combina dados das três tabelas em uma única linha por consulta

 ### Consultas Adicionais Úteis

 #### Consultar histórico de um paciente específico:

 ```sql
 SELECT P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      C.Data AS Data_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 WHERE P.Paciente_ID = 1
 ORDER BY C.Data;
 ```

 #### Consultar agenda de um dentista específico:

 ```sql
 SELECT D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      C.Data AS Data_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 WHERE D.Dentista_ID = 1
 ORDER BY C.Data;
 ```

 #### Consultar consultas por período:

 ```sql
 SELECT P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      C.Data AS Data_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 WHERE C.Data BETWEEN '2024-06-01' AND '2024-06-30'
 ORDER BY C.Data;
 ```

 #### Estatísticas de consultas por dentista:

 ```sql
 SELECT D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      COUNT(*) AS Total_Consultas,
      MIN(C.Data) AS Primeira_Consulta,
      MAX(C.Data) AS Ultima_Consulta
 FROM Consulta C
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 GROUP BY D.Dentista_ID, D.Nome, D.Sobrenome
 ORDER BY Total_Consultas DESC;
 ```

 #### Consultar com nome completo concatenado:

 ```sql
 SELECT CONCAT(P.Nome, ' ', P.Sobrenome) AS Paciente_Completo,
      CONCAT(D.Nome, ' ', D.Sobrenome) AS Dentista_Completo,
      TO_CHAR(C.Data, 'DD/MM/YYYY') AS Data_Formatada
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 ORDER BY C.Data;
 ```

 #### Consultar pacientes que nunca tiveram consulta (LEFT JOIN):

 ```sql
 SELECT P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      CASE 
          WHEN C.Consulta_ID IS NULL THEN 'Sem consultas'
          ELSE 'Com consultas'
      END AS Status
 FROM Paciente P
 LEFT JOIN Consulta C ON P.Paciente_ID = C.Paciente_ID
 WHERE C.Consulta_ID IS NULL;
 ```

 #### Relatório mensal de consultas:

 ```sql
 SELECT EXTRACT(YEAR FROM C.Data) AS Ano,
      EXTRACT(MONTH FROM C.Data) AS Mes,
      COUNT(*) AS Total_Consultas,
      COUNT(DISTINCT C.Paciente_ID) AS Pacientes_Atendidos,
      COUNT(DISTINCT C.Dentista_ID) AS Dentistas_Ativos
 FROM Consulta C
 GROUP BY EXTRACT(YEAR FROM C.Data), EXTRACT(MONTH FROM C.Data)
 ORDER BY Ano, Mes;
 ```

 ### Variações da Consulta Principal

 #### Com informações de ID incluídas:

 ```sql
 SELECT C.Consulta_ID,
      P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      C.Data AS Data_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 ORDER BY C.Data;
 ```

 #### Com contagem de consultas por linha:

 ```sql
 SELECT P.Nome AS Paciente_Nome,
      P.Sobrenome AS Paciente_Sobrenome,
      D.Nome AS Dentista_Nome,
      D.Sobrenome AS Dentista_Sobrenome,
      C.Data AS Data_Consulta,
      ROW_NUMBER() OVER (ORDER BY C.Data) AS Numero_Consulta
 FROM Consulta C
 JOIN Paciente P ON C.Paciente_ID = P.Paciente_ID
 JOIN Dentista D ON C.Dentista_ID = D.Dentista_ID
 ORDER BY C.Data;
 ```