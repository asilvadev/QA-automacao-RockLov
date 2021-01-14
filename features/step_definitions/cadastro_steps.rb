Dado('que acesso a pagina de cadastro') do                                           
  visit "/signup"
end                                                                                  
                                                                                     
Quando('submeto o seguinte formulario de cadastro:') do  |table|

  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])
  
  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]

  click_button "Cadastrar"
end    
                                                                         

                                                                                 
