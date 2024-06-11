CREATE OR REPLACE PROCEDURE RelatorioVendasVendedor (
    p_n_do_pis INT,
    p_conta_bancaria INT,
    p_fk_pessoa_id INT,
    p_data_inicio DATE,
    p_data_fim DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE TABLE temp_relatorio_vendas_vendedor (
        id_venda INT,
        valor_total DECIMAL(10, 2),
        metodo_pagamento VARCHAR(50),
        data_venda DATE,
        nome_cliente VARCHAR(100),
        sobrenome_cliente VARCHAR(100)
    );

    INSERT INTO temp_relatorio_vendas_vendedor (id_venda, valor_total, metodo_pagamento, data_venda, nome_cliente, sobrenome_cliente)
    SELECT v.id_venda, v.valor_total, v.metodo_pagamento, v.data_venda, p.nome AS nome_cliente, p.sobrenome AS sobrenome_cliente
    FROM venda v
    JOIN cliente c ON v.fk_cliente_fk_Aluno_id_da_matricula = c.fk_Aluno_id_da_matricula AND v.fk_cliente_fk_Aluno_fk_pessoa_id = c.fk_Aluno_fk_pessoa_id
    JOIN aluno a ON c.fk_Aluno_id_da_matricula = a.id_da_matricula AND c.fk_Aluno_fk_pessoa_id = a.fk_pessoa_id
    JOIN pessoa p ON a.fk_pessoa_id = p.id
    JOIN vendedor vend ON v.fk_vendedor_fk_Funcionario_n__do_pis = vend.fk_Funcionario_n__do_pis AND v.fk_vendedor_fk_Funcionario_conta_bancaria = vend.fk_Funcionario_conta_bancaria AND v.fk_vendedor_fk_Funcionario_fk_pessoa_id = vend.fk_Funcionario_fk_pessoa_id
    JOIN funcionario func ON vend.fk_Funcionario_n__do_pis = func.n__do_pis AND vend.fk_Funcionario_conta_bancaria = func.conta_bancaria AND vend.fk_Funcionario_fk_pessoa_id = func.fk_pessoa_id
    JOIN pessoa p_func ON func.fk_pessoa_id = p_func.id
    WHERE vend.fk_Funcionario_n__do_pis = p_n_do_pis
      AND vend.fk_Funcionario_conta_bancaria = p_conta_bancaria
      AND vend.fk_Funcionario_fk_pessoa_id = p_fk_pessoa_id
      AND v.data_venda BETWEEN p_data_inicio AND p_data_fim;

END;
$$;


CALL RelatorioVendasVendedor(21213, 111, 1004, '2024-06-01', '2024-06-10');
