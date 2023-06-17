-- Exercício 05 - Crie uma Procedure chamada AtualizarProdutoPreco
-- Criar a procedure para atualizar o preço do produto passando o parâmetros ID e Valor novo do produto.
-- Na procedure precisa criar o CUSTOM EXCEPTION para validar a regra de negócio a seguir.
-- Validar se o produto existe na base de dados
-- Se não existir criar o erro 20001 com mensagem Produto não existe
-- Verificar se o status do produto está desativado
-- Se o produto estiver com o status desativado criar o erro 20002 com mensagem Produto está desativado na tabela

CREATE OR REPLACE PROCEDURE AtualizarProdutoPreco(pId NUMBER, pValorNovo NUMBER)
IS
--DECLARE -- DECLARE criado apenas para teste
    --pId NUMBER := 1; -- variável criada apenas para teste
    --pValorNovo NUMBER := 35.55; -- variável criada apenas para teste
    
    vStatus NUMBER;
    verificaId VARCHAR2(200) := 'não encontrado';
    Contador NUMBER;
    
    ProdutoNaoExisteException EXCEPTION;
    ProdutoDesativadoException EXCEPTION;
    
    PRAGMA EXCEPTION_INIT(ProdutoNaoExisteException, -20001);
    PRAGMA EXCEPTION_INIT(ProdutoDesativadoException, -20002);
    
BEGIN
    
    FOR produto IN (SELECT Id FROM ProdutoPreco) LOOP 
        IF produto.Id = pId THEN
            verificaId := 'encontrado';
        END IF;
    END LOOP;
    
   IF verificaId = 'não encontrado' THEN
      RAISE ProdutoNaoExisteException;
   END IF;
   
    /* -- Outra forma de fazer a verificação acima
    SELECT COUNT(*) INTO Contador FROM Produto WHERE ID = pId;
   IF Contador = 0 THEN
      RAISE ProdutoNaoExisteException;
   END IF;     
    */
    
   SELECT Status INTO vStatus FROM ProdutoPreco WHERE ID = pId; 
   
   IF vStatus = 0 THEN
      RAISE ProdutoDesativadoException;
   END IF;
   
   UPDATE ProdutoPreco SET Valor = pValorNovo WHERE Id = pId;

   --SELECT * FROM ProdutoPreco;

EXCEPTION
    WHEN ProdutoNaoExisteException THEN
        DBMS_OUTPUT.PUT_LINE('Produto não existe');
        DBMS_OUTPUT.PUT_LINE('Número do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);
    WHEN ProdutoDesativadoException THEN
        DBMS_OUTPUT.PUT_LINE('Produto está desativado na tabela');
        DBMS_OUTPUT.PUT_LINE('Número do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);

END;