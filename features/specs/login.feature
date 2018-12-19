#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário cadastrado
    Posso logar no sistema

    # email e senha
    # DDT => Data Driven Testing

    Contexto: Formulário
        Dado que eu acessei o formulário de login
    
    @login @logout
    Cenario: Login do usuário

        Quando faço login com "ilton.io@ninja.com.br " e "123456"
        Então sou autenticado com sucesso
        E sou redirecionado para o painel de tarefas com a mensagem "Olá, Ilton"
    
    Esquema do Cenário: Tentativa de logar

        Quando faço login com "<email>" e "<senha>"
        Então devo ver a mensagem de alerta "<saida>"

        Exemplos: 
        | email                     			        | senha   | saida                       |
        | ilton.io@ninja.com.br              			| 654321  | Senha inválida.             |
        | joao.das.neves@dancadascadeiras.org 	        | xpto123 | Usuário não cadastrado.     |
        | ilton&qaninja.io       			            | 123456  | Email incorreto ou ausente. |
        |                           			        | xpto123 | Email incorreto ou ausente. |
        | ilton.io@ninja.com.br        			        |         | Senha ausente.              |
        |                                               |         | Email incorreto ou ausente. |