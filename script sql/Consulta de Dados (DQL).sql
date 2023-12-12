#Listar todos os restaurantes com suas avaliações:
SELECT r.nome_restaurante, a.quantidade_estrela
FROM restaurante r
JOIN avaliacao a ON r.avaliacao_idavaliacao = a.idavaliacao;

#Encontrar clientes que fizeram compras acima de um determinado valor:
SELECT c.nome_cliente, v.valor_venda
FROM clientes c
JOIN venda v ON c.idClientes = v.Clientes_idClientes
WHERE v.valor_venda > 100.00;

#Calcular o total de vendas por restaurante:
SELECT r.nome_restaurante, SUM(v.valor_venda) AS total_vendas
FROM restaurante r
JOIN venda v ON r.idrestaurante = v.restaurante_idrestaurante
GROUP BY r.nome_restaurante;

#Encontrar os 5 produtos mais caros:
SELECT nome, valor
FROM produto
ORDER BY valor DESC
LIMIT 5;

#Listar todos os entregadores e seus veículos:
SELECT e.nome_entregador, v.modelo, v.tipo_veiculo
FROM entregador e
JOIN veiculo v ON e.veiculo_idveiculo = v.idveiculo;


#Contar o número de vendas por método de pagamento:
SELECT mp.metodo_pagamento, COUNT(*) AS total_vendas
FROM venda v
JOIN metodo_pagamento mp ON v.metodo_pagamento_idmetodo_pagamento = mp.idmetodo_pagamento
GROUP BY mp.metodo_pagamento;
