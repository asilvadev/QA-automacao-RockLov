#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibiliza-los para locação

    @cadastro
    Cenario: Fazer cadastro
        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formulario de cadastro:
            | nome       | email        | senha  |
            | Alan Silva | alan@temp.vc | pwd123 |
        Então sou redirecionado para o Dashboard


    Esquema do Cenario: Tentativa de cadastro
        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formulario de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<msg_output>"

        Exemplos:
            | nome_input | email_input  | senha_input | msg_output                       |
            |            | alan@temp.vc | pwd123      | Oops. Informe seu nome completo! |
            | Alan Silva |              | pwd123      | Oops. Informe um email válido!   |
            | Alan Silva | alan*temp.vc | pwd123      | Oops. Informe um email válido!   |
            | Alan Silva | alan@temp.vc |             | Oops. Informe sua senha secreta! |
