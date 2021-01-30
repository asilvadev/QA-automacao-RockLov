#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
        * Login com "alan2@temp.vc" e "pwd123"


    Cenario: Novo equipamento
        Dado que acesso o formulario de cadastro de anuncio
            E que eu tenho o seguinte equipamento:
                | thumb     | fender-sb.jpg |
                | nome      | Fender Strato |
                | categoria | Cordas        |
                | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard