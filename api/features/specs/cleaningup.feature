#language: pt

Funcionalidade: Limpeza
    Sendo eu um usuario autenticado do Trello
    Quero limpar todo o trabalho feito pela automação
    Para que eu possa ter um resetado

    Contexto: Auth
        * auth com "a86ac064d1b4a80abf11f70f3732bf0d" e "4f6f133e61aefbeb0b247cbf0a7162916c112b36579fa449cfe038ea5362cd7c"


    @cleaningup
    Cenario: Limpando a automação feita via API
        Dado que estou autorizado no sistema
        Quando faço a requisição de limpeza
        Então não tevo ter nenhum board criado