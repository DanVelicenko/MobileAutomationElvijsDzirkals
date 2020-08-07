class MyProfileScreen

  def initialize
    @name_field = Elements.new(:id , 'tvProfileName')
    @email_field = Elements.new(:id , 'tvProfileEmail')
  end

  def get_name_field_text
    @name_field.get_text
  end

  def get_email_field_text
    @email_field.get_text
  end

end