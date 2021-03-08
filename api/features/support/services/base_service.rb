require "httparty"

class BaseService
  include HTTParty
  base_uri "https://api.trello.com/1"
end
