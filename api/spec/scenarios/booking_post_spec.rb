describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    result = Sessions.new.login({ email: "ed@temp.vc", password: "pwd123" })
    @user_locator_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do
      #dado que "alguem" tem um "equipamento" para locação

      result = Sessions.new.login({ email: "joe@temp.vc", password: "pwd123" })
      user_id = result.parsed_response["_id"]

      payload = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender to rent",
        category: "Cordas",
        price: 150,
      }

      MongoDB.new.remove_equipo(payload[:name], user_id)

      result = Equipos.new.create(payload, user_id)
      user_equipo_id = result.parsed_response["_id"]

      #quando solicito a locação do equipo
      @result = Equipos.new.booking(user_equipo_id, @user_locator_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
