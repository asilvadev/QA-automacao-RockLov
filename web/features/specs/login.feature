#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "alan_log@temp.vc" e "pwd123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<msg_output>"

        Exemplos:
            | email_input  | senha_input | msg_output                       |
            | alan@temp.vc | huehue      | Usuário e/ou senha inválidos.    |
            | hue@temp.vc  | huehue      | Usuário e/ou senha inválidos.    |
            | alan*temp.vc | pwd123      | Oops. Informe um email válido!   |
            |              | pwd123      | Oops. Informe um email válido!   |
            | alan@temp.vc |             | Oops. Informe sua senha secreta! |

