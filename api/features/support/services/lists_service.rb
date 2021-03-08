require_relative "base_service"

class ListsServices < BaseService
  def create_lists(key, token, id_board, name)
    payload = { key: key, token: token, idBoard: id_board, name: name }
    result = self.class.get(
      "/lists/",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end
end
