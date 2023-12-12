#Conceder permissões de SELECT para um usuário em tabelas específicas:
GRANT SELECT ON ELDelivery.uf TO user_delivery;
GRANT SELECT ON ELDelivery.cidade TO user_delivery;
GRANT SELECT ON ELDelivery.bairro TO user_delivery;
GRANT SELECT ON ELDelivery.logradouro TO user_delivery;

#Conceder permissões de INSERT, UPDATE, DELETE para um usuário em uma tabela específica:
GRANT INSERT, UPDATE, DELETE ON ELDelivery.venda TO admin_delivery;

#Revogar permissões de um usuário em uma tabela:
REVOKE SELECT ON ELDelivery.produto FROM user_delivery;

#Conceder permissões para todas as tabelas em um esquema:
GRANT ALL PRIVILEGES ON ELDelivery TO admin_delivery;

#Conceder permissões específicas em todas as tabelas de um esquema:
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA ELDelivery TO user_delivery;
