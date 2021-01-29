
class EquiposPage
    include Capybara::DSL

    def create(equipo)
        page.has_css?("#equipoForm") 

        thumb = Dir.pwd + "/features/support/fixtures/images/" + equipo[:thumb] 

        find("#thumbnail input[type]", visible: false).set thumb                                   
        find('input[placeholder$=equipamento]').set equipo[:nome]
        find("#category").find('option', text: equipo[:categoria]).select_option
        find('input[placeholder^=Valor]').set equipo[:preco]

        click_button "Cadastrar"
    end


end