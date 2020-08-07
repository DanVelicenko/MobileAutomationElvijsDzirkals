class RegistrationScreen

  def initialize
    @register_now_button = Elements.new(:id , 'btnRegister')
    @full_name_field = Elements.new(:id , 'etFullName')
    @email_field = Elements.new(:id , 'etEmail')
    @password_field = Elements.new(:id , 'etPassword')
    @confirmation_field = Elements.new(:id , 'etConfirmPassword')
    @sign_up_button = Elements.new(:id , 'btnSignUp')
    @log_in_button = Elements.new(:id , 'btnLogin')
  end

  def input_full_name(text)
    @full_name_field.set(text)
  end

  def input_email(text)
    @email_field.set(text)
  end

  def input_password(text)
    @password_field.set(text)
  end

  def input_repeat_password(text)
    @confirmation_field.set(text)
  end

  def click_sign_up_button
    @sign_up_button.click
  end

  def click_register_now_button
    @register_now_button.click
  end

  def click_full_name_field
    @full_name_field.click
  end

  def click_login_button
    @log_in_button.click
  end

end