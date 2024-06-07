/* projeto_logico: */

CREATE TABLE braile (
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    PRIMARY KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto)
);

CREATE TABLE servico (
    id_servico int PRIMARY KEY,
    data_prazo_servico varchar,
    fk_custo_de_entrega_tipo_servico varchar
);

CREATE TABLE audiobook (
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    PRIMARY KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto)
);

CREATE TABLE venda (
    id_venda int PRIMARY KEY,
    quantidade_produtos int,
    fk_vendedor_fk_Funcionario_n__do_pis int,
    fk_vendedor_fk_Funcionario_conta_bancaria int,
    fk_vendedor_fk_Funcionario_fk_pessoa_id int,
    fk_cliente_fk_Aluno_id_da_matricula int,
    fk_cliente_fk_Aluno_fk_pessoa_id int,
    fk_metodo_pagamento_tipo_pagamento varchar
);

CREATE TABLE ebook (
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    fk_cliente_fk_Aluno_id_da_matricula int,
    fk_cliente_fk_Aluno_fk_pessoa_id int,
    PRIMARY KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto)
);

CREATE TABLE livro_fisico (
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    PRIMARY KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto)
);

CREATE TABLE palestra_debate (
    horario time ,
    taxa_ingresso real,
    id_evento int PRIMARY KEY,
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    fk_livro_cadastro_id_cadastro varchar
);

CREATE TABLE livro_cadastro (
    nome_livro varchar,
    ano_publicacao int,
    qtd_exemplares int,
    id_livro int,
    fk_produto_id_produto int,
    fk_servico_id_servico int,
    tipo_cadastro varchar,
    id_cadastro varchar,
    fk_categoria_estante_id int,
    fk_vendedor_fk_Funcionario_n__do_pis int,
    fk_vendedor_fk_Funcionario_conta_bancaria int,
    fk_vendedor_fk_Funcionario_fk_pessoa_id int,
    fk_editora_nome varchar,
    PRIMARY KEY (id_livro, fk_produto_id_produto, id_cadastro)
);

CREATE TABLE categoria_estante (
    nome varchar,
    id int PRIMARY KEY,
    endereco_sessao varchar
);

CREATE TABLE avaliacao (
    id_avaliacao int PRIMARY KEY,
    comentario varchar,
    nota real,
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    fk_livro_cadastro_id_cadastro varchar,
    fk_cliente_fk_Aluno_id_da_matricula int,
    fk_cliente_fk_Aluno_fk_pessoa_id int
);

CREATE TABLE instituicao (
    telefone varchar,
    rua varchar,
    numero int,
    bairro varchar,
    email varchar,
    cnpj varchar PRIMARY KEY
);

CREATE TABLE vendedor (
    regime_trabalho varchar,
    salario real,
    cupom_vendedor real,
    fk_Funcionario_n__do_pis int,
    fk_Funcionario_conta_bancaria int,
    fk_Funcionario_fk_pessoa_id int,
    PRIMARY KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
);

CREATE TABLE editora (
    email varchar,
    numero int,
    rua varchar,
    bairro varchar,
    telefone varchar,
    nome varchar PRIMARY KEY
);

CREATE TABLE Trasportador_escolar (
    Responsavel_do_veiculo varchar,
    Numero_da_placa varchar,
    Quantidade_de_alunos int,
    fk_pessoa_id int,
    PRIMARY KEY (Numero_da_placa, fk_pessoa_id)
);

CREATE TABLE autor (
    nome varchar,
    sobrenome varchar,
    data_nascimento date,
    id_autor int PRIMARY KEY,
    sexo char
);

CREATE TABLE Departamento (
    nome_do_departamento varchar PRIMARY KEY
);

CREATE TABLE pessoa (
    data_nascimento date,
    id int PRIMARY KEY,
    nome varchar,
    sobrenome varchar,
    sexo char,
    email varchar,
    numero int,
    bairro varchar,
    complemento varchar,
    rua varchar,
    idade int,
    CPF varchar,
    RG varchar,
    telefone varchar
);

CREATE TABLE Funcionario_da_saude (
    registro_do_conselho_regional int,
    Profissao varchar,
    fk_Funcionario_n__do_pis int,
    fk_Funcionario_conta_bancaria int,
    fk_Funcionario_fk_pessoa_id int,
    PRIMARY KEY (registro_do_conselho_regional, Profissao, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
);

CREATE TABLE cliente (
    status_cliente varchar,
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int,
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    fk_livro_cadastro_id_cadastro varchar,
    PRIMARY KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
);

CREATE TABLE desconto_mensalidade (
    beneficio_voucher int,
    id_recompensa int PRIMARY KEY,
    data_vencimento date,
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int
);

CREATE TABLE Funcionario_administrativo (
    registro_cfa int,
    fk_Funcionario_n__do_pis int,
    fk_Funcionario_conta_bancaria int,
    fk_Funcionario_fk_pessoa_id int,
    fk_Departamento_nome_do_departamento varchar,
    PRIMARY KEY (registro_cfa, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
);

CREATE TABLE Professor (
    carteira_de_identificacao_do_professor INTEGER,
    fk_Funcionario_n__do_pis int,
    fk_Funcionario_conta_bancaria int,
    fk_Funcionario_fk_pessoa_id int,
    PRIMARY KEY (carteira_de_identificacao_do_professor, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
);

CREATE TABLE Funcionario (
    n__do_pis int,
    conta_bancaria int,
    salario varchar,
    fk_pessoa_id int,
    PRIMARY KEY (n__do_pis, conta_bancaria, fk_pessoa_id)
);

CREATE TABLE Responsavel_financeiro (
    conta_bancaria int,
    status_pagamento boolean,
    fk_pessoa_id int,
    PRIMARY KEY (conta_bancaria, fk_pessoa_id)
);

CREATE TABLE Disciplina (
    nome_da__discplina varchar PRIMARY KEY,
    Carga_horaria int,
    tipo_disciplina varchar,
    fk_Professor_carteira_de_identificacao_do_professor INTEGER,
    fk_Professor_fk_Funcionario_n__do_pis int,
    fk_Professor_fk_Funcionario_conta_bancaria int,
    fk_Professor_fk_Funcionario_fk_pessoa_id int,
    fk_segmento_Nome_do_segmento varchar
);

CREATE TABLE EAD (
    senha varchar,
    usuario varchar,
    FK_Aluno_id_da_matricula int,
    FK_Aluno_fk_pessoa_id int,
    PRIMARY KEY (senha, FK_Aluno_id_da_matricula, FK_Aluno_fk_pessoa_id)
);

CREATE TABLE presencial (
    senha_catraca int,
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int,
    PRIMARY KEY (senha_catraca, fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
);

CREATE TABLE segmento (
    Nome_do_segmento varchar PRIMARY KEY
);

CREATE TABLE Aluno (
    quantidade_de_faltas int,
    id_da_matricula int,
    saldo_da_cantina real,
    mensalidade real,
    quantidade_livros_comprados int,
    fk_pessoa_id int,
    fk_Trasportador_escolar_Numero_da_placa varchar,
    fk_Trasportador_escolar_fk_pessoa_id int,
    fk_Responsavel_financeiro_conta_bancaria int,
    fk_Responsavel_financeiro_fk_pessoa_id int,
    fk_segmento_Nome_do_segmento varchar,
    fk_lista_materiais_id_lista varchar,
    fk_matriz_escolar_id_matriz int,
    PRIMARY KEY (id_da_matricula, fk_pessoa_id)
);

CREATE TABLE Produtos_cantina (
    nome_produto varchar PRIMARY KEY,
    preco real
);

CREATE TABLE material_papelaria (
    fk_produto_id_produto int PRIMARY KEY,
    fk_fornecedor_cnpj varchar,
    fk_instituicao_cnpj varchar,
    fk_selo_inmetro_id_registro int
);

CREATE TABLE produto (
    id_produto int PRIMARY KEY,
    valor_produto real,
    nome_produto varchar,
    quantidade_estoque int,
    vencimento int,
    fk_categoria_produto_endereco_estante varchar
);

CREATE TABLE fornecedor (
    cnpj varchar PRIMARY KEY,
    nome varchar,
    telefone varchar
);

CREATE TABLE lista_materiais (
    modelo_fardamento varchar,
    id_lista varchar PRIMARY KEY,
    fk_matriz_escolar_id_matriz int
);

CREATE TABLE categoria_produto (
    nome varchar,
    endereco_estante varchar PRIMARY KEY
);

CREATE TABLE matriz_escolar (
    turma varchar,
    serie int,
    turno varchar,
    id_matriz int PRIMARY KEY
);

CREATE TABLE informacoes_evento (
    sala varchar,
    quantidade_cadeiras int,
    id int PRIMARY KEY
);

CREATE TABLE custo_de_entrega (
    tipo_servico varchar PRIMARY KEY,
    taxa_servico int
);

CREATE TABLE metodo_pagamento (
    tipo_pagamento varchar PRIMARY KEY,
    desconto real
);

CREATE TABLE selo_inmetro (
    marca varchar,
    certificado varchar,
    id_registro int PRIMARY KEY
);

CREATE TABLE contem (
    fk_venda_id_venda int,
    fk_produto_id_produto int
);

CREATE TABLE promove (
    fk_instituicao_cnpj varchar,
    fk_palestra_debate_id_evento int
);

CREATE TABLE produz (
    fk_autor_id_autor int,
    fk_livro_cadastro_id_livro int,
    fk_livro_cadastro_fk_produto_id_produto int,
    fk_livro_cadastro_id_cadastro varchar
);

CREATE TABLE subordinado_a (
    fk_Funcionario_n__do_pis int,
    fk_Funcionario_conta_bancaria int,
    fk_Funcionario_fk_pessoa_id int,
    fk_instituicao_cnpj varchar
);

CREATE TABLE consulta (
    fk_Funcionario_da_saude_registro_do_conselho_regional int,
    fk_Funcionario_da_saude_Profissao varchar,
    fk_Funcionario_da_saude_fk_Funcionario_n__do_pis int,
    fk_Funcionario_da_saude_fk_Funcionario_conta_bancaria int,
    fk_Funcionario_da_saude_fk_Funcionario_fk_pessoa_id int,
    fk_pessoa_id int,
    data_consulta date PRIMARY KEY,
    diagnostico varchar
);

CREATE TABLE e_ensinado_por (
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int,
    fk_Professor_carteira_de_identificacao_do_professor INTEGER,
    fk_Professor_fk_Funcionario_n__do_pis int,
    fk_Professor_fk_Funcionario_conta_bancaria int,
    fk_Professor_fk_Funcionario_fk_pessoa_id int
);

CREATE TABLE estuda__Disciplina_EAD_presencial (
    fk_Disciplina_nome_da__discplina varchar,
    fk_EAD_senha varchar,
    fk_EAD_FK_Aluno_id_da_matricula int,
    fk_EAD_FK_Aluno_fk_pessoa_id int,
    fk_presencial_senha_catraca int,
    fk_presencial_fk_Aluno_id_da_matricula int,
    fk_presencial_fk_Aluno_fk_pessoa_id int
);

CREATE TABLE compra (
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int,
    fk_Produtos_cantina_nome_produto varchar,
    dia_compra date,
    codigo_recibo int PRIMARY KEY
);

CREATE TABLE composto_por (
    fk_lista_materiais_id_lista varchar,
    fk_produto_id_produto int
);

CREATE TABLE possui_desconto_para (
    fk_Aluno_id_da_matricula int,
    fk_Aluno_fk_pessoa_id int,
    fk_palestra_debate_id_evento int,
    valor_desconto real
);

CREATE TABLE possui (
    fk_informacoes_evento_id int,
    fk_palestra_debate_id_evento int
);
 
ALTER TABLE braile ADD CONSTRAINT FK_braile_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, ???)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, ???)
    ON DELETE CASCADE;
 
ALTER TABLE servico ADD CONSTRAINT FK_servico_2
    FOREIGN KEY (fk_custo_de_entrega_tipo_servico)
    REFERENCES custo_de_entrega (tipo_servico)
    ON DELETE CASCADE;
 
ALTER TABLE audiobook ADD CONSTRAINT FK_audiobook_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, ???)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, ???)
    ON DELETE CASCADE;
 
ALTER TABLE venda ADD CONSTRAINT FK_venda_2
    FOREIGN KEY (fk_vendedor_fk_Funcionario_n__do_pis, fk_vendedor_fk_Funcionario_conta_bancaria, fk_vendedor_fk_Funcionario_fk_pessoa_id)
    REFERENCES vendedor (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE venda ADD CONSTRAINT FK_venda_3
    FOREIGN KEY (fk_cliente_fk_Aluno_id_da_matricula, fk_cliente_fk_Aluno_fk_pessoa_id)
    REFERENCES cliente (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE venda ADD CONSTRAINT FK_venda_4
    FOREIGN KEY (fk_metodo_pagamento_tipo_pagamento)
    REFERENCES metodo_pagamento (tipo_pagamento)
    ON DELETE CASCADE;
 
ALTER TABLE ebook ADD CONSTRAINT FK_ebook_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, ???)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, ???)
    ON DELETE CASCADE;
 
ALTER TABLE ebook ADD CONSTRAINT FK_ebook_3
    FOREIGN KEY (fk_cliente_fk_Aluno_id_da_matricula, fk_cliente_fk_Aluno_fk_pessoa_id)
    REFERENCES cliente (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE livro_fisico ADD CONSTRAINT FK_livro_fisico_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, ???)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, ???)
    ON DELETE CASCADE;
 
ALTER TABLE palestra_debate ADD CONSTRAINT FK_palestra_debate_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, fk_livro_cadastro_id_cadastro)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, id_cadastro)
    ON DELETE CASCADE;
 
ALTER TABLE livro_cadastro ADD CONSTRAINT FK_livro_cadastro_2
    FOREIGN KEY (fk_produto_id_produto)
    REFERENCES produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE livro_cadastro ADD CONSTRAINT FK_livro_cadastro_3
    FOREIGN KEY (fk_servico_id_servico)
    REFERENCES servico (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE livro_cadastro ADD CONSTRAINT FK_livro_cadastro_4
    FOREIGN KEY (fk_categoria_estante_id)
    REFERENCES categoria_estante (id)
    ON DELETE RESTRICT;
 
ALTER TABLE livro_cadastro ADD CONSTRAINT FK_livro_cadastro_5
    FOREIGN KEY (fk_vendedor_fk_Funcionario_n__do_pis, fk_vendedor_fk_Funcionario_conta_bancaria, fk_vendedor_fk_Funcionario_fk_pessoa_id)
    REFERENCES vendedor (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE livro_cadastro ADD CONSTRAINT FK_livro_cadastro_6
    FOREIGN KEY (fk_editora_nome)
    REFERENCES editora (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, fk_livro_cadastro_id_cadastro)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, id_cadastro)
    ON DELETE CASCADE;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_3
    FOREIGN KEY (fk_cliente_fk_Aluno_id_da_matricula, fk_cliente_fk_Aluno_fk_pessoa_id)
    REFERENCES cliente (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE vendedor ADD CONSTRAINT FK_vendedor_2
    FOREIGN KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario (n__do_pis, conta_bancaria, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Trasportador_escolar ADD CONSTRAINT FK_Trasportador_escolar_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario_da_saude ADD CONSTRAINT FK_Funcionario_da_saude_2
    FOREIGN KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario (n__do_pis, conta_bancaria, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_3
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, fk_livro_cadastro_id_cadastro)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, id_cadastro)
    ON DELETE RESTRICT;
 
ALTER TABLE desconto_mensalidade ADD CONSTRAINT FK_desconto_mensalidade_2
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario_administrativo ADD CONSTRAINT FK_Funcionario_administrativo_2
    FOREIGN KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario (n__do_pis, conta_bancaria, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario_administrativo ADD CONSTRAINT FK_Funcionario_administrativo_3
    FOREIGN KEY (fk_Departamento_nome_do_departamento)
    REFERENCES Departamento (nome_do_departamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario (n__do_pis, conta_bancaria, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Responsavel_financeiro ADD CONSTRAINT FK_Responsavel_financeiro_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_Professor_carteira_de_identificacao_do_professor, fk_Professor_fk_Funcionario_n__do_pis, fk_Professor_fk_Funcionario_conta_bancaria, fk_Professor_fk_Funcionario_fk_pessoa_id)
    REFERENCES Professor (carteira_de_identificacao_do_professor, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_3
    FOREIGN KEY (fk_segmento_Nome_do_segmento)
    REFERENCES segmento (Nome_do_segmento)
    ON DELETE RESTRICT;
 
ALTER TABLE EAD ADD CONSTRAINT FK_EAD_2
    FOREIGN KEY (FK_Aluno_id_da_matricula, FK_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE presencial ADD CONSTRAINT FK_presencial_2
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_3
    FOREIGN KEY (fk_Trasportador_escolar_Numero_da_placa, fk_Trasportador_escolar_fk_pessoa_id)
    REFERENCES Trasportador_escolar (Numero_da_placa, fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_4
    FOREIGN KEY (fk_Responsavel_financeiro_conta_bancaria, fk_Responsavel_financeiro_fk_pessoa_id)
    REFERENCES Responsavel_financeiro (conta_bancaria, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_5
    FOREIGN KEY (fk_segmento_Nome_do_segmento)
    REFERENCES segmento (Nome_do_segmento)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_6
    FOREIGN KEY (fk_lista_materiais_id_lista)
    REFERENCES lista_materiais (id_lista)
    ON DELETE RESTRICT;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_7
    FOREIGN KEY (fk_matriz_escolar_id_matriz)
    REFERENCES matriz_escolar (id_matriz)
    ON DELETE RESTRICT;
 
ALTER TABLE material_papelaria ADD CONSTRAINT FK_material_papelaria_2
    FOREIGN KEY (fk_produto_id_produto)
    REFERENCES produto (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE material_papelaria ADD CONSTRAINT FK_material_papelaria_3
    FOREIGN KEY (fk_fornecedor_cnpj)
    REFERENCES fornecedor (cnpj)
    ON DELETE RESTRICT;
 
ALTER TABLE material_papelaria ADD CONSTRAINT FK_material_papelaria_4
    FOREIGN KEY (fk_instituicao_cnpj)
    REFERENCES instituicao (cnpj)
    ON DELETE RESTRICT;
 
ALTER TABLE material_papelaria ADD CONSTRAINT FK_material_papelaria_5
    FOREIGN KEY (fk_selo_inmetro_id_registro)
    REFERENCES selo_inmetro (id_registro)
    ON DELETE SET NULL;
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_2
    FOREIGN KEY (fk_categoria_produto_endereco_estante)
    REFERENCES categoria_produto (endereco_estante)
    ON DELETE RESTRICT;
 
ALTER TABLE lista_materiais ADD CONSTRAINT FK_lista_materiais_2
    FOREIGN KEY (fk_matriz_escolar_id_matriz)
    REFERENCES matriz_escolar (id_matriz)
    ON DELETE CASCADE;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (fk_venda_id_venda)
    REFERENCES venda (id_venda)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (fk_produto_id_produto)
    REFERENCES produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE promove ADD CONSTRAINT FK_promove_1
    FOREIGN KEY (fk_instituicao_cnpj)
    REFERENCES instituicao (cnpj)
    ON DELETE RESTRICT;
 
ALTER TABLE promove ADD CONSTRAINT FK_promove_2
    FOREIGN KEY (fk_palestra_debate_id_evento)
    REFERENCES palestra_debate (id_evento)
    ON DELETE SET NULL;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_1
    FOREIGN KEY (fk_autor_id_autor)
    REFERENCES autor (id_autor)
    ON DELETE RESTRICT;
 
ALTER TABLE produz ADD CONSTRAINT FK_produz_2
    FOREIGN KEY (fk_livro_cadastro_id_livro, fk_livro_cadastro_fk_produto_id_produto, fk_livro_cadastro_id_cadastro)
    REFERENCES livro_cadastro (id_livro, fk_produto_id_produto, id_cadastro)
    ON DELETE RESTRICT;
 
ALTER TABLE subordinado_a ADD CONSTRAINT FK_subordinado_a_1
    FOREIGN KEY (fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario (n__do_pis, conta_bancaria, fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE subordinado_a ADD CONSTRAINT FK_subordinado_a_2
    FOREIGN KEY (fk_instituicao_cnpj)
    REFERENCES instituicao (cnpj)
    ON DELETE RESTRICT;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_2
    FOREIGN KEY (fk_Funcionario_da_saude_registro_do_conselho_regional, fk_Funcionario_da_saude_Profissao, fk_Funcionario_da_saude_fk_Funcionario_n__do_pis, fk_Funcionario_da_saude_fk_Funcionario_conta_bancaria, fk_Funcionario_da_saude_fk_Funcionario_fk_pessoa_id)
    REFERENCES Funcionario_da_saude (registro_do_conselho_regional, Profissao, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_3
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE RESTRICT;
 
ALTER TABLE e_ensinado_por ADD CONSTRAINT FK_e_ensinado_por_1
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE e_ensinado_por ADD CONSTRAINT FK_e_ensinado_por_2
    FOREIGN KEY (fk_Professor_carteira_de_identificacao_do_professor, fk_Professor_fk_Funcionario_n__do_pis, fk_Professor_fk_Funcionario_conta_bancaria, fk_Professor_fk_Funcionario_fk_pessoa_id)
    REFERENCES Professor (carteira_de_identificacao_do_professor, fk_Funcionario_n__do_pis, fk_Funcionario_conta_bancaria, fk_Funcionario_fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE estuda__Disciplina_EAD_presencial ADD CONSTRAINT FK_estuda__Disciplina_EAD_presencial_1
    FOREIGN KEY (fk_Disciplina_nome_da__discplina)
    REFERENCES Disciplina (nome_da__discplina)
    ON DELETE NO ACTION;
 
ALTER TABLE estuda__Disciplina_EAD_presencial ADD CONSTRAINT FK_estuda__Disciplina_EAD_presencial_2
    FOREIGN KEY (fk_EAD_senha, fk_EAD_FK_Aluno_id_da_matricula, fk_EAD_FK_Aluno_fk_pessoa_id)
    REFERENCES EAD (senha, FK_Aluno_id_da_matricula, FK_Aluno_fk_pessoa_id)
    ON DELETE NO ACTION;
 
ALTER TABLE estuda__Disciplina_EAD_presencial ADD CONSTRAINT FK_estuda__Disciplina_EAD_presencial_3
    FOREIGN KEY (fk_presencial_senha_catraca, fk_presencial_fk_Aluno_id_da_matricula, fk_presencial_fk_Aluno_fk_pessoa_id)
    REFERENCES presencial (senha_catraca, fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    ON DELETE NO ACTION;
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_2
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE SET NULL;
 
ALTER TABLE compra ADD CONSTRAINT FK_compra_3
    FOREIGN KEY (fk_Produtos_cantina_nome_produto)
    REFERENCES Produtos_cantina (nome_produto)
    ON DELETE SET NULL;
 
ALTER TABLE composto_por ADD CONSTRAINT FK_composto_por_1
    FOREIGN KEY (fk_lista_materiais_id_lista)
    REFERENCES lista_materiais (id_lista)
    ON DELETE RESTRICT;
 
ALTER TABLE composto_por ADD CONSTRAINT FK_composto_por_2
    FOREIGN KEY (fk_produto_id_produto)
    REFERENCES produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE possui_desconto_para ADD CONSTRAINT FK_possui_desconto_para_1
    FOREIGN KEY (fk_Aluno_id_da_matricula, fk_Aluno_fk_pessoa_id)
    REFERENCES Aluno (id_da_matricula, fk_pessoa_id)
    ON DELETE SET NULL;
 
ALTER TABLE possui_desconto_para ADD CONSTRAINT FK_possui_desconto_para_2
    FOREIGN KEY (fk_palestra_debate_id_evento)
    REFERENCES palestra_debate (id_evento)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_informacoes_evento_id)
    REFERENCES informacoes_evento (id)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_palestra_debate_id_evento)
    REFERENCES palestra_debate (id_evento)
    ON DELETE SET NULL;