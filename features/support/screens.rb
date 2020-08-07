class Screens

  def main_screen
    @main_screen ||= MainScreen.new
  end

  def registration_screen
    @registration_screen ||= RegistrationScreen.new
  end

  def my_profile_screen
    @my_profile_screen ||= MyProfileScreen.new
  end

  def foundation_screen
    @foundation_screen ||= FoundationScreen.new
  end

end