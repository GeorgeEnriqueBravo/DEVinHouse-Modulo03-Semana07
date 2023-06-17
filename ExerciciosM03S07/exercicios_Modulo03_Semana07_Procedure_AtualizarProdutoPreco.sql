-- Exerc�cio 05 - Crie uma Procedure chamada AtualizarProdutoPreco
-- Criar a procedure para atualizar o pre�o do produto passando o par�metros ID e Valor novo do produto.
-- Na procedure precisa criar o CUSTOM EXCEPTION para validar a regra de neg�cio a seguir.
-- Validar se o produto existe na base de dados
-- Se n�o existir criar o erro 20001 com mensagem Produto n�o existe
-- Verificar se o status do produto est� desativado
-- Se o produto estiver com o status desativado criar o erro 20002 com mensagem Produto est� desativado na tabela

CREATE OR REPLACE PROCEDURE AtualizarProdutoPreco(pId NUMBER, pValorNovo NUMBER)
IS
--DECLARE -- DECLARE criado apenas para teste
    --pId NUMBER := 1; -- vari�vel criada apenas para teste
    --pValorNovo NUMBER := 35.55; -- vari�vel criada apenas para teste
    
    vStatus NUMBER;
    verificaId VARCHAR2(200) := 'n�o encontrado';
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
    
   IF verificaId = 'n�o encontrado' THEN
      RAISE ProdutoNaoExisteException;
   END IF;
   
    /* -- Outra forma de fazer a verifica��o acima
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
        DBMS_OUTPUT.PUT_LINE('Produto n�o existe');
        DBMS_OUTPUT.PUT_LINE('N�mero do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);
    WHEN ProdutoDesativadoException THEN
        DBMS_OUTPUT.PUT_LINE('Produto est� desativado na tabela');
        DBMS_OUTPUT.PUT_LINE('N�mero do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);

END;