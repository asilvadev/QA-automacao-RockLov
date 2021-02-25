#language: pt

Funcionalidade: Receber pedido de locação
    Sendo um anúnciante que possui equipamentos cadastrados
    Desejo receber pedidos de locação
    Para que eu possa decidir se quero aprova-los ou rejeita-los

    Cenario: Receber pedido
        Dado que meu perfil de anúnciante é "anunciante@temp.vc" e "pwd123"
            E o seguinte equipamento cadastrado
            | thumb     | trompete.jpg |
            | nome      | Trompete     |
            | categoria | Outros       |
            | preco     | 100          |
            E acesso o meu dashboard
        Quando "locataria@temp.vc" e "pwd123" e solicita a locação desse equiqo
        Então devo ver a seguinte mensagem:
            """
            locataria@temp.vc deseja alugar o equipamento: Trompete em: DATA_ATUAL
            """
            E devo ver os links: "ACEITAR" e "REJEITAR" no pedido


