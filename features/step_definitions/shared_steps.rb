Então('sou redirecionado para o Dashboard') do                                         
    expect(page).to have_css ".dashboard"
end 

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    expect(@Alert.dark).to eql expect_alert
end