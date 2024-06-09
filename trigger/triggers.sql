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


/*atualizar_saldo_cantina*/
CREATE OR REPLACE FUNCTION atualizar_saldo_cantina()
RETURNS TRIGGER AS $$
DECLARE
    preco_produto_cantina REAL;
BEGIN
    SELECT preco INTO preco_produto_cantina
    FROM produtos_cantina
    WHERE nome_produto = NEW.fk_Produtos_cantina_nome_produto;

    UPDATE aluno
    SET saldo_da_cantina = saldo_da_cantina - preco_produto_cantina
    WHERE id_da_matricula = NEW.fk_Aluno_id_da_matricula;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_saldo_cantina
AFTER INSERT ON compra
FOR EACH ROW
EXECUTE FUNCTION atualizar_saldo_cantina();

/*
SELECT saldo_da_cantina, id_da_matricula, nome
FROM aluno;
*/

/*diminuir_qtd_produto_cantina*/
CREATE OR REPLACE FUNCTION diminuir_qtd_produto_cantina()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE produtos_cantina
    SET qnt_produtos_cantina = qnt_produtos_cantina - 1
    WHERE nome_produto = NEW.fk_Produtos_cantina_nome_produto;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER diminuir_qtd_produto_cantina
AFTER INSERT ON compra
FOR EACH ROW
EXECUTE FUNCTION diminuir_qtd_produto_cantina();

/*
SELECT qnt_produtos_cantina, nome_produto
FROM Produtos_cantina;
*/
