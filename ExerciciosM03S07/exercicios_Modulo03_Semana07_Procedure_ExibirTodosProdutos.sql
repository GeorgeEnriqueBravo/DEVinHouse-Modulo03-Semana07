-- Exerc�cio 03 - Criar Procedure com nome ExibirTodosProdutos
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
                
                DBMS_OUTPUT.PUT_LINE('Id: '  || nId  || '  -  Descri��o: ' ||  vDescricao || '  -  Cadastro: ' || vCadastro || '  -  Quantidade em Estoque: ' || nQtdEstoque);
        END LOOP;
    CLOSE cursor_produto;    
    
-- Exerc�cio 04 - Na Procedure nome ExibirTodosProdutos implementar exception
-- Na Procedure ExibirTodosProdutos colocar a exception NO_DATA_FOUD e imprimir a mensagem com Erro, dados n�o encontrados
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro, dados n�o encontrados');
        DBMS_OUTPUT.PUT_LINE('N�mero do erro gerado: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem de erro do Oracle: ' || SQLERRM);
END;


