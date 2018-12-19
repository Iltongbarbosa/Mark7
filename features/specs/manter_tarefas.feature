#language: pt

@sprint4
Funcionalidade: Atualização de tarefas
    Para que eu possa deixar meu painel organizado
    Sendo um usuário que possui uma tarefa cadastrada
    Posso realizar atualização das tarefas

    @autenticado
    Cenario: Editar uma tarefa
        Dado que tenho uma tarefa cadastrada
        Quando eu edito a tarefa e confirmo
        Então os dados da tarefa devem atualizados

    @autenticado
    Cenario: Editar e fnizalizar uma tarefa
        Dado que tenho uma tarefa cadastrada
        Quando eu edito a tarefa e seleciono a opção Finalizado e confirmo
        Então os dados da tarefa devem atualizados e o status deve ser "Finalizado"
    
    @autenticado
    Cenario: Editar uma tarefa finalizada
        Dado que tenho uma tarefa com status "Finalizado"
        Quando eu edito a tarefa e removo a seleção finalizado e confirmo
        Então os dados da tarefa devem atualizados e o status deve ser "Em andamento"

    @autenticado
    Cenario: Fnizalizar uma tarefa
        Dado que tenho uma tarefa cadastrada
        Quando eu finalizo a tarefa 
        Então o status da tarefa deve ser "Finalizado"