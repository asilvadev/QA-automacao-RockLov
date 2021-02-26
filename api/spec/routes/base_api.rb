require "httparty"

class BaseApi
  include HTTParty
  base_uri "http://localhost:3333"
end
