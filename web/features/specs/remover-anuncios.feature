#language: pt
Funcionalidade: Remover Anuncios
    Sendo um anuncio que possui um equipamento indesejado
    Quero poder remover esse anuncio
    Para que eu possa manter o meu Dashboard atualizado

    Contexto: Login
        * Login com "alanRA@temp.vc" e "pwd123"

    Cenario: Remover um anuncio
        Dado que eu tenho um anuncio indesejado:
            | thumb     | amp.jpg |
            | nome      | AMP     |
            | categoria | Outros  |
            | preco     | 225     |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard
    
    @temp-rmv
    Cenario: Desistir da exclusão
        Dado que eu tenho um anuncio indesejado:
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 150       |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a solicitação
        Então esse item deve permanecer no meu Dashboard