-- 1. Quais são os produtos vendidos?

select DISTINCT
	produto.nome
FROM item_pedido item
LEFT JOIN produto
	on item.id_produto = produto.id;

-- -- 2. Quais foram minhas últimas 3 vendas

SELECT item_pedido.id,venda.id, produto.nome, venda.data_venda
FROM item_pedido
LEFT JOIN venda
	ON item_pedido.id_venda=venda.id
LEFT JOIN produto 
	ON item_pedido.id_produto = produto.id
ORDER by venda.data_venda DESC 
	LIMIT 3;

-- 3. Quais são os produtos que começa com "s"?
SELECT item_pedido.id,venda.id, produto.nome, venda.data_venda
FROM item_pedido
LEFT JOIN venda
	ON item_pedido.id_venda=venda.id
LEFT JOIN produto 
	ON item_pedido.id_produto = produto.id
ORDER by venda.data_venda DESC 
	LIMIT 3;
    
-- 3. Quais são os produtos vendidos que começa com "s"
select DISTINCT produto.nome 
from item_pedido
LEFT JOIN produto
on item_pedido.id_produto = produto.id
WHERE produto.nome like 's%';

-- 4. Todos os produto e seus preços em ordem decrescente

select DISTINCT produto.nome,  item_pedido.preco_venda
from item_pedido
LEFT JOIN produto
on item_pedido.id_produto = produto.id
ORDER BY produto.nome DESC, item_pedido.preco_venda desc;

-- 5. Todos os produto com preço entre 50 e 100 reais

select DISTINCT produto.nome,  item_pedido.preco_venda
from item_pedido
LEFT JOIN produto
on item_pedido.id_produto = produto.id
WHERE item_pedido.preco_venda BETWEEN 50 and 100
ORDER BY produto.nome DESC, item_pedido.preco_venda desc;

-- 6. Quero minhas vendas de shampoo e condicionador
select  item_pedido.id, venda.id codigo_venda,  produto.nome,  item_pedido.preco_venda
from item_pedido
LEFT JOIN produto
on item_pedido.id_produto = produto.id
LEFT join venda 
on item_pedido.id_venda = venda.id
WHERE produto.nome IN ('Shampoo Kerastase', 'Condicionador Kerastase');


-- 7. Quais produtos eu consigo comprar com 100 reais

select  distinct produto.nome,  item_pedido.preco_venda
from item_pedido
LEFT JOIN produto
on item_pedido.id_produto = produto.id
LEFT join venda 
on item_pedido.id_venda = venda.id
WHERE item_pedido.preco_venda <= 100 
ORDER by item_pedido.preco_venda desc;

-- 8. Crie uma view que tenha o relatório de vendas

CREATE view relatorio_vw AS
select  
	item_pedido.id id_pedido,
	venda.id numero_venda, 
    produto.nome,  
    item_pedido.preco_venda, 
    item_pedido.quantidade, 
    venda.data_venda,
    vendedor.nome vendedor,
    cliente.nome cliente
from item_pedido
LEFT join venda 
	on item_pedido.id_venda = venda.id
LEFT JOIN produto
	on item_pedido.id_produto = produto.id
LEFT JOIN cliente
	on venda.id_cliente = cliente.id
LEFT JOIN vendedor
	on venda.id_vendedor = vendedor.id;
    
select * from relatorio_vw;

-- 9. Qual a venda de maior valor

select numero_venda, SUM(preco_venda*quantidade) valor_total_venda
from relatorio_vw
GROUP BY numero_venda
ORDER BY valor_total_venda  desc
LIMIT 1;

-- 10. Qual a venda de menor valor

select numero_venda, SUM(preco_venda*quantidade) valor_total_venda
from relatorio_vw
GROUP BY numero_venda
ORDER BY valor_total_venda  ASC
LIMIT 1;

-- 11. Qual o produto de maior valor?

select DISTINCT nome, max(preco_venda) from relatorio_vw;

-- 12. Qual o produto de menor valor?

select DISTINCT nome, MIN(preco_venda) from relatorio_vw;

-- 13. Quantas vendas foram realizadas?

select  COUNT(distinct numero_venda) numero_de_vendas from relatorio_vw;

-- 14. quantos pedidos cada venda teve?
select  numero_venda, COUNT(numero_venda) numero_de_pedidos 
from relatorio_vw 
GROUP BY numero_venda;

-- 15. Quantos revendedores venderam produtos?

select  COUNT(DISTINCT vendedor) numero_vendedor
from relatorio_vw;

-- 16. Quantos clientes compraram produtos
select  COUNT(DISTINCT cliente) numero_vendedor
from relatorio_vw;

-- 17. Quantos produtos distintos foram vendidos
SELECT COUNT(DISTINCT nome) produtos_vendidos
FROM relatorio_vw;

-- 18. Quantos preços diferentes tem os produtos

select nome, count(DISTINCT preco_venda) precos_distintos 
from relatorio_vw
group by nome;

-- 19. Quantos reais foram vendidos no total
select 'Total', round(SUM(preco_venda*quantidade), 2) Valor_total
from relatorio_vw;

 -- 20. Valor de Vendas por Vendedor
 
select vendedor, round(SUM(preco_venda*quantidade), 2) Valor_total
from relatorio_vw
GROUP BY vendedor;

-- 21. Quantidade de clientes por vendedor

select vendedor, COUNT(DISTINCT cliente) numero_clientes
from relatorio_vw
GROUP BY vendedor;

-- 22. Quanto cada produto vendeu (valor)

SELECT nome, sum(preco_venda*quantidade) total_venda
FROM relatorio_vw
GROUP BY nome;

-- 23. Quanto cada produto vendeu (quantidade)
SELECT nome, count(nome) qtd_venda
FROM relatorio_vw
GROUP BY nome;


-- 24. Produtos que venderam mais de 3 unidades

SELECT nome, count(nome) qtd_venda
FROM relatorio_vw
GROUP BY nome
HAVING qtd_venda > 3;

SELECT
	nome,
    count(nome) qtd_venda,
    CASE
    	WHEN count(nome) > 3 THEN 'Vendeu mais que 3' 
        ELSE 'Vendeu menos que 3'
    END
FROM relatorio_vw
group by nome
HAVING COUNT(nome) > 3
ORDER BY COUNT(nome) DESC;


-- 25. Numero de vendas realizado por  helena;

select vendedor, count(DISTINCT numero_venda) numedro_vendas 
from relatorio_vw 
where vendedor = "Helena";

-- 26. Vendas da helena por produto maior ou igual a 2
SELECT nome, count(DISTINCT numero_venda) numero_venda
FROM relatorio_vw
where vendedor = 'Helena'
group by nome
HAVING numero_venda >=2;