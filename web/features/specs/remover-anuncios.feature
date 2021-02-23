#language: pt
Funcionalidade: Remover Anuncios
    Sendo um anuncio que possui um equipamento indesejado
    Quero poder remover esse anuncio
    Para que eu possa manter o meu Dashboard atualizado

    Cenario: Remover um anuncio
        Dado que eu tenho um anuncio indesejado:
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard

    Cenario: Desistir da exclusão
        Dado que eu tenho um anuncio indesejado:
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 150       |
        Quando eu solicito a exclusão desse item
            Mas nãoo confirmo a solicitação
        Então devo ver esse item no meu Dashboard