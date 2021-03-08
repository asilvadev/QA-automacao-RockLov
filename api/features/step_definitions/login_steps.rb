Dado("que forneco minhas credenciais {string} e {string}") do |key, token|
  @key = key
  @token = token
end

Quando("faço a requisição à uri de autenticacao") do
  @result = SessionsService.new.auth_user(@key, @token)
end

Então("devo ver o seguinte codigo: {string}") do |code|
  expect(@result.code).to eql code.to_i
end

Então("devo ver o seguinte email: {string}") do |email|
  expect(@result.parsed_response["email"]).to eql email
end

Então("a mensagem de alerta: {string}") do |msg_alert|
  expect(@result.parsed_response).to eql msg_alert
end
