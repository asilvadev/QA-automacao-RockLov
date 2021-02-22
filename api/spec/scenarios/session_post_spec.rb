describe "POST /session" do
  context "login com sucesso" do
    before(:all) do
      payload = {
        email: "betao@hotmail.com",
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

  exemples = [
    {
      title: "Wrong Password",
      payload: { email: "betao@hotmail.com", password: "1pwd123" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "Wrong Email",
      payload: { email: "404@temp.vc", password: "1pwd123" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "Blank Email input",
      payload: { email: "", password: "1pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "Undefined Email",
      payload: { password: "1pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "Blank Password input",
      payload: { email: "temp", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "Undefined Password",
      payload: { email: "temp" },
      code: 412,
      error: "required password",
    },
  ]
  # puts exemples.to_json #gerar estrutura em json para converter em yml

  # exemples = YAML.load(File.read(Dir.pwd + "/spec/fixtures/login.yml", symbolize_names: true))

  exemples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "validar status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "validar error #{e[:error]}" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
