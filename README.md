# Bem vindo à DEVinHouse <img width="180px" alt="Philips" src="ExerciciosM03S07/images/logo-phil.png"/>
## Módulo 03 - Semana 07

Repositório criado para a elaboração dos 7 exercícios referentes a PL/SQL dessa semana. <br>

Para visualizar os exercícios, <a href="https://github.com/GeorgeEnriqueBravo/DEVinHouse-Modulo03-Semana07/archive/refs/heads/main.zip" target="_blank">
    clique aqui
</a>
para baixa-los. <br>

Após o download, extraia os arquivos zipados e abra o arquivo `exercicios_Modulo03_Semana07.sql` e também todos os arquivos de `Procedures`,  localizado na pasta ExerciciosM03S07 utilizando o `Oracle SQL Develover`. Caso você não possua ele, você pode baixar ele grátis diretamente do site oficial <a href="https://www.oracle.com/database/sqldeveloper/technologies/download/" target="_blank">
    clicando aqui
</a>.

Execute todos os arquivos de Procedures para criá-los. Após isso você pode ir verificando a execução de cada exercício individualmente pelo arquivo exercicios_Modulo03_Semana07.sql.

---

# Lista de exercícios <img width="75px" alt="Philips" src="ExerciciosM03S07/images/lista.png"/>
### [M3S07] Ex 1 - Crie um cursor para atualizar tabela produto

Crie um Cursor utilizando um loop que faça um UPDATE na tabela Produto mudando a coluna Status = 0 dos registros 1, 2 e 3.

### [M3S07] Ex 2 - Listar dados ProdutoPreco

Crie um Cursor que imprima na tela os dados Id, Status e Preco para listar e IF e Else dentro do cursor para verificar se o status do produto está ativo e se o preço está menor que 1000,00.

### [M3S07]  Ex 3 - Criar Procedure com nome ExibirTodosProdutos

Criar uma Procedure que imprimi todos os dados da tabela Produto utilizando o Cursor.

### [M3S07] Ex 4 - Na Procedure nome ExibirTodosProdutos implementar exception

Na Procedure ExibirTodosProdutos colocar a exception NO_DATA_FOUD e imprimir a mensagem com Erro, dados não encontrados.

### [M3S07] Ex 5 - Crie uma Procedure chamada AtualizarProdutoPreco

Criar a procedure para atualizar o preço do produto passando o parâmetros ID e Valor novo do produto.

Na procedure precisa criar o CUSTOM EXCEPTION para validar a regra de negócio a seguir.

- Validar se o produto existe na base de dados
   - Se não existir criar o erro 20001 com mensagem Produto não existe
- Verificar se o status do produto está desativado
   - Se o produto estiver com o status desativado criar o erro 20002 com mensagem Produto está desativado na tabela

### [M3S07] Ex 6 - Criar Procedure chamada DeletarProduto

Criar procedure para efetuar o Deletar do registro na tabela recebendo o parametro ID.

Dica, pode utilizar o Cursor com FORALL.

Regra:

- Verificar se o produto não está sendo utilizado na tabela ProdutoPreco
- Verificar se o status do produto está ativo

Caso essas regras não existam pode excluir o registro, se não mostrar mensagem de erro.

### [M3S07] Ex 7 - Criar Procedure com nome ListarProdutoPrecoPorIdProduto

Criar uma procedure precisa criar o parâmetro in do tipo ID e utilizar parâmetro out do valor somado do produto preço

Regra:

- Criar o INNER JON entre a tabela produto e produto preço
- Fazer o filtro por IDProduto
‌

Dicas:

- Utilizar Cursor
- Utilizar Loop para armazenar a somatória dos produtos
- Criar uma Exception caso o dados não existam
- Criar uma variável para efetuar o out do dados somados <br><br>

---

# O que é DEVinHouse?
DEVinhouse é uma jornada de aceleração da carreira com: grade curricular direcionada, professores do mercado, prática constante, interação frequente com as houses parceiras de cada turma, simulação do dia-a-dia DEV e vagas exclusivas que são abertas pelas Houses durante a jornada.

No DEVinHouse você vira um desenvolvedor Fullstack em 9 meses, ao longo de 900 horas de conteúdo, divididas em três módulos de 3 meses cada, com intervalo de uma semana entre cada um. Aproximadamente 25 horas de dedicação por semana entre aulas, atividades e vivências.

__1º módulo:__ Front-End – JavaScript e Angular <br/>
__2º módulo:__ Back-End – Java, Spring e SQL <br/>
__3º módulo:__ Full-Stack – Scrum, DevOps, Clean Code e Design Patterns <br/>
__Ferramentas__ – GitHub, Trello e Slack

---

# Tecnologias Utilizadas <img width="35px" alt="🌐" src="ExerciciosM03S07/images/tag.gif"/>
Nos exercícios dessa semana foram utilizadas as seguintes tecnologias:
<div style="display: inline_block">
    <img align="center" alt="Oracle" src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=black"/>
    <img align="center" alt="Oracle" src="https://img.shields.io/badge/PLSQL-F80000?style=for-the-badge&logo=oracle&logoColor=black"/>
    <img align="center" alt="Trello" src="https://img.shields.io/badge/Trello-0052CC?style=for-the-badge&logo=trello&logoColor=white"/>
    <img align="center" alt="GitHub" src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>
</div>


