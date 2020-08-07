When(/^I click on the overflow menu$/) do
  @screens.main_screen.click_overflow_menu_button
end

And(/^I tap on log in button$/) do
  @screens.main_screen.click_log_in_button
end

And(/^I choose to register a new account$/) do
  @screens.registration_screen.click_register_now_button
end


When(/^I input new user credentials in registration form$/) do
  @full_name = "name#{rand(1..99999)} surname#{rand(1..99999)}"
  @email = "email#{rand(1..99999)}@gmail.com"
  @password = "Parole123!"
  @screens.registration_screen.input_full_name(@full_name)
  @screens.registration_screen.input_email(@email)
  @screens.registration_screen.input_password(@password)
  @screens.registration_screen.input_repeat_password(@password)
end

And(/^I submit the details for registration$/) do
  @screens.registration_screen.click_sign_up_button
end

Then(/^I can login with those details$/) do
  @screens.registration_screen.input_email(@email)
  @screens.registration_screen.input_password(@password)
  @screens.registration_screen.click_login_button
end

And(/^My profile section shows my full name$/) do
  expected = @screens.my_profile_screen.get_name_field_text
  actual = @full_name
  raise "Incorrect text! Expected: [#{expected}], actual: [#{actual}]" unless expected == actual
end

And(/^My profile section shows my email$/) do
  expected = @screens.my_profile_screen.get_email_field_text
  actual = @email
  raise "Incorrect text! Expected: [#{expected}], actual: [#{actual}]" unless expected == actual
end

And(/^I go to My profile section$/) do
  @screens.main_screen.click_my_profile_button
end

And(/^I input existing user details$/) do
  @existing_email = "testemail@testing.com"
  @screens.registration_screen.input_email(@existing_email)
  @screens.registration_screen.input_password(@password)
  @screens.registration_screen.input_password(@password)
end

And(/^I tap on log in at registration screen$/) do
  @screens.registration_screen.click_login_button
end


Then(/^My profile section shows existing users email$/) do
  expected = @screens.my_profile_screen.get_email_field_text
  actual = @existing_email
  raise "Incorrect text! Expected: [#{expected}], actual: [#{actual}]" unless expected == actual
end

And(/^My profile section shows existing users name$/) do
  expected = @screens.my_profile_screen.get_name_field_text
  actual = "Tester Tester"
  raise "Incorrect text! Expected: [#{expected}], actual: [#{actual}]" unless expected == actual
end