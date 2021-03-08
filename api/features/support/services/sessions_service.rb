require_relative "base_service"

class SessionsService < BaseService
  def auth_user(key, token)
    payload = { key: key, token: token }
    result = self.class.get(
      "/members/me",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
      },
    )
    return result
  end
end
