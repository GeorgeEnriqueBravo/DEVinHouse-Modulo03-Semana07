/* Exerc�cio 07 - Criar Procedure com nome ListarProdutoPrecoPorIdProduto

Criar uma procedure precisa criar o par�metro in do tipo ID e utilizar par�metro out do valor somado do produto pre�o

Regra:
- Criar o  INNER JOIN entre a tabela produto e produto pre�o
- Fazer o filtro por IDProduto

Dicas:
- Utilizar Cursor
- Utilizar Loop para armazenar a somat�ria dos produtos
- Criar uma Exception caso o dados n�o existam
- Criar uma vari�vel para efetuar o out do dados somados     */


CREATE OR REPLACE PROCEDURE ListarProdutoPrecoPorIdProduto(pId NUMBER, pMsgValorSomado OUT VARCHAR2)
IS
--DECLARE -- DECLARE criado apenas para teste
    --pId NUMBER := 14; -- vari�vel criada apenas para teste
    
    nValorSomado NUMBER;

BEGIN

    -- SELECT * FROM Produto INNER JOIN ProdutoPreco ON Produto.Id = ProdutoPreco.Id_Produto WHERE Id_Produto = pId;
    
    SELECT SUM(ProdutoPreco.Valor) INTO nValorSomado FROM Produto INNER JOIN ProdutoPreco ON Produto.Id = ProdutoPreco.Id_Produto WHERE Id_Produto = pId;
    
    pMsgValorSomado := 'Valor Somado = ' || nValorSomado;
    
END;