# Problemas Práticos com o Banco não Normalizado

## 1. Atualização de Informações de Clientes
**Cenário**: O cliente João Silva muda seu telefone

**Problema**:
```sql
-- Necessário atualizar MULTIPLOS registros
UPDATE pedidos SET cliente_telefone = '(11) 98888-7777' 
WHERE cliente_id = 101;

-- Risco de inconsitência se alguma linha não for atualizada
```

**Consequência**: Dados desatualizados em pedidos antigos, dificuldade para manter integridade

## 2. Mudança de Preço de Produtos
**Cenário**: O preço do "Smartphone XYZ" aumenta para R$ 2.799,90

**Problema**:
```sql
-- Preço antigo permanece nos pedidos existentes
-- Não temos histórico de alterações
-- Consultas para cálculo de faturamento ficam imprecisas
```

**Consequência**: Dificuldade para análises financeiras precisas, impossibilidade de calcular inflação/reajustes

## 3. Pedidos com Muitos Itens
**Cenário**: Um cliente compra 5 produtos diferentes

**Problema**:
```sql
-- Necessário criar múltiplos registros "fake"
INSERT INTO pedidos (
    pedido_id, data_pedido, cliente_id, /*...*/, 
    produto_id_1, produto_nome_1, /*...*/, 
    produto_id_2, produto_nome_2, /*... NULL ...*/
) VALUES (...);

-- Ou deixar itens de fora do pedido
```

**Consequência**: Sistema não reflete a realidade dos negócios, relatórios imprecisos

## 4. Relatórios e Business Intelligence
**Cenário**: Gerar relatório de produtos mais vendidos

**Problema**:
```sql
-- Consulta extremamente complexa
SELECT 
    COALESCE(produto_id_1, produto_id_2) as produto_id,
    COALESCE(produto_nome_1, produto_nome_2) as nome,
    SUM(COALESCE(produto_quantidade_1, 0) + COALESCE(produto_quantidade_2, 0)) as total
FROM pedidos
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Impossível filtrar por categoria de forma eficiente
```

**Consequência**: Queries lentas, complexas e propensas a erros

## 5. Gestão de Estoque
**Cenário**: Atualizar estoque após uma venda

**Problema**:
```sql
-- Não há ligação direta com tabela de produtos
-- Dificuldade para automatizar baixa no estoque
-- Risco de overselling (vender produto sem estoque)
```

**Consequência**: Erros operacionais, clientes recebendo produtos esgotados

## 6. Análise de Desempenho
**Cenário**: Sistema começa a ficar lento com crescimento

**Problema**:
```sql
-- Tabela pedidos terá muitas colunas NULL
-- Índices menos eficientes em estrutura não normalizada
-- Espaço em disco desperdiçado
```

**Consequência**: Degradação de desempenho conforme volume aumenta
