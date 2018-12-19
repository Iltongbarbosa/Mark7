#language: pt

@sprint3
Funcionalidade: Remover uma tarefa
    Para que eu possa deixar meu painel organizado
    Sendo um usuário que possui uma tarefa indesejada
    Posso excluir tarefas

    @autenticado
    Cenario: Apagar uma tarefa
        Dado que tenho uma tarefa indesejada
        Quando eu solicito a exclusão desta tarefa
        E confirmo a ação de exclusão
        Então esta tarefa não deve ser exibida na lista

    @autenticado
    Cenario: Desistir da remoção
        Dado que tenho uma tarefa indesejada
        Quando eu solicito a exclusão desta tarefa
        Mas eu cancelo esta ação
        Então esta tarefa permanece na lista