CREATE OR REPLACE PROCEDURE dar_desconto_por_categoria(category INT, percentage REAL)
LANGUAGE plpgsql
AS $$
BEGIN
   UPDATE produto
   SET preco = preco * (1 - percentage)
   WHERE fk_categoria_produto_id = category;
END;
$$;

CALL dar_desconto_por_categoria(1, 0.1);
