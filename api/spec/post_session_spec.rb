require_relative "routes/sessions"

describe "POST /sessrion" do
  context "login com sucesso" do
    before(:all) do
      payload = {
        email: "alan2@temp.vc",
        password: "pwd123",
      }
      @result = Sessions.new.login(payload)
    end

    it "validar status code" do
      expect(@result.code).to eql 200
    end

    it "validar id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
  context "senha invalida" do
    before(:all) do
      payload = {
        email: "alan2@temp.vc",
        password: "1pwd123",
      }
      @result = Sessions.new.login(payload)
    end

    it "validar status code" do
      expect(@result.code).to eql 401
    end

    it "validar error" do
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
    end
  end
end
