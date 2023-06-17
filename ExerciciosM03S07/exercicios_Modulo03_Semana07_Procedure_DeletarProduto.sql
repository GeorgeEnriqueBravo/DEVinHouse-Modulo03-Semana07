/* Exercício 06 - Criar Procedure chamada DeletarProduto

Criar procedure para efetuar o Deletar do registro na tabela recebendo o parametro ID.

Dica, pode utilizar o Cursor com FORALL

Regra
 - Verificar se o produto não está sendo utilizado na tabela ProdutoPreco
 - Verificar se o status do produto está ativo

Caso essas regras não existam pode excluir o registro, se não mostrar mensagem de erro     */

CREATE OR REPLACE PROCEDURE DeletarProduto(pId NUMBER)
IS
--DECLARE -- DECLARE criado apenas para teste
    --pId NUMBER := 14; -- variável criada apenas para teste
    
    vStatus NUMBER;
    
    ProdutoUtilizadoNaTabelaProdutoPrecoException EXCEPTION;
    ProdutoAtivadoException EXCEPTION;
    
    PRAGMA EXCEPTION_INIT(ProdutoUtilizadoNaTabelaProdutoPrecoException, -1001);
    PRAGMA EXCEPTION_INIT(ProdutoAtivadoException, -1002);

BEGIN

    FOR produtoPreco IN (SELECT Id_Produto FROM ProdutoPreco WHERE ID = pId) LOOP 
            RAISE ProdutoUtilizadoNaTabelaProdutoPrecoException;
    END LOOP;
    /* -- Outra forma de fazer essa verificação acima
    FOR produtoPreco IN (SELECT Id_Produto FROM ProdutoPreco) LOOP 
        IF produtoPreco.Id_Produto = pId THEN
            RAISE ProdutoUtilizadoNaTabelaProdutoPrecoException;
        END IF;
    END LOOP;
    */
    
    SELECT Status INTO vStatus FROM Produto WHERE ID = pId;
    
    IF vStatus = 1 THEN
        RAISE ProdutoAtivadoException;
    END IF;
    
    DELETE FROM Produto WHERE ID = pId;
    
EXCEPTION
    WHEN ProdutoUtilizadoNaTabelaProdutoPrecoException THEN
        DBMS_OUTPUT.PUT_LINE('Desculpe, não foi possível deletar, este produto está sendo utilizado na tabela ProdutoPreco!');
    WHEN ProdutoAtivadoException THEN
        DBMS_OUTPUT.PUT_LINE('Desculpe, não foi possível deletar, este produto se encontra ATIVO no sistema!');
END;

/*
SELECT * FROM Produto;
SELECT * FROM ProdutoPreco;
SELECT * FROM ProdutoPreco WHERE ID = 15;
SELECT * FROM Produto LEFT JOIN ProdutoPreco ON Produto.Id = ProdutoPreco.Id_Produto;

INSERT INTO Produto(Id, Descricao, Status, Cadastro, QuantidadeEmEstoque) VALUES(16, 'PRODUTO X', 0, CURRENT_TIMESTAMP, 10);
INSERT INTO Produto(Id, Descricao, Status, Cadastro, QuantidadeEmEstoque) VALUES(17, 'PRODUTO Z', 1, CURRENT_TIMESTAMP, 10);
INSERT INTO Produto(Id, Descricao, Status, Cadastro, QuantidadeEmEstoque) VALUES(18, 'PRODUTO Z', 1, CURRENT_TIMESTAMP, 10);

INSERT INTO ProdutoPreco(Id_Produto, Valor, Status, Cadastro) VALUES(18, 150.99, 1, CURRENT_TIMESTAMP);

UPDATE Produto SET Status = 0 WHERE Id = 17;
UPDATE ProdutoPreco SET Status = 0 WHERE Id = 15;

DELETE FROM ProdutoPreco WHERE ID = 17;
*/