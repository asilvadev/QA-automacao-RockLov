Before do
  @alert = Alert.new
  @loging_page = LoginPage.new
  @signup_page = SignUp.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  page.current_window.resize_to(1440, 900)
end
