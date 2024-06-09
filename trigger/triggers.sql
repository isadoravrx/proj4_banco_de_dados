/*triggers*/

CREATE TRIGGER atualizar_qnt_livro_compra
AFTER INSERT ON contem
FOR EACH ROW
BEGIN
    DECLARE livro_id INT;

    SELECT fk_categoria_produto_id INTO livro_id FROM produto WHERE fk_venda_id_venda = NEW.fk_venda_id_venda;

    UPDATE livro SET qtd_exemplares = qtd_exemplares - 1 WHERE id_livro = livro_id;
END;

CREATE TRIGGER atualizar_qnt_livro_alunos 
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE produto_tipo VARCHAR(50);   
    DECLARE aluno_id INT;

    SELECT tipo INTO produto_tipo FROM produto WHERE id = NEW.fk_produto_id;
    
    IF produto_tipo = 'livro' THEN
        SELECT fk_Aluno_id_da_matricula INTO aluno_id FROM compra WHERE codigo_recibo = NEW.codigo_recibo;

        UPDATE Aluno SET quantidade_livros_comprados = quantidade_livros_comprados + 1 WHERE id_da_matricula = aluno_id  AND fk_pessoa_id = NEW.fk_Aluno_fk_pessoa_id;
END;

CREATE TRIGGER atualizar_saldo_cantina_alunos
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE valor_produto REAL;
    DECLARE aluno_id INT;   

    SELECT preco INTO valor_produto FROM Produtos_cantina WHERE nome_produto = NEW.fk_Produtos_cantina_nome_produto;

    SELECT fk_Aluno_id_da_matricula INTO aluno_id FROM compra WHERE codigo_recibo = NEW.codigo_recibo;

    UPDATE Aluno SET saldo_da_cantina = saldo_da_cantina - valor_produto WHERE id_da_matricula = aluno_id AND fk_pessoa_id = NEW.fk_Aluno_fk_pessoa_id;
END;

CREATE TRIGGER atualizar_qnt_produtos_cantina_compra
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE produto_nome INT;

    SELECT fk_Produtos_cantina_nome_produto INTO produto_nome FROM contem WHERE fk_venda_id_venda = NEW.fk_venda_id_venda;

    UPDATE Produtos_cantina SET qnt_produtos_cantina = qnt_produtos_cantina - 1 WHERE nome_produto = produto_nome;
