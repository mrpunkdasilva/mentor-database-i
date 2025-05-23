CREATE TABLE CLIENTES
(
    cliente_id SERIAL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    telefone   VARCHAR(20)  NOT NULL
);

CREATE TABLE ENDERECOS
(
    endereco_id SERIAL PRIMARY KEY,
    cliente_id  INTEGER REFERENCES CLIENTES (cliente_id),
    cep         CHAR(9),
    cidade      VARCHAR(150),
    estado      CHAR(2),
    numero      INTEGER,
    complemento VARCHAR(100)
);

CREATE TABLE CATEGORIAS
(
    categoria_id SERIAL PRIMARY KEY,
    nome         VARCHAR(120) NOT NULL,
    descricao    VARCHAR(150)
);

CREATE TABLE PRODUTOS
(
    produto_id   INTEGER PRIMARY KEY,
    nome         VARCHAR(100),
    categoria_id INTEGER REFERENCES CATEGORIAS (categoria_id),
    preco        DECIMAL(10, 2),
    estoque   INTEGER DEFAULT 0
);

CREATE TABLE pedidos
(
    pedido_id       SERIAL PRIMARY KEY,
    data_pedido     TIMESTAMP      NOT NULL,
    cliente_id      INTEGER        NOT NULL REFERENCES CLIENTES (cliente_id),
    endereco_id     INTEGER        NOT NULL REFERENCES ENDERECOS (endereco_id),
    valor_total     DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50)    NOT NULL,
    status_pedido   VARCHAR(20)    NOT NULL
);

CREATE TABLE itens_pedidos
(
    item_id        SERIAL PRIMARY KEY,
    pedido_id      INTEGER        NOT NULL REFERENCES pedidos (pedido_id),
    produto_id     INTEGER        NOT NULL REFERENCES PRODUTOS (produto_id),
    quantidade     INTEGER        NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    subtotal       DECIMAL(10, 2) NOT NULL GENERATED ALWAYS AS (quantidade * preco_unitario) STORED
);
