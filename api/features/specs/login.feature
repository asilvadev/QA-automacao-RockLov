#language: pt

Funcionalidade: Autenticação
    Sendo eu um usuario do Trello
    Quero fazer minha autenticacao
    Para que eu possa gerenciar meus cartões

    @auth
    Cenario: Autenticando via API
        Dado que forneco minhas credenciais "f2202d9c773b5e0d1cfa9f5ddc5303b9" e "7a5c2ca5884a503c4f26a475d65ef0d9a52869206038757016a441b46f928803"
        Quando faço a requisição à uri de autenticacao
        Então devo ver o seguinte codigo: "200"
            E devo ver o seguinte email: "woxome6820@mailnest.net"

    @try_auth
    Esquema do Cenario: Tentativas de Autenticacao via API
        Dado que forneco minhas credenciais "<key>" e "<token>"
        Quando faço a requisição à uri de autenticacao
        Então devo ver o seguinte codigo: "<code>"
            E a mensagem de alerta: "<msg_alert>"

        Exemplos:
            | key                              | token                                                            | code | msg_alert     |
            | f2202d9c773b5e0d1cfa9f5ddc5303b9 | 7a5c4f26a475dc2ca5884a50365ef0d9a52869206038757016a441b46f928803 | 401  | invalid token |
            | 25e0d1d9c773bcfa9f220f5ddc5303b9 | 7a5c2ca588d65ef0d9a5286924a503c4f26a47506038757016a441b46f928803 | 401  | invalid key   |
            | f2202d9c773b5e0d1cfa9f5ddc5303b  | 7a5c2ca5884a503c4f26a475d65ef0d9a52869206038757016a441b46f928803 | 401  | invalid key   |
            |                                  | 7a5c2ca5884a503c4f26a475d65ef0d9a52869206038757016a441b46f928803 | 400  | invalid token |
            | f2202d9c773b5e0d1cfa9f5ddc5303b9 |                                                                  | 400  | invalid token |


