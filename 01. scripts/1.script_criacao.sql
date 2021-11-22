-- APAGANDO O SCHEMA demo
DROP TABLE IF EXISTS itens_pedido;

-- CRIANDO A TABELA PRODUTO

CREATE TABLE produto ( 
	id int NOT NULL AUTO_INCREMENT,
    nome varchar(100) not NULL,
    descricao VARCHAR(100) NOT NULL,
    preco_cadastro decimal(6,2) NOT NULL,
  PRIMARY KEY(id)
);

-- CRIANDO A TABELA VENDA
CREATE TABLE venda(
	id int not NULL AUTO_INCREMENT,
    data_venda TIMESTAMP,
  	id_vendedor int NOT NULL,
  	id_cliente int NOT NULL,
  PRIMARY KEY(id)
);

-- CRIANDO A TABELA VENDEDOR

CREATE TABLE vendedor (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
	cpf char(11) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

-- CRIANDO A TABELA CLIENTE

CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
	cpf char(11) NOT NULL UNIQUE,
	data_cadastro TIMESTAMP,
	PRIMARY KEY (id)
);

-- CRIANDO A TABELA ITENS_PEDIDOproduto
CREATE TABLE item_pedido (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_produto int NOT NULL,
  	id_venda int NOT NULL,
	quantidade int,
	preco_venda DECIMAL(6,2) NOT NULL
);

-- ADICIONANDO AS CHAVES ESTRANGEIRAS NAS TABELAS(ESTABELECENDO RELACIONAMENTOS)

ALTER TABLE venda 
ADD CONSTRAINT id_vendedor_fk 
FOREIGN KEY (id_vendedor) 
REFERENCES vendedor(id);

ALTER TABLE venda 
ADD CONSTRAINT id_cliente_fk 
FOREIGN KEY (id_cliente) 
REFERENCES cliente(id);


ALTER TABLE item_pedido 
ADD CONSTRAINT id_produto_fk 
FOREIGN KEY (id_produto) 
REFERENCES produto(id);

ALTER TABLE item_pedido 
ADD CONSTRAINT id_venda_fk 
FOREIGN KEY (id_venda) 
REFERENCES venda(id);