Dado('que estou logado com {string} e {string}') do |email, password|
    @email = email
    
    @loging_page.open
    @loging_page.with(email, password)

end
  
Dado('que acesso o formulario de cadastro de anuncio') do
    @dash_page.goto_equipo_form

end
  Dado('que eu tenho o seguinte equipamento:') do |table|                            
    @anuncio = table.rows_hash

    MongoDB.new.remove_equipos(@anuncio[:nome], @email)
end                                                                                
                                                                                     
Quando('submeto o cadastro desse item') do  
    @equipos_page.create(@anuncio)
end                                                                                
                                                                                     
Então('devo ver esse item no meu Dashboard') do                                    
    expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end                                                                                