LINKS para acesso web: 
http://localhost:8080/Marcenaria/incluirProduto.jsp

http://localhost:8080/Marcenaria/listarProdutos.jsp


criação do data base :
-- Cria o banco de dados 'marcenaria'
CREATE DATABASE marcenaria;

-- Seleciona o banco de dados 'marcenaria' para usá-lo
USE marcenaria;

-- Cria a tabela 'mcaprodutos' com os campos necessários
CREATE TABLE mcaprodutos (
    id INT AUTO_INCREMENT PRIMARY KEY,         -- Identificador único do produto
    nome VARCHAR(255) NOT NULL,                -- Nome do produto
    descricao TEXT,                            -- Descrição do produto
    data_inclusao DATE,                        -- Data de inclusão do produto
    preco DECIMAL(10, 2),                      -- Preço do produto com até 2 casas decimais
    tipo_madeira VARCHAR(255)                  -- Tipo de madeira do produto
);
