CREATE DATABASE mentor_u_database_i;

\c mentor_u_database_i;

-- Criação da tabela não normalizada (como muitas startups começam)
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    data_pedido TIMESTAMP NOT NULL,
    cliente_id INTEGER NOT NULL,
    cliente_nome VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100) NOT NULL,
    cliente_telefone VARCHAR(20) NOT NULL,
    cliente_endereco TEXT NOT NULL,
    produto_id_1 INTEGER,
    produto_nome_1 VARCHAR(100),
    produto_categoria_1 VARCHAR(50),
    produto_preco_1 DECIMAL(10,2),
    produto_quantidade_1 INTEGER,
    produto_id_2 INTEGER,
    produto_nome_2 VARCHAR(100),
    produto_categoria_2 VARCHAR(50),
    produto_preco_2 DECIMAL(10,2),
    produto_quantidade_2 INTEGER,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    status_pedido VARCHAR(20) NOT NULL
);

-- Inserção de dados reais (situação comum em sistemas não normalizados)
INSERT INTO pedidos (
    data_pedido, cliente_id, cliente_nome, cliente_email, cliente_telefone, cliente_endereco,
    produto_id_1, produto_nome_1, produto_categoria_1, produto_preco_1, produto_quantidade_1,
    produto_id_2, produto_nome_2, produto_categoria_2, produto_preco_2, produto_quantidade_2,
    valor_total, forma_pagamento, status_pedido
) VALUES (
    '2023-10-15 14:32:45', 101, 'João Silva', 'joao@email.com', '(11) 9999-8888', 'Rua A, 123 - São Paulo/SP',
    5001, 'Smartphone XYZ', 'Eletrônicos', 2599.90, 1,
    7003, 'Capa Protetora', 'Acessórios', 89.90, 2,
    2779.70, 'cartão', 'entregue'
);

INSERT INTO pedidos (
    data_pedido, cliente_id, cliente_nome, cliente_email, cliente_telefone, cliente_endereco,
    produto_id_1, produto_nome_1, produto_categoria_1, produto_preco_1, produto_quantidade_1,
    valor_total, forma_pagamento, status_pedido
) VALUES (
    '2023-10-16 09:15:22', 102, 'Maria Oliveira', 'maria@empresa.com', '(21) 7777-5555', 'Av. B, 456 - Rio de Janeiro/RJ',
    3005, 'Notebook Ultra', 'Informática', 4299.00, 1,
    4299.00, 'boleto', 'processando'
);

INSERT INTO pedidos (
    data_pedido, cliente_id, cliente_nome, cliente_email, cliente_telefone, cliente_endereco,
    produto_id_1, produto_nome_1, produto_categoria_1, produto_preco_1, produto_quantidade_1,
    produto_id_2, produto_nome_2, produto_categoria_2, produto_preco_2, produto_quantidade_2,
    valor_total, forma_pagamento, status_pedido
) VALUES (
    '2023-10-17 16:45:10', 103, 'Carlos Souza', 'carlos@outro.com', '(31) 8888-3333', 'Rua C, 789 - Belo Horizonte/MG',
    2008, 'Mesa Digitalizadora', 'Informática', 799.00, 1,
    4002, 'Canetas Especiais', 'Acessórios', 129.90, 3,
    (799.00 * 1) + (129.90 * 3), -- Calculando o valor_total manualmente
    'pix', 'enviado'
);

INSERT INTO pedidos (
    data_pedido, cliente_id, cliente_nome, cliente_email, cliente_telefone, cliente_endereco,
    produto_id_1, produto_nome_1, produto_categoria_1, produto_preco_1, produto_quantidade_1,
    produto_id_2, produto_nome_2, produto_categoria_2, produto_preco_2, produto_quantidade_2,
    valor_total, forma_pagamento, status_pedido
) VALUES (
    '2023-10-18 11:20:33', 101, 'João Silva', 'joao@email.com', '(11) 9999-8888', 'Rua A, 123 - São Paulo/SP',
    8006, 'Fone Bluetooth', 'Eletrônicos', 199.90, 2,
    9007, 'Suporte Celular', 'Acessórios', 59.90, 1,
    459.70, 'cartão', 'entregue'
);

-- Pedido com problema de atualização (o preço do produto mudou)
INSERT INTO pedidos (
    data_pedido, cliente_id, cliente_nome, cliente_email, cliente_telefone, cliente_endereco,
    produto_id_1, produto_nome_1, produto_categoria_1, produto_preco_1, produto_quantidade_1,
    valor_total, forma_pagamento, status_pedido
) VALUES (
    '2023-10-19 13:10:05', 104, 'Ana Costa', 'ana@exemplo.com', '(41) 6666-2222', 'Av. D, 321 - Curitiba/PR',
    5001, 'Smartphone XYZ', 'Eletrônicos', 2399.90, 1,  -- Preço diferente do primeiro pedido
    2399.90, 'cartão', 'processando'
);