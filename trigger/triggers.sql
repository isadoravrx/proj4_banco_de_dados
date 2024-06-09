/*triggers*/

/*atualizar_qnt_exemplares*/
CREATE OR REPLACE FUNCTION atualizar_qnt_exemplares()
RETURNS TRIGGER AS $$
DECLARE
    produto_nome varchar;
BEGIN
    SELECT nome_produto INTO produto_nome
    FROM produto
    WHERE id = NEW.fk_produto_id;

    UPDATE livro
    SET qtd_exemplares = qtd_exemplares - 1
    WHERE nome_livro = produto_nome;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_qnt_exemplares
AFTER INSERT ON contem
FOR EACH ROW
EXECUTE FUNCTION atualizar_qnt_exemplares();

/*
SELECT qtd_exemplares, nome_livro
FROM livro;
*/

/*atualizar_qnt_exemplares*/
CREATE OR REPLACE FUNCTION atualizar_qnt_livros_comprados()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT fk_categoria_produto_id FROM produto WHERE id = NEW.fk_produto_id) = 1 THEN
        UPDATE aluno
        SET quantidade_livros_comprados = quantidade_livros_comprados + 1
        WHERE id_da_matricula = NEW.id_aluno_compra;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_qnt_livros_comprados
AFTER INSERT ON contem
FOR EACH ROW
EXECUTE FUNCTION atualizar_qnt_livros_comprados();

/*
SELECT quantidade_livros_comprados, id_da_matricula, nome
FROM aluno;
*/


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
