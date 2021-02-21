describe "POST /signup" do
  context "New User" do
    before(:all) do
      payload = {
        name: "Rb",
        email: "alanRN@temp.vc",
        password: "pwd123",
      }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "validar status code" do
      expect(@result.code).to eql 200
    end

    it "validar id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "User already exists" do
    before(:all) do
      payload = {
        name: "Jão",
        email: "jao@temp.vc",
        password: "pwd123",
      }
      MongoDB.new.remove_user(payload[:email])

      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end

    it "validar status code" do
      expect(@result.code).to eql 409
    end
    it "must return error message" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  #Desafio Autmacao180
  exemples = [
    {
      title: "Blank Name input",
      payload: { name: "", email: "ins@temp.vc", password: "1pwd123" },
      code: 412,
      error: "required name",
    },
    {
      title: "Undifined Name input",
      payload: { email: "ins@temp.vc", password: "1pwd123" },
      code: 412,
      error: "required name",
    },
    {
      title: "Blank Email input",
      payload: { name: "Ins", email: "", password: "1pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "Undefined Email input",
      payload: { name: "Ins", password: "1pwd123" },
      code: 412,
      error: "required email",
    },
    {
      title: "Wrong Email input",
      payload: { name: "Ins", email: "ins*temp.vc", password: "1pwd123" },
      code: 412,
      error: "wrong email",
    },
    {
      title: "Blank Password input",
      payload: { name: "Ins", email: "ins@temp.vc", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "Undefined Password input",
      payload: { name: "Ins", email: "ins@temp.vc" },
      code: 412,
      error: "required password",
    },
  ]

  exemples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "validar status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "must return error message: #{e[:error]}" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
