-- Exercício 03 - Criar Procedure com nome ExibirTodosProdutos
-- Criar uma Procedure que imprimi todos os dados da tabela Produto utilizando o Cursor

CREATE OR REPLACE PROCEDURE ExibirTodosProdutos 
IS
--DECLARE -- DECLARE criado apenas para teste
    CURSOR cursor_produto IS SELECT Id, Descricao, Status, Cadastro, Quantidadeemestoque FROM Produto;
    nId NUMBER;
    vDescricao VARCHAR2(200);
    nStatus NUMBER;
    vCadastro TIMESTAMP;
    nQtdEstoque NUMBER;
    
BEGIN
    OPEN cursor_produto;
        LOOP
            FETCH cursor_produto INTO nId, vDescricao, nStatus, vCadastro, nQtdEstoque;
                EXIT WHEN cursor_produto%NOTFOUND;
                
                DBMS_OUTPUT.PUT_LINE('Id: '  || nId  || '  -  Descrição: ' ||  vDescricao || '  -  Cadastro: ' || vCadastro || '  -  Quantidade em Estoque: ' || nQtdEstoque);
        END LOOP;
    CLOSE cursor_produto;    
    
-- Exercício 04 - Na Procedure nome ExibirTodosProdutos implementar exception
-- Na Procedure ExibirTodosProdutos colocar a exception NO_DATA_FOUD e imprimir a mensagem com Erro, dados não encontrados
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro, dados não encontrados');
        DBMS_OUTPUT.PUT_LINE('Número do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);
END;


