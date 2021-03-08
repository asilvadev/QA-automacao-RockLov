describe "POST /equipos" do
  before(:all) do
    payload = { email: "tomate@temp.vc", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "novo equipo" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"),
        name: "kramer do Eddie Van Hallen",
        category: "Cordas",
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end

  context "nao autorizado" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("baixo.jpg"),
        name: "Contra Baixo",
        category: "Cordas",
        price: 59,
      }

      # MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, nil)
    end

    it "deve retornar 401" do
      expect(@result.code).to eql 401
    end
  end
end
