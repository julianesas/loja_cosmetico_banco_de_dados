-- INSERINDO DADOS NA TABELA CLIENTE

INSERT INTO cliente ( nome, cpf, data_cadastro)
VALUES
("Fernanda", "70100055502","2021/11/01" ),
("Mariana", "70100055503","2021/10/01" ),
("Matheus", "70100055504","2021/08/05" ),
("Joaquim", "70100055505","2021/11/05" ),
("Juliane", "70100055506","2021/10/06" );

-- CONSULTANDO A TABELA CLIENTE
select * from cliente;

-- INSERINDO DADOS NA TABELA PRODUTO

INSERT INTO produto ( nome, descricao,preco_cadastro)
VALUES
("Perfume Paris", "Perfume produzido em Paris em ...", 100.50),
("Base MAC", "Base Matte ...", 150.00),
("Batom Boca Rosa", "Batom Matte", 50.50),
("Shampoo Kerastase", "Para cabelos secos", 82.00),
("consicionador Kerastase", "Para cabelos secos ...", 90.50);

-- CONSULTANDO A TABELA PRODUTO

SELECT * FROM produto;

-- INSERINDO DADOS NA TABELA VENDEDOR

INSERT INTO vendedor ( nome, cpf)
VALUES
("Joao", "33344455502"),
("Raquel", "33344455503"),
("Helena", "33344455504");

-- CONSULTANDO A TABELA VENDEDOR

select * from vendedor;

-- INSERINDO DADOS NA TABELA VENDA

INSERT into venda (data_venda, id_vendedor, id_cliente)
VALUES
("2021/01/20", 1, 1),
("2021/01/25", 1, 2),
("2021/07/10", 2, 1),
("2021/07/08", 2, 3),
("2021/09/01", 3, 3),
("2021/09/02", 3, 5),
("2021/09/30", 2, 4),
("2021/10/25", 3, 5),
("2021/10/26", 2, 4),
("2021/11/01", 2, 2),
("2021/10/02", 1, 5),
("2021/10/02", 2, 1),
("2021/10/05", 3, 5),
("2021/10/05", 3, 1);

-- CONSULTANDO A TABELA VENDA

select * from venda;

-- INSERINDO DADOS NA TABELA ITEM_PEDIDO

insert into item_pedido (id_produto, id_venda, quantidade, preco_venda)
VALUES
(1, 1, 2, 100.50),
(2, 1, 2, 150.00),
(3, 2, 1, 50.50),
(1,3, 1, 100.50 ),
(2, 4, 4, 150.00 ),
(3, 5, 1, 50.50),
(1, 6, 1, 90.50 ),
(2, 7, 1, 150.00),
(3, 8, 5, 50.50),
(3, 9, 1, 50.50),
(3, 10, 2, 50.50 ),
(4, 11, 1, 82.00),
(4, 12, 2, 82.00),
(5, 13, 1, 90.50),
(5, 15, 2, 80.00),
(5, 15, 1, 90.50);

-- CONSULTANDO A TABELA ITEM_PEDIDO

SELECT * from item_pedido;
