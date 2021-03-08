Dado("auth com {string} e {string}") do |lkey, ltoken|
  @lkey = lkey
  @ltoken = ltoken
end

Dado("que estou autorizado no sistema e crio um board {string} e uma lista {string}") do |name_board, name_list|
  @result_board = BoardsServices.new.create_board(@lkey, @ltoken, name_board)

  @result_list = BoardsServices.new.create_listonBoard(@lkey, @ltoken, @result_board.parsed_response["id"], name_list)
end

Quando("faço a requisição da criação do card, para a lista acima, com o seguinte nome: {string}") do |name_card|
  $result_card = CardsServices.new.create_card(@lkey, @ltoken, @result_list.parsed_response["id"], name_card)
end

Então("devo ver o codigo de retorno: {string}") do |code|
  expect($result_card.code).to eql code.to_i
end

Então("devo ver o seguinte nome do card criado: {string}") do |name_card|
  expect($result_card.parsed_response["name"]).to eql name_card
end

Dado("que estou autorizado no sistema e tenho a ID do Card") do
  @idCard = $result_card.parsed_response["id"]
  @oldName = $result_card["name"]
end

Quando("faço a requisição de atualização com o seguinte nome: {string}") do |new_name|
  @result_edit_card = CardsServices.new.edit_card(@lkey, @ltoken, @idCard, new_name)
end

Então("o seguinte nome no card: {string}") do |new_name|
  expect(@result_edit_card.parsed_response["name"]).to eql new_name
end

Então("não o nome antigo: {string}") do |old_name|
  expect(@result_edit_card.parsed_response["name"]).not_to eql old_name # Write code here that turns the phrase above into concrete actions
end
