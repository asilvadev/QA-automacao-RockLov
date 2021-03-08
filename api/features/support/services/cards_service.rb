require_relative "base_service"

class CardsServices < BaseService
  def create_card(key, token, idList, name_card)
    payload = { key: key, token: token, idList: idList, name: name_card }
    result = self.class.post(
      "/cards",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end

  def edit_card(key, token, id_Card, new_name)
    idCard = id_Card
    payload = { key: key, token: token, name: new_name }
    result = self.class.put(
      "/cards/#{idCard}",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end
end
