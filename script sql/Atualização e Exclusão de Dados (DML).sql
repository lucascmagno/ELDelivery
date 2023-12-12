#Atualizar o horário de funcionamento de um restaurante:
UPDATE restaurante
SET horario_funcionamento = '09:00 - 22:00'
WHERE nome_restaurante = 'Restaurante A';

#Excluir um produto com base no nome:
DELETE FROM produto
WHERE nome = 'Produto X';

#Atualizar a quantidade de estrelas de uma avaliação:
UPDATE avaliacao
SET quantidade_estrela = 4
WHERE idavaliacao = 1;

#Excluir um cliente e suas compras associadas:
DELETE FROM clientes
WHERE idClientes = 100;

#Atualizar a quantidade de produtos disponíveis:
UPDATE produto
SET quantidade = quantidade - 5
WHERE nome = 'Produto Y';


#Excluir uma venda com base no valor:
DELETE FROM venda
WHERE valor_venda < 50.00;
