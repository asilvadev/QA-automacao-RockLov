require_relative "base_service"

class BoardsServices < BaseService
  def create_board(key, token, name_board)
    payload = { key: key, token: token, name: name_board }
    result = self.class.post(
      "/boards",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end

  def create_listonBoard(key, token, id_board, name_list)
    payload = { key: key, token: token, name: name_list }
    idBoard = id_board
    result = self.class.post(
      "/boards/#{idBoard}/lists",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end

  def cleaningup(key, token, id_board)
    payload = { key: key, token: token }
    idBoard = id_board
    result = self.class.delete(
      "/boards/#{idBoard}",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end
end
