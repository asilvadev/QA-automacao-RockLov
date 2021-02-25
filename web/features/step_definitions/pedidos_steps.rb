Dado("que meu perfil de anúnciante é {string} e {string}") do |email, password|
  @email_anunciante = email
  @password_anunciante = password
end

Dado("o seguinte equipamento cadastrado") do |table|
  user_id = SessionsService.new.get_user_id(@email_anunciante, @password_anunciante)

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  MongoDB.new.remove_equipos(@equipo[:name], @email_anunciante)

  result = EquiposService.new.create(@equipo, user_id)
  @equipo_id = result.parsed_response["_id"]
end

Dado("acesso o meu dashboard") do
  @loging_page.open
  @loging_page.with(@email_anunciante, @password_anunciante)

  expect(@dash_page.ondash?).to be true
end

Quando("{string} e {string} e solicita a locação desse equiqo") do |email, password|
  user_id = SessionsService.new.get_user_id(email, password)
  EquiposService.new.booking(@equipo_id, user_id)
end

Então("devo ver a seguinte mensagem:") do |doc_string|
  expect_messege = doc_string.gsub("DATA_ATUAL", Time.now.strftime("%d/%m/%Y"))

  expect(@dash_page.order).to have_text expect_messege
end

Então("devo ver os links: {string} e {string} no pedido") do |btn_accept, btn_reject|
  expect(@dash_page.order_actions(btn_accept)).to be true
  expect(@dash_page.order_actions(btn_reject)).to be true
end
