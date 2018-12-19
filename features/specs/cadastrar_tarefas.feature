#language: pt

@sprint2
Funcionalidade: Cadastrar tarefas
    Para que eu possa organizar minhas atividades
    Sendo um usuário cadastrado
    Posso cadastrar novas tarefas

    - Nome da tarefa: Fazer compras
    - Data de entrega: 25/06/2018
    - Tags (compras, supermercado, ketchup)

    @login @nova_tarefa @logout
    Cenario: Nova tarefa
        Dado que eu tenho uma tarefa com os seguintes atributos:
            | nome | Fazer Compras |
            | data | 25/06/2018    |
        E eu quero taguear esta tarefa com:
            | tag          |
            | supermercado |
            | ketchup      |
            | compras      |
        Quando faço o cadastro dessa tarefa
        Então devo ver está tarefa com o status "Em andamento"
        E devo ver somente 1 tarefa com o nome cadastrado

    @login @tarefa_duplicada @logout
    Cenario: Tarefa não pode ser duplicada
        Dado que eu tenho uma tarefa com os seguintes atributos:
            | nome | Ler um livro de Go Lang |
            | data | 25/06/2018              |
        E eu quero taguear esta tarefa com:
            | tag      |
            | go       |
            | estudar  |
            | livro    |
            | hardcore |
        Mas eu já cadastrei esta tarefa e não tinha percebido
        Quando faço o cadastro dessa tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar cadastrar
        E devo ver somente 1 tarefa com o nome cadastrado

    @desafio
    Cenario: Valor mínimo
        Dado que eu tenho uma tarefa com o seguintes atributos:
            | nome | Mongo      |
            | data | 25/06/2018 |
        Quando faço o cadastro dessa tarefa
        Então devo ver a mensagem "O nome da tarefa deve ter no minimo 10 caracteres" ao tentar cadastrar