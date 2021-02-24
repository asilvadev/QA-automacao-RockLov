Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @loging_page.open
  @loging_page.with(email, password)

  expect(@dash_page.ondash?).to be true
end

Dado("que acesso o formulario de cadastro de anuncio") do
  @dash_page.goto_equipo_form
end
Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipos(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("então deve ter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end

#remover anuncio
Dado("que eu tenho um anuncio indesejado:") do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path #reload page after api inject equipo
end

Quando("eu solicito a exclusão desse item") do
  @dash_page.request_removal(@equipo[:name])

  sleep 1 #think time (simulação do usuario)
end

Quando("confirmo a exclusão") do
  @dash_page.confirm_removal
end
Quando("não confirmo a solicitação") do
  @dash_page.cancel_removal
end

Então("não devo ver esse item no meu Dashboard") do
  expect(@dash_page.has_no_equipo?(@equipo[:name])).to be true
end

Então("esse item deve permanecer no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @equipo[:name]
end
