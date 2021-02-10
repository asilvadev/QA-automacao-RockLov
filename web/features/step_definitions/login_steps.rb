Dado("que acesso a pagina principal") do
  @loging_page.open
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, password|
  @loging_page.with(email, password)
end
