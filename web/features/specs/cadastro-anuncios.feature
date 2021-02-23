#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
        * Login com "alanCA@temp.vc" e "pwd123"


    Cenario: Novo equipamento
        Dado que acesso o formulario de cadastro de anuncio
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @temp-anuncio
    Esquema do Cenario: Tentativa de cadastro de anuncios

        Dado que acesso o formulario de cadastro de anuncio
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então então deve ter a mensagem de alerta: "<out_put>"

        Exemplos:
            | foto          | nome              | categoria | preco | out_put                              |
            |               | Violao ne Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros    | 150a  | O valor da diária deve ser numérico! |