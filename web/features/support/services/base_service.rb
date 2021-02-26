require "httparty"

class BaseService
  include HTTParty
  base_uri "http://localhost:3333"
end
