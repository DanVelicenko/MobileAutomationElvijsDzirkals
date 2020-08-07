And(/^I open foundation section$/) do
  @screens.main_screen.click_first_menu_button
end

And(/^I add visible items to wish list$/) do
  @screens.foundation_screen.add_items_to_wishlist
end

And(/^I go to my wish list$/) do
  @screens.main_screen.click_overflow_menu_button
  @screens.main_screen.click_wishlist_button
end

When(/^I register a new account and login$/) do
  steps %{
    When I click on the overflow menu
    And I tap on log in button
    And I choose to register a new account
    And I input new user credentials in registration form
    And I submit the details for registration
    Then I can login with those details
  }
end

And(/^I can see items added in the same order as before$/) do
  @screens.foundation_screen.verify_wishlist_items
end
