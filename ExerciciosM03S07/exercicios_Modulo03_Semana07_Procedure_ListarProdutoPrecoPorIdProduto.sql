/* Exercício 07 - Criar Procedure com nome ListarProdutoPrecoPorIdProduto

Criar uma procedure precisa criar o parâmetro in do tipo ID e utilizar parâmetro out do valor somado do produto preço

Regra:
- Criar o  INNER JOIN entre a tabela produto e produto preço
- Fazer o filtro por IDProduto

Dicas:
- Utilizar Cursor
- Utilizar Loop para armazenar a somatória dos produtos
- Criar uma Exception caso o dados não existam
- Criar uma variável para efetuar o out do dados somados     */


CREATE OR REPLACE PROCEDURE ListarProdutoPrecoPorIdProduto(pId NUMBER, pMsgValorSomado OUT VARCHAR2)
IS
--DECLARE -- DECLARE criado apenas para teste
    --pId NUMBER := 14; -- variável criada apenas para teste
    
    nValorSomado NUMBER;

BEGIN

    -- SELECT * FROM Produto INNER JOIN ProdutoPreco ON Produto.Id = ProdutoPreco.Id_Produto WHERE Id_Produto = pId;
    
    SELECT SUM(ProdutoPreco.Valor) INTO nValorSomado FROM Produto INNER JOIN ProdutoPreco ON Produto.Id = ProdutoPreco.Id_Produto WHERE Id_Produto = pId;
    
    pMsgValorSomado := 'Valor Somado = ' || nValorSomado;
    
END;