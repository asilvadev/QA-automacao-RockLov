#language: pt

Funcionalidade: Cards
    Sendo eu um usuario autenticado do Trello
    Quero gerenciar meu board
    Para que eu possa criar/editar meus cartões

    Contexto: Auth
        * auth com "a86ac064d1b4a80abf11f70f3732bf0d" e "4f6f133e61aefbeb0b247cbf0a7162916c112b36579fa449cfe038ea5362cd7c"


    @create_card
    Cenario: Criando um novo cartão via API
        Dado que estou autorizado no sistema e crio um board "BoardTesteTrelloAPI" e uma lista "Backlog"
        Quando faço a requisição da criação do card, para a lista acima, com o seguinte nome: "nome teste"
        Então devo ver o codigo de retorno: "200"
            E devo ver o seguinte nome do card criado: "nome teste"


    @edit_card
    Cenario: Editando o card via API
        Dado que estou autorizado no sistema e tenho a ID do Card
        Quando faço a requisição de atualização com o seguinte nome: "nome edit card via API"
        Então devo ver o codigo de retorno: "200"
            E o seguinte nome no card: "nome edit card via API"
            E não o nome antigo: "nome teste"


