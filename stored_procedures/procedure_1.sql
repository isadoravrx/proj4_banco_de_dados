-- Criação do procedimento para definir desconto em produtos
CREATE OR REPLACE PROCEDURE set_desconto(category INT, percentage REAL)
LANGUAGE plpgsql
AS $$
BEGIN
   -- Aplica o desconto aos produtos da categoria especificada pelo id
   UPDATE produto
   SET preco = preco * (1 - percentage)
   WHERE fk_categoria_produto_id = category;
END;
$$;

-- Chamada do procedimento
CALL set_desconto(1, 0.1);
