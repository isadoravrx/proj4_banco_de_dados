CREATE OR REPLACE PROCEDURE RelatorioMelhoresVendedores (
    p_data_inicio DATE,
    p_data_fim DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE TABLE temp_melhores_vendedores (
        nome_vendedor VARCHAR(100),
        total_vendas DECIMAL(10, 2)
    );

    INSERT INTO temp_melhores_vendedores (nome_vendedor, total_vendas)
    SELECT p.nome AS nome_vendedor, SUM(v.valor_total) AS total_vendas
    FROM venda v
    JOIN funcionario f ON v.fk_vendedor_fk_Funcionario_n__do_pis = f.n__do_pis
    JOIN pessoa p ON f.fk_pessoa_id = p.id
    WHERE v.data_venda BETWEEN p_data_inicio AND p_data_fim
    GROUP BY p.nome;

END;
$$;


CALL RelatorioMelhoresVendedores('2024-06-01', '2024-06-30');
