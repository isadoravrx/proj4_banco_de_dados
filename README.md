# PROJETO 4 BANCO DE DADOS - GRAND FINALE

Grupo: 
- Gabriel Torres
- Isadora Xavier
- Marcelo Henrique
- Maria Eduarda Santana da Silva Barros
<br/><br/>

### > Visualização da apresentação em slides
<a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/apresentacao_slide.pdf">Slides</a>
<br/>

### > Triggers:
> <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/trigger/triggers.sql">Arquivo com Triggers</a>

1. Atualizar a quantidade de livros disponíveis após uma compra.
2. Atualizar a quantidade de livros que o aluno comprou após uma compra.
3. Atualizar o saldo da cantina do aluno após uma compra.
4. Diminuir a quantidade de produtos na cantina após a compra.
<br/>

### > Stored Procedures:
**1. Oferecer desconto por categoria**
   > Adiciona um desconto em uma categoria de produtos<br/>
   > <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/stored_procedures/procedure_1.sql">[Implementação]</a>

**2. Calcular total vendas do produto**
   > Calcula o total de vendas do produto em um intervalo de tempo<br/>
   > <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/stored_procedures/procedure_2.sql">[Implementação]</a>

**3. Criar  relatório de vendas do vendedor**
   > Cria um relatório de vendas de um vendedor em um intervalo de tempo<br/>
   > <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/stored_procedures/procedure_3.sql">[Implementação]</a>

**4. Criar relatório de melhores vendedores**
   > Cria um relatório para exibir os melhores vendedores em um intervalo<br/>
   > <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/stored_procedures/procedure_4.sql">[Implementação]</a>

<br/>

###  > Views:

**1. Produtos mais comprados por cliente:** 
> Quais são os produtos mais comprado de um cliente específico?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view1">[Implementação]</a>

**2. Serviços:** 
> Quais são os tipos de serviços mais registrados em compra: download, entrega ou retirada?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view2">[Implementação]</a>
     
**3. EaD x Presencial:** 
> Qual a quantidade de alunos cursando presencial e a quantidade de alunos cursando EAD?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view3">[Implementação]</a>

**4. Inadimplência:** 
> Quais responsáveis financeiros estão com pendências no status de pagamento de seus dependentes?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view4">[Implementação]</a>

**5. Mais vendidos:** 
> Quais são os produtos mais vendidos da livraria?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view5">[Implementação]</a>

**6. Média de compra por tipo de cliente e tipo de pagamento:** 
> Qual o valor médio de compra por cliente? Qual o valor médio por tipo de pagamento?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view6">[Implementação]</a>

**7. Bairros comuns:** 
> Quais os bairros mais comuns entre os alunos?<br/>
     <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/views/view7">[Implementação]</a>

<br/>

###  > Segurança: 
1. Apenas coordenadores podem inserir ou deletar a tabela disciplina.  <br/>
2. Apenas os gerentes da escola podem inserir ou deletar a tabela departamento.  <br/>
3. Apenas os vendedores da livraria podem inserir ou deletar a tabela cadastro.  <br/>
4. Apenas organizadores de evento da livraria podem inserir ou deletar a tabela palestra_debate.  <br/>
  <br/>
<a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/seguranca/seguranca.sql">[Visualização da segurança]</a>
<br/>
<br/>

### > Normalização:

Modificações:
- Tabela palestra_debate
  > 3FN: Foi criada uma nova tabela para referenciar a lotação máxima de uma sala, que não depende da chave primária
  id_evento, mas depende de qual sala acontecerá o evento, que é um atributo não-chave. Assim, será identificada a
  partir de uma chave estrangeira que relaciona cada sala com sua capacidade.

- Tabela servico
  > 3FN: Foi criada uma nova tabela para referenciar a taxa_servico que pertence a cada tipo de serviço. Isso porque
  a taxa não depende do id_servico, mas depende do tipo do serviço (dependência entre dois atributos não-chave).
  Assim, quando o tipo for “retirada” a taxa sempre será R$0; sempre que for “entrega” a taxa terá um valor fixo de
  R$15 e quando “download”, R$5. Portanto, a taxa será identificada a partir de uma chave estrangeira tipo_servico.

- Tabela venda
  > 3FN: Foi criada uma nova tabela para referenciar o desconto no valor do produto, que se relaciona com cada método de
  pagamento. Isso porque quando o método for pix ou dinheiro há um desconto no valor do produto. Assim, o desconto
  não depende da chave primária id_venda, porém, há uma dependência do desconto com o método de pagamento, que
  são ambos atributos não-chave. Portanto, foi necessária a modificação.
  
- Tabela material_papelaria
  > 3FN: Foi criada uma nova tabela sobre a certificação do inmetro pois o tipo_teste não é gerado e não tem dependência do
  fk_id_produto, porém, o certificado do inmetro depende do tipo_teste realizado, assim, um atributo não chave depende de
  outro atributo não-chave. 
  
- Tabela aluno
  > 3FN: Foi criada uma nova tabela para referenciar o turno de um aluno a partir da sua série. Isso porque não existe dependência
  do turno com a chave primária id_matriz_escolar, mas o turno em uma escola depende apenas da série (atributo não-chave), pois apenas
  ensino médio estuda à tarde enquanto fundamental pela manhã.
<br/>
   <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/blob/main/normalizacao/documentacao_normalizacao.pdf">[Visualizar documentação de normalização]</a>
<br/>
<br/>


### > CRUD:
> <a href = "https://github.com/isadoravrx/proj4_banco_de_dados/tree/main/nest-crud">Implementação do CRUD</a>
<br/>

