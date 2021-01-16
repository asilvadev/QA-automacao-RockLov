Dado('que estou logado com {string} e {string}') do |email, password|
    @email = email
    
    @loging_page.open
    @loging_page.with(email, password)

end
  
Dado('que acesso o formulario de cadastro de anuncio') do
    click_button "Criar anúncio"

    #checkpoint que garante que está no local correto
    expect(page).to have_css "#equipoForm"

end
  Dado('que eu tenho o seguinte equipamento:') do |table|                            
    @anuncio = table.rows_hash

    MongoDB.new.remove_equipos(@anuncio[:nome], @email)
end                                                                                
                                                                                     
Quando('submeto o cadastro desse item') do  
    
    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb] 

    find("#thumbnail input[type]", visible: false).set thumb                                   
    find('input[placeholder$=equipamento]').set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find('input[placeholder^=Valor]').set @anuncio[:preco]

    click_button "Cadastrar"
    # sleep 10

end                                                                                
                                                                                     
Então('devo ver esse item no meu Dashboard') do                                    
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end                                                                                