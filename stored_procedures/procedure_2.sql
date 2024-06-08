CREATE OR REPLACE PROCEDURE calcular_total_vendas_produto(
    produto_id INT,
    data_inicio DATE,
    data_fim DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    CREATE TABLE temp_resultado AS
    SELECT
        produto_id AS "Produto ID",
        data_inicio AS "Data Início",
        data_fim AS "Data Fim",
        SUM(v.valor_total) AS "Total Vendas"
    FROM
        venda v
    INNER JOIN
        contem c ON v.id_venda = c.fk_venda_id_venda
    WHERE
        c.fk_produto_id = produto_id
        AND v.data_venda BETWEEN data_inicio AND data_fim
    GROUP BY
        produto_id, data_inicio, data_fim;

END;
$$;

CALL calcular_total_vendas_produto(1, '2024-06-01', '2024-06-10');
