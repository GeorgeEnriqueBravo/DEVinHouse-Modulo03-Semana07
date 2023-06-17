-- Exerc�cio 01 - Crie um cursor para atualizar tabela produto
-- Crie um Cursor utilizando um loop que fa�a um UPDATE na tabela Produto mudando a coluna Status = 0 dos registros 1, 2 e 3

DECLARE
    CURSOR cursor_produto IS SELECT Id, Status FROM Produto WHERE ID IN (1, 2, 3);
    v_id NUMBER;
    v_status NUMBER;
    
BEGIN 
    OPEN cursor_produto;
        LOOP
            FETCH cursor_produto INTO v_id, v_status;
            EXIT WHEN cursor_produto%NOTFOUND;
                
            UPDATE Produto SET Status = 1 WHERE ID = v_id;
    
            DBMS_OUTPUT.PUT_LINE('Status da linha ' || v_id || ' atualizado com sucesso para 0');

        END LOOP; 
    CLOSE cursor_produto;
END;

-- SELECT * FROM PRODUTO WHERE ID BETWEEN 1 AND 12;

-- Exerc�cio 02 - Listar dados ProdutoPreco
-- Crie um Cursor que imprima na tela os dados Id, Status e Preco, utilizando FORALL para listar e IF e Else para verificar se o status do produto est� ativo e se o pre�o est� menor que 1000,00.

DECLARE
    CURSOR cursor_produto_preco IS SELECT Id, Status, Valor FROM ProdutoPreco ORDER BY Valor DESC;
    v_id NUMBER;
    v_status NUMBER;
    v_valor NUMBER;

BEGIN
    OPEN cursor_produto_preco;
        LOOP
            FETCH cursor_produto_preco INTO v_id, v_status, v_valor;
            EXIT WHEN cursor_produto_preco%NOTFOUND;
        
            IF (v_status = 1 AND v_valor < 1000) THEN
                DBMS_OUTPUT.PUT_LINE('Id: ' || v_id || ' - Status: ' || v_status || ' - Pre�o: ' || v_valor);
            END IF;
        END LOOP; 
    CLOSE cursor_produto_preco;
END;

    
-- Exerc�cio 03 - Criar Procedure com nome ExibirTodosProdutos
-- Exerc�cio 04 - Na Procedure nome ExibirTodosProdutos implementar exception

EXECUTE ExibirTodosProdutos(); -- verificar essa procedure para resposta do Ex03 e Ex04

-- Exerc�cio 05 - Crie uma Procedure chamada AtualizarProdutoPreco

EXECUTE AtualizarProdutoPreco(1, '165,55');

-- Exerc�cio 06 - Criar Procedure chamada DeletarProduto

EXECUTE DeletarProduto(17);

-- Exercicio 07 - Criar Procedure com nome ListarProdutoPrecoPorIdProduto

DECLARE
    vOut VARCHAR2(200);
BEGIN
    ListarProdutoPrecoPorIdProduto(1, vOut);
    DBMS_OUTPUT.PUT_LINE(vOut);
END;
                
