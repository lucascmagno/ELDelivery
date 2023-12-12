/*
	Vamos considerar um cenário onde um cliente faz uma compra, e queremos garantir que a atualização do estoque e a inserção da venda ocorram de forma atômica.
    Se qualquer parte da transação falhar, desejamos reverter todas as alterações.
*/

-- Iniciar a transação
START TRANSACTION;

-- Passo 1: Atualizar a quantidade de produtos disponíveis
UPDATE produto
SET quantidade = quantidade - 3
WHERE nome = 'Produto Z';

-- Passo 2: Inserir a venda na tabela
INSERT INTO venda (restaurante_idrestaurante, Clientes_idClientes, descricao, metodo_pagamento_idmetodo_pagamento, valor_venda, data_venda)
VALUES (1, 101, 'Compra do Produto Z', 1, 30.00, NOW());

-- Verificar se ocorreu algum erro
IF (SELECT ROW_COUNT() = 2) THEN
    -- Se tudo estiver bem, efetivar as alterações
    COMMIT;
    SELECT 'Transação efetivada com sucesso!';
ELSE
    -- Se houver algum erro, desfazer as alterações
    ROLLBACK;
    SELECT 'Erro na transação. As alterações foram desfeitas.';
END IF;

#faz a inserçao de uma venda e atualiza o produto vendido
-- Iniciar a transação
START TRANSACTION;

-- Passo 1: Inserir uma nova venda
INSERT INTO venda (restaurante_idrestaurante, Clientes_idClientes, descricao, metodo_pagamento_idmetodo_pagamento, valor_venda, data_venda)
VALUES (1, 101, 'Nova Venda', 1, 50.00, NOW());

-- Passo 2: Atualizar o estoque do produto vendido
UPDATE produto
SET quantidade = quantidade - 1
WHERE nome = 'Produto A';

-- Verificar se ocorreu algum erro
IF (SELECT ROW_COUNT() = 2) THEN
    -- Se tudo estiver bem, efetivar as alterações
    COMMIT;
    SELECT 'Transação efetivada com sucesso!';
ELSE
    -- Se houver algum erro, desfazer as alterações
    ROLLBACK;
    SELECT 'Erro na transação. As alterações foram desfeitas.';
END IF;
