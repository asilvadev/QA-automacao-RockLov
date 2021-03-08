Dado("que estou autorizado no sistema") do
  result = SessionsService.new.auth_user(@lkey, @ltoken)

  @boards = result.parsed_response["idBoards"]
end

Quando("faço a requisição de limpeza") do
  @boards.each do |board|
    BoardsServices.new.cleaningup(@lkey, @ltoken, board)
  end
end

Então("não tevo ter nenhum board criado") do
  result = SessionsService.new.auth_user(@lkey, @ltoken)
  expect(result.parsed_response["idBoards"]).to eql []
end
