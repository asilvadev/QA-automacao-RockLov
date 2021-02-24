require_relative "base_service"

class EquiposService < BaseService
  def create(payload, user_id)
    self.class.post(
      "/equipos",
      body: payload,
      headers: {
        "user_id": user_id,
      },
    )
  end
end
